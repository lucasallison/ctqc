use std::collections::HashMap;
use std::fmt;

use bitvec::prelude::*;
use fxhash::FxBuildHasher;
use rand::prelude::*;

use super::pauli_string::utils as PauliUtils;
use super::pauli_string::PauliGate;
use super::shared::coefficient_list::CoefficientList;
use super::shared::floating_point_opc::FloatingPointOPC;
use super::utils::imaginary_coefficient::ImaginaryCoef;

use crate::generator_sets::pauli_map::PauliMap;
use crate::generator_sets::pauli_string::PauliString;

/// A struct that is constructed from a generator set in order to sample measurements.
pub struct MeasurementSampler {
    pauli_strings: BitVec,
    generator_info: Vec<CoefficientList>,
    n_qubits: usize,
    size: usize,
}

impl MeasurementSampler {
    pub fn new(
        pauli_strings: BitVec,
        generator_info: Vec<CoefficientList>,
        n_qubits: usize,
    ) -> MeasurementSampler {
        let mut ms = MeasurementSampler {
            pauli_strings,
            generator_info,
            n_qubits,
            size: 0,
        };
        ms.size = ms.generator_info.len();
        ms
    }

    pub fn from_map(
        mut map: HashMap<BitVec, CoefficientList, FxBuildHasher>,
        n_qubits: usize,
    ) -> MeasurementSampler {
        let mut ms = MeasurementSampler {
            pauli_strings: BitVec::with_capacity(2 * map.len() * n_qubits),
            generator_info: Vec::with_capacity(map.len()),
            n_qubits: n_qubits,
            size: 0,
        };

        for (pstr, coefficients) in map.drain() {
            if coefficients.is_empty() {
                continue;
            }
            ms.pauli_strings.extend_from_bitslice(&pstr);
            ms.generator_info.push(coefficients);
        }

        ms.size = ms.generator_info.len();
        ms
    }

    pub fn size(&self) -> usize {
        self.size
    }

    /// Measure the ith qubit and return a sampled result: true for |1⟩ and false for |0⟩.
    /// Also return the probability of sampling |0⟩.
    pub fn sample(&mut self, i: usize) -> (bool, f64) {
        let p0 = 0.5 + 0.5 * self.sum_z_stabilizer_coefficients(i);

        // Measure false or true with probability p0 or 1-p0 respectively
        let measurement = [(false, p0), (true, 1.0 - p0)]
            .choose_weighted(&mut thread_rng(), |item| item.1)
            .unwrap()
            .0;

        self.measurement_update(i, measurement, p0);

        (measurement, p0)
    }

    /// Returns the bitslice with the bits of the Pauli string at the given index
    fn pstr_as_bitslice(&self, pstr_ind: usize) -> &BitSlice {
        let start = 2 * pstr_ind * self.n_qubits;
        let end = start + 2 * self.n_qubits - 1;
        &self.pauli_strings[start..=end]
    }

    /// Creates a vector which at each index (representing the generator index)
    /// contains another vector of tuples. The tuples represent the Pauli strings
    /// that comprise the sum of the stabilizer generator with the corresponding
    /// index. Each tuple contains the index of the Pauli string and the coefficient.
    fn create_gen_to_pstr_map(&self) -> Vec<Vec<(usize, FloatingPointOPC)>> {
        // TODO adjust capacity in a smart way?
        let mut gen_to_pstr = vec![Vec::with_capacity(1); self.n_qubits];

        for pstr_index in 0..self.size {
            for c in self.generator_info[pstr_index].coefficients.iter() {
                gen_to_pstr[c.0].push((pstr_index, c.1));
            }
        }

        gen_to_pstr
    }

    /// Multiplies pstr_1 and pstr_2. result is stored in pstr_1 and any coefficient is returned.
    fn multiply_pstrs(&self, pstr_1: &mut BitSlice, pstr_2: &BitSlice) -> ImaginaryCoef {

        let mut coef = ImaginaryCoef::new(1.0, false);

        for i in 0..self.n_qubits {
            let pgate_1 = PauliUtils::get_pauli_gate_from_bitslice(pstr_1, i);
            let pgate_2 = PauliUtils::get_pauli_gate_from_bitslice(pstr_2, i);

            let (c, pgate) = PauliUtils::multiply_pauli_gates(pgate_1, pgate_2);
            coef.multiply(&c);
            PauliUtils::set_pauli_gate_in_bitslice(pstr_1, pgate, i);
        }

        coef
    }

    /// Calculates all combinations of generator multiplications and sums the coefficients
    /// of the Pauli strings that consist of only identity gates and a single Z gate
    /// at the provided index.
    fn sum_z_stabilizer_coefficients(&self, z_index: usize) -> f64 {
        if self.pauli_strings.len() == 0 {
            panic!("Cannot sample measurements without any Pauli strings.");
        }

        let mut sum = FloatingPointOPC::new(0.0);

        let gen_to_pstr = self.create_gen_to_pstr_map();

        // Keep track of the current term of each generator, e.g.,
        // if indexes[0] is 5 we are processing the fifth term of the first generator.
        // We can find the associated Pauli string index at gen_to_pstr[0][5].0
        // and the coefficient at gen_to_pstr[0][5].1
        let mut indexes: Vec<usize> = vec![0; self.size];

        // The generator from which are we going to multiply a term
        let mut gen_ind: usize = 0;

        // The resulting Pauli string and coefficient (multiplied_pstr, multiplied_coef)
        let mut m_pstr = bitvec![0; 2*self.n_qubits]; // only identity gates
        let mut m_coef = ImaginaryCoef::new(1.0, false);

        loop {
            // For each generator multiply the 'm_pstr' with the ith (stored in indexes[gen_ind])
            // term of the generator and update the coefficient accordingly. If we have already
            // multiplied all the terms of the currrent generator we continue to the next, i.e.,
            // when indexes[gen_ind] == gen_to_pstr[gen_ind].len(), to obtain a multiplication
            // of terms without any terms of current generator.
            if indexes[gen_ind] < gen_to_pstr[gen_ind].len() {
                let (pstr_ind, coef) = gen_to_pstr[gen_ind][indexes[gen_ind]];
                let pstr = self.pstr_as_bitslice(pstr_ind);

                let multiply_coef_res = self.multiply_pstrs(&mut m_pstr, pstr);

                m_coef.mutliply_with_fp(&coef);
                m_coef.multiply(&multiply_coef_res);
            }

            gen_ind += 1;

            // We have multiplied `m_pstr` with a term (or no term) of each generator, start backtracking
            if gen_ind == self.n_qubits {
                // TODO explain why !m_coef.i
                // If the result is a Pauli string with a single Z gate at the z_index
                // update the sum

                if !m_coef.i && PauliUtils::is_single_z_pstr(m_pstr.as_bitslice(), z_index) {
                    sum.add(&m_coef.real);
                }

                // Backtrack
                gen_ind -= 1;
                loop {
                    // Undo the multiplication of the indexes[gen_ind] term of the generator with gen_ind
                    if indexes[gen_ind] < gen_to_pstr[gen_ind].len() {
                        let (pstr_ind, coef) = gen_to_pstr[gen_ind][indexes[gen_ind]];
                        let pstr = self.pstr_as_bitslice(pstr_ind);

                        let multiply_coef_res = self.multiply_pstrs(&mut m_pstr, pstr);

                        m_coef.divide_by_fp(&coef);
                        m_coef.divide(&multiply_coef_res);
                    }

                    // Update the indexes[gen_ind] so that we multiply the next term
                    // of the generator with gen_ind
                    indexes[gen_ind] += 1;

                    // We have a term (or explicitely no term when indexesp[gen_ind] == gen_to_pstr[gen_ind].len())
                    // of the generator with gen_ind to multiply with m_pstr, stop backtracking
                    if indexes[gen_ind] <= gen_to_pstr[gen_ind].len() {
                        break;
                    }

                    // We have backtracked the generator with gen_ind, go the the previous one
                    indexes[gen_ind] = 0;

                    if gen_ind == 0 {
                        return sum.as_f64();
                    }
                    gen_ind -= 1;
                }
            }
        }
    }

    /// Given a measruement sample of the ith qutbit, updates all Pauli strings and coefficients according
    /// to the provided measurement.
    // TODO reference explaination?
    fn measurement_update(&mut self, i: usize, measurement: bool, p0: f64) {
        let mut map = HashMap::<BitVec, CoefficientList, FxBuildHasher>::with_capacity_and_hasher(
            self.size,
            FxBuildHasher::default(),
        );

        let mut gen_info = std::mem::take(&mut self.generator_info);

        for (pstr_ind, mut coef_list) in gen_info.drain(..).enumerate() {
            let pstr = self.pstr_as_bitslice(pstr_ind).to_bitvec();
            let target_pgate = PauliUtils::get_pauli_gate_from_bitslice(&pstr, i);

            match target_pgate {
                PauliGate::Y => continue,
                PauliGate::X => {
                    // When we measure |0⟩:
                    // X -> 1/(4p0) * 2X = 1/(2p0) * X
                    // When we measure |1⟩:
                    // X -> 1/(4(1-p0)) * 2X = 1/(2(1-p0)) * X
                    if measurement {
                        coef_list
                            .multiply(&FloatingPointOPC::new_with_ops(1.0 / (2.0 * (1.0 - p0)), 4));
                    } else {
                        coef_list.multiply(&FloatingPointOPC::new_with_ops(1.0 / (2.0 * p0), 3));
                    }

                    PauliMap::insert_pstr_bitvec_into_map(&mut map, pstr, coef_list);
                }
                _ => {
                    // When we measure |0⟩:
                    // Z -> 1/(4p0) * (2I + 2Z) = 1/(2p0) * (I + Z)
                    // I -> 1/(4p0) * (2I + 2Z) = 1/(2p0) * (I + Z)
                    // When we measure |1⟩:
                    // Z -> 1/(4(1-p0)) * (2Z - 2I) = 1/(2(1-p0)) * (Z - I)
                    // I -> 1/(4(1-p0)) * (2I - 2Z) = 1/(2(1-p0)) * (I - Z)

                    let mut new_pstr = BitVec::from_bitslice(&pstr);
                    let changed_pauli_gate = if target_pgate == PauliGate::I {
                        PauliGate::Z
                    } else {
                        PauliGate::I
                    };
                    PauliUtils::set_pauli_gate_in_bitslice(&mut new_pstr, changed_pauli_gate, i);

                    let mut new_coef_list = coef_list.clone();

                    // Both Pauli strings are multilied by this value
                    let mut base_mult = 0.5;
                    // But the new Pauli string (potentially) also by an additional one
                    let mut new_pstr_mult = 1.0;

                    // We measured |1⟩
                    if measurement {
                        base_mult *= 1.0 / (1.0 - p0);
                        new_pstr_mult *= -1.0;
                    } else {
                        base_mult *= 1.0 / (p0);
                    }

                    coef_list.multiply(&FloatingPointOPC::new_with_ops(base_mult, 3));
                    new_coef_list.multiply(&FloatingPointOPC::new_with_ops(
                        base_mult * new_pstr_mult,
                        5,
                    ));

                    PauliMap::insert_pstr_bitvec_into_map(&mut map, pstr, coef_list);
                    PauliMap::insert_pstr_bitvec_into_map(&mut map, new_pstr, new_coef_list)
                }
            }
        }

        self.scatter(map);
    }

    /// Scatter the Pauli strings in the provided map to the bitvec
    // Declared public for Pauli Pools
    fn scatter(&mut self, mut map: HashMap<BitVec, CoefficientList, FxBuildHasher>) {
        self.pauli_strings.clear();
        self.generator_info.clear();

        for (pstr, coefficients) in map.drain() {
            if coefficients.is_empty() {
                continue;
            }
            self.pauli_strings.extend_from_bitslice(&pstr);
            self.generator_info.push(coefficients);
        }

        self.size = self.generator_info.len();
    }
}

impl fmt::Display for MeasurementSampler {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let mut s = String::new();

        for pstr_index in 0..self.size {

            s.push_str(&format!("{}", PauliString::from_bitvec(self.pstr_as_bitslice(pstr_index).to_bitvec())));

            s.push_str(" (");
            for c in self.generator_info[pstr_index].coefficients.iter() {
                s.push_str(&format!("{}: {}, ", c.0, c.1.as_f64()));
            }
            s.push_str(")\n");
        }
        write!(f, "{}", s)
    }
}
