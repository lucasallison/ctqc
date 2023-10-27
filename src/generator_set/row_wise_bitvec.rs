use bitvec::prelude::*;
use fxhash::FxBuildHasher;
use snafu::prelude::*;
use std::collections::{hash_map::Entry, HashMap};
use std::error::Error;
use std::fmt;

use super::conjugation_look_up_tables::CNOT_CONJ_UPD_RULES;
use super::h_s_conjugations_map::HSConjugationsMap;
use super::pauli_string::PauliGate;
use super::GeneratorSet;
use super::coefficient_list::CoefficientList;
use super::ONE_OVER_SQRT_TWO;
use crate::circuit::{Gate, GateType};


pub struct RowWiseBitVec {
    pauli_strings: BitVec,
    generator_info: Vec<CoefficientList>,
    h_s_conjugations_map: HSConjugationsMap,
    num_qubits: usize,
    size: usize,
}

impl RowWiseBitVec {
    // Creates and returns a new RowWiseBitVec with num_qubits qubits.
    pub fn new(num_qubits: usize) -> RowWiseBitVec {
        RowWiseBitVec {
            // We have num_qubits Pauli strings, each with num_qubits gates. Each gate is represented by 2 bits.
            pauli_strings: bitvec![0; 2*num_qubits*num_qubits],
            generator_info: Vec::with_capacity(num_qubits),
            h_s_conjugations_map: HSConjugationsMap::new(num_qubits),
            num_qubits,
            size: 0,
        }
    }

    /// Returns the jth gate of the ith Pauli string
    fn get_pauli_gate(&self, i: usize, j: usize) -> PauliGate {
        let index = self.pstr_gate_index(i, j);
        PauliGate::pauli_gate_from_tuple(self.pauli_strings[index], self.pauli_strings[index + 1])
    }

    /// Sets the jth gate of the ith Pauli string
    fn set_pauli_gate(&mut self, p_gate: PauliGate, i: usize, j: usize) {
        let index = self.pstr_gate_index(i, j);

        let (b1, b2) = PauliGate::pauli_gate_as_tuple(p_gate);

        self.pauli_strings.set(index, b1);
        self.pauli_strings.set(index + 1, b2);
    }

    /// Get the internal index of the jth gate of the ith Pauli string
    fn pstr_gate_index(&self, i: usize, j: usize) -> usize {
        2 * i * self.num_qubits + 2 * j
    }

    /// Get the index of the first bit of the ith Pauli string
    fn pstr_first_bit(&self, i: usize) -> usize {
        2 * i * self.num_qubits
    }

    /// Get the index of the last bit of the ith Pauli string
    fn pstr_last_bit(&self, i: usize) -> usize {
        self.pstr_first_bit(i) + 2 * self.num_qubits - 1
    }

    /// Reset the RowWiseBitVec to its initial state
    fn reset(&mut self) {
        self.pauli_strings = bitvec![0; 2*self.num_qubits*self.num_qubits];

        self.generator_info = Vec::with_capacity(self.num_qubits);
        self.h_s_conjugations_map = HSConjugationsMap::new(self.num_qubits);
        self.size = 0;
    }

    /// Clones the bits of the ith Pauli string and appends them to the end of the bitvec.
    fn extend_from_within(&mut self, i: usize) {
        let start = self.pstr_first_bit(i);
        let end = self.pstr_last_bit(i);
        self.pauli_strings.extend_from_within(start..=end);
    }

    /// Apply the H and S conjugations to the jth gate of the ith Pauli string.
    fn apply_h_s_conjugations(&mut self, i: usize, j: usize) {
        let current_p_gate = self.get_pauli_gate(i, j);
        let actual_p_gate = self.h_s_conjugations_map.get_actual_p_gate(j, current_p_gate);

        self.set_pauli_gate(actual_p_gate, i, j);
        self.generator_info[i].multiply(
            self.h_s_conjugations_map
                .get_coefficient_multiplier(j, current_p_gate),
        );
    }

    /// Conjugate each Pauli string in the bitvec with a CNOT gate.
    /// We use the update rules to adjust the Pauli gates and coefficients.
    fn conjugate_cnot(&mut self, gate: &Gate) -> Result<(), RowWiseBitVecError> {
        let qubit_2 = gate.qubit_2.unwrap();

        for pstr_index in 0..self.size {
            self.apply_h_s_conjugations(pstr_index, gate.qubit_1);
            self.apply_h_s_conjugations(pstr_index, qubit_2);

            let q1_target_p_gate = self.get_pauli_gate(pstr_index, gate.qubit_1);
            let q2_target_p_gate = self.get_pauli_gate(pstr_index, qubit_2);

            let look_up_output = CNOT_CONJ_UPD_RULES
                .get(&(q1_target_p_gate, q2_target_p_gate))
                .unwrap();

            self.generator_info[pstr_index].multiply(look_up_output.coefficient);

            self.set_pauli_gate(look_up_output.q1_p_gate, pstr_index, gate.qubit_1);
            self.set_pauli_gate(look_up_output.q2_p_gate, pstr_index, qubit_2);
        }

        self.h_s_conjugations_map.reset(gate.qubit_1);
        self.h_s_conjugations_map.reset(qubit_2);
        Ok(())
    }

    /// Conjugate each Pauli string in the bitvec with a T gate.
    /// We use the update rules to adjust the Pauli gates and coefficients.
    fn conjugate_t_gate(
        &mut self,
        gate: &Gate,
        conjugate_dagger: bool,
    ) -> Result<(), RowWiseBitVecError> {
        for pstr_index in 0..self.size {
            self.apply_h_s_conjugations(pstr_index, gate.qubit_1);

            let target_p_gate = self.get_pauli_gate(pstr_index, gate.qubit_1);

            match target_p_gate {
                PauliGate::X => {
                    self.generator_info[pstr_index].multiply(*ONE_OVER_SQRT_TWO);

                    // T^{\dag}XT -> 1/sqrt{2} (X - Y)
                    if conjugate_dagger {
                        self.extend_from_within(pstr_index);

                        let mut new_generator_info = self.generator_info[pstr_index].clone();
                        new_generator_info.multiply(-1.0);
                        self.generator_info.push(new_generator_info);

                    // TXT^{\dag} -> 1/sqrt{2} (X + Y)
                    } else {
                        self.extend_from_within(pstr_index);

                        let new_generator_info = self.generator_info[pstr_index].clone();
                        self.generator_info.push(new_generator_info);
                    }

                    self.set_pauli_gate(PauliGate::X, pstr_index, gate.qubit_1);
                    self.set_pauli_gate(PauliGate::Y, self.size, gate.qubit_1);
                    self.size += 1;
                }

                PauliGate::Y => {
                    self.generator_info[pstr_index].multiply(*ONE_OVER_SQRT_TWO);

                    // T^{\dag}YT -> 1/sqrt(2) (Y + X)
                    if conjugate_dagger {
                        self.extend_from_within(pstr_index);

                        let new_generator_info = self.generator_info[pstr_index].clone();
                        self.generator_info.push(new_generator_info);

                    // TYT^{\dag} -> 1/sqrt(2) (Y - X)
                    } else {
                        self.extend_from_within(pstr_index);

                        let mut new_generator_info = self.generator_info[pstr_index].clone();
                        new_generator_info.multiply(-1.0);
                        self.generator_info.push(new_generator_info);
                    }

                    self.set_pauli_gate(PauliGate::Y, pstr_index, gate.qubit_1);
                    self.set_pauli_gate(PauliGate::X, self.size, gate.qubit_1);
                    self.size += 1;
                }

                _ => {
                    continue;
                }
            }
        }

        self.h_s_conjugations_map.reset(gate.qubit_1);
        Ok(())
    }

    /// Gather all unique Pauli strings in a map and merge coefficients for duplicates
    fn gather(&mut self) -> HashMap<BitVec, CoefficientList, FxBuildHasher> {
        let mut map = HashMap::<BitVec, CoefficientList, FxBuildHasher>::with_capacity_and_hasher(
            self.size,
            FxBuildHasher::default(),
        );

        for pstr_ind in 0..self.size {
            let start = self.pstr_first_bit(pstr_ind);
            let end = self.pstr_last_bit(pstr_ind);

            let pstr = self.pauli_strings[start..=end].to_bitvec();
            let gen_info = &self.generator_info[pstr_ind];

            match map.entry(pstr) {
                Entry::Occupied(mut e) => {
                    e.get_mut().merge(gen_info);
                }
                Entry::Vacant(e) => {
                    e.insert(gen_info.clone());
                }
            }
        }
        map
    }

    /// Scatter the Pauli strings in the provided map to the bitvec
    fn scatter(&mut self, map: HashMap<BitVec, CoefficientList, FxBuildHasher>) {
        self.pauli_strings.clear();
        self.generator_info.clear();

        for (pstr, coefficients) in map.iter() {
            if coefficients.is_empty() {
                continue;
            }
            self.pauli_strings.extend_from_bitslice(pstr);
            self.generator_info.push(coefficients.clone());
        }

        self.size = self.generator_info.len();
    }
}

impl GeneratorSet for RowWiseBitVec {
    /// Initialize the RowWiseBitVec with the generators of the all zero state or all plus state.
    fn init_generators(&mut self, zero_state_generators: bool) {
        self.reset();

        let p_gate = if zero_state_generators {
            PauliGate::Z
        } else {
            PauliGate::X
        };

        // Each Pauli string has num_qubit gates and each gate is represented by 2 bits.
        self.pauli_strings = bitvec![0; 2*self.num_qubits*self.num_qubits];

        for generator_index in 0..self.num_qubits {
            self.set_pauli_gate(p_gate, generator_index, generator_index);
            self.generator_info.push(CoefficientList::new(generator_index));
        }

        self.size = self.num_qubits;
    }

    // TODO
    fn is_x_or_z_generators(&mut self, check_zero_state: bool) -> bool {
        false
    }

    /// Conjugates all stored Pauli strings with the provided gate.
    fn conjugate(&mut self, gate: &Gate, conjugate_dagger: bool) -> Result<(), Box<dyn Error>> {
        match gate.gate_type {
            GateType::H | GateType::S => {
                self.h_s_conjugations_map.update(gate, conjugate_dagger);
            }
            GateType::CNOT => self.conjugate_cnot(gate)?,
            GateType::T => self.conjugate_t_gate(gate, conjugate_dagger)?,
        }

        Ok(())
    }

    /// Merges all duplicate Pauli strings and removes all Pauli strings
    /// with zero coefficients.
    fn clean(&mut self) {
        let map = self.gather();
        self.scatter(map);
    }

    fn size(&self) -> usize {
        self.size
    }
}

impl fmt::Display for RowWiseBitVec {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let mut s = String::new();

        for pstr_index in 0..self.size {
            let mut coef_multiplier = 1.0;

            for qubit_index in 0..self.num_qubits {
                let current_p_gate = self.get_pauli_gate(pstr_index, qubit_index);
                let actual_p_gate = self
                    .h_s_conjugations_map
                    .get_actual_p_gate(qubit_index, current_p_gate);

                coef_multiplier *= self
                    .h_s_conjugations_map
                    .get_coefficient_multiplier(qubit_index, current_p_gate);

                s.push_str(&format!("{}", actual_p_gate));
            }

            s.push_str(" (");

            for c in self.generator_info[pstr_index].coefficients.iter() {
                s.push_str(&format!("{}: {}, ", c.0, c.1 * coef_multiplier));
            }
            s.push_str(")\n");
        }
        write!(f, "{}", s)
    }
}

// ------------------ Errors --------------------------------------

#[derive(Debug, Snafu)]
pub enum RowWiseBitVecError {
    #[snafu(display("Index out of bounds."))]
    IndexOutOfBounds {},

    #[snafu(display(
        "Cannot conjugate {} gate with the function `{}`",
        gate_type,
        function_called
    ))]
    InvalidConjugationFunction {
        function_called: String,
        gate_type: GateType,
    },
}

// ------------------ Tests ---------------------------------------

#[cfg(test)]
mod tests {

    use super::*;

    #[test]
    fn test_row_wise_bitvec_merge() {

        // TODO

        // let mut gs = RowWiseBitVec::new(2);

        // gs.init_generators(true);

        // let h0 = &Gate::new(&"H".to_string(), 0, None).unwrap();
        // let t0 = &Gate::new(&"T".to_string(), 0, None).unwrap();

        // gs.conjugate(h0, false).unwrap();
        // gs.conjugate(t0, false).unwrap();
    }

}
