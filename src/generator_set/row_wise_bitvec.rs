use bitvec::prelude::*;
use fxhash::FxBuildHasher;
use ordered_float::OrderedFloat;
use rand::prelude::*;
use std::collections::{hash_map::Entry, HashMap};
use std::error::Error;
use std::fmt;
use std::thread::{self, JoinHandle};

use super::coefficient_list::CoefficientList;
use super::conjugation_look_up_tables::CNOT_CONJ_UPD_RULES;
use super::h_s_conjugations_map::HSConjugationsMap;
use super::pauli_string::PauliGate;
use super::GeneratorSet;
use super::ONE_OVER_SQRT_TWO;
use crate::circuit::{Gate, GateType};
use crate::FP_ERROR_MARGIN;

/// Implementation of a generator set that stores the
/// Pauli strings in a single large bitvec.
pub struct RowWiseBitVec {
    pauli_strings: BitVec,
    generator_info: Vec<CoefficientList>,
    h_s_conjugations_map: HSConjugationsMap,
    num_qubits: usize,
    size: usize,
}

impl RowWiseBitVec {
    // Creates and returns an empty RowWiseBitVec
    pub fn new(num_qubits: usize) -> RowWiseBitVec {
        RowWiseBitVec {
            pauli_strings: BitVec::new(),
            generator_info: Vec::new(),
            h_s_conjugations_map: HSConjugationsMap::new(num_qubits),
            num_qubits,
            size: 0,
        }
    }

    /// Sets the RowWiseBitVec to contain `size` amount of Pauli strings
    /// consisting of identity gates only. No generator coefficient information is stored,
    /// only memory is allocated for it.
    fn set_default(&mut self, size: usize) {
        // With `size` number of Pauli strings, each with `num_qubits` number of gates, which are encoded
        // using two bits.
        self.size = size;
        self.pauli_strings = bitvec![0; 2*self.num_qubits*self.size];
        self.generator_info = Vec::with_capacity(self.size);
        self.h_s_conjugations_map = HSConjugationsMap::new(self.num_qubits);
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

    /// Clones the bits of the ith Pauli string and appends them to the end of the bitvec.
    fn extend_from_within(&mut self, i: usize) {
        let start = self.pstr_first_bit(i);
        let end = self.pstr_last_bit(i);
        self.pauli_strings.extend_from_within(start..=end);
    }

    /// Apply the H and S conjugations to all the gates of all the Pauli strings.
    fn apply_all_h_s_conjugations(&mut self) {
        for pstr_ind in 0..self.size {
            for gate_ind in 0..self.num_qubits {
                self.apply_h_s_conjugations(pstr_ind, gate_ind);
            }
        }
        self.h_s_conjugations_map.reset_all();
    }

    /// Apply the H and S conjugations to the jth gate of the ith Pauli string.
    fn apply_h_s_conjugations(&mut self, i: usize, j: usize) {
        let current_p_gate = self.get_pauli_gate(i, j);
        let actual_p_gate = self
            .h_s_conjugations_map
            .get_actual_p_gate(j, current_p_gate);

        self.set_pauli_gate(actual_p_gate, i, j);
        self.generator_info[i].multiply(
            self.h_s_conjugations_map
                .get_coefficient_multiplier(j, current_p_gate),
        );
    }

    /// Conjugate each Pauli string in the bitvec with a CNOT gate.
    /// We use the update rules to adjust the Pauli gates and coefficients.
    fn conjugate_cnot(&mut self, gate: &Gate) {
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
    }

    /// Change the jth gate of the ith Pauli string from an X gate to a Y gate
    /// or vise versa.
    fn flip_x_y(&mut self, pstr_ind: usize, gate_ind: usize) {
        match self.get_pauli_gate(pstr_ind, gate_ind) {
            PauliGate::X => self.set_pauli_gate(PauliGate::Y, pstr_ind, gate_ind),
            PauliGate::Y => self.set_pauli_gate(PauliGate::X, pstr_ind, gate_ind),
            _ => {
                panic!("Can only call `flip_x_y` on an X or Y gate")
            }
        }
    }

    /// Conjugate each Pauli string in the bitvec with a T gate.
    /// We use the update rules to adjust the Pauli gates and coefficients.
    fn conjugate_t_gate(&mut self, gate: &Gate, conjugate_dagger: bool) {
        for pstr_index in 0..self.size {
            self.apply_h_s_conjugations(pstr_index, gate.qubit_1);

            let target_p_gate = self.get_pauli_gate(pstr_index, gate.qubit_1);

            if target_p_gate == PauliGate::Z || target_p_gate == PauliGate::I {
                continue;
            }

            // Copy the Pauli string and flip the X or Y gate of the new
            // Pauli string
            self.extend_from_within(pstr_index);
            self.flip_x_y(self.size, gate.qubit_1);
            self.size += 1;

            // Set the generator information appropriately and create
            // a new generator info for the new Pauli string
            self.generator_info[pstr_index].multiply(*ONE_OVER_SQRT_TWO);
            self.generator_info
                .push(self.generator_info[pstr_index].clone());

            match (target_p_gate, conjugate_dagger) {
                (PauliGate::X, true) | (PauliGate::Y, false) => {
                    // T^{\dag}XT -> 1/sqrt{2} (X - Y)
                    // and
                    // TYT^{\dag} -> 1/sqrt(2) (Y - X)
                    self.generator_info.last_mut().unwrap().multiply(-1.0);
                }
                // In all other cases we do nothing, particularly for TXT^{\dag} -> 1/sqrt{2} (X + Y) and
                // T^{\dag}YT -> 1/sqrt(2) (Y + X) we alreay had the correct coefficients because we multiplied
                // with 1/sqrt{2} before.
                _ => {}
            }
        }

        self.h_s_conjugations_map.reset(gate.qubit_1);
    }

    /// Updates all Pauli strings according to the following rules:
    /// Rz(θ)XRz(θ)^† = cos(θ)X  + sin(θ)Y
    /// Rz(θ)YRz(θ)^† = -sin(θ)X + cos(θ)Y
    /// Rz(θ)^†XRz(θ) = cos(θ)X  - sin(θ)Y
    /// Rz(θ)^†YRz(θ) = sin(θ)X  + cos(θ)Y
    /// Z and I remain unchanged.
    fn conjugate_rz(&mut self, gate: &Gate, conjugate_dagger: bool) {
        for pstr_index in 0..self.size {
            self.apply_h_s_conjugations(pstr_index, gate.qubit_1);

            let target_p_gate = self.get_pauli_gate(pstr_index, gate.qubit_1);

            if target_p_gate == PauliGate::Z || target_p_gate == PauliGate::I {
                continue;
            }

            // We create a new Pauli string
            // And ensure the original Pauli string has an X gate at the target qubit
            // and ensure the copied Pauli string has an Y gate at the target qubit
            self.extend_from_within(pstr_index);
            self.set_pauli_gate(PauliGate::X, pstr_index, gate.qubit_1);
            self.set_pauli_gate(PauliGate::Y, self.size, gate.qubit_1);
            self.size += 1;

            self.generator_info
                .push(self.generator_info[pstr_index].clone());

            // Multiply coeffients with +/- and cos/sin
            match (target_p_gate, conjugate_dagger) {
                (PauliGate::X, false) => {
                    self.generator_info[pstr_index].multiply(gate.angle.unwrap().cos());
                    self.generator_info
                        .last_mut()
                        .unwrap()
                        .multiply(gate.angle.unwrap().sin());
                }
                (PauliGate::Y, false) => {
                    self.generator_info[pstr_index].multiply(-1.0 * gate.angle.unwrap().sin());
                    self.generator_info
                        .last_mut()
                        .unwrap()
                        .multiply(gate.angle.unwrap().cos());
                }
                (PauliGate::X, true) => {
                    self.generator_info[pstr_index].multiply(gate.angle.unwrap().cos());
                    self.generator_info
                        .last_mut()
                        .unwrap()
                        .multiply(-1.0 * gate.angle.unwrap().sin());
                }
                (PauliGate::Y, true) => {
                    self.generator_info[pstr_index].multiply(gate.angle.unwrap().sin());
                    self.generator_info
                        .last_mut()
                        .unwrap()
                        .multiply(gate.angle.unwrap().cos());
                }
                _ => {
                    unreachable!()
                }
            }
        }

        self.h_s_conjugations_map.reset(gate.qubit_1);
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
    fn scatter(&mut self, mut map: HashMap<BitVec, CoefficientList, FxBuildHasher>) {
        self.pauli_strings.clear();
        self.generator_info.clear();

        for (pstr, coefficients) in map.iter_mut() {
            if coefficients.is_empty() {
                continue;
            }
            self.pauli_strings.extend_from_bitslice(pstr);
            self.generator_info.push(coefficients.clone());
        }

        self.size = self.generator_info.len();
    }

    /// Equivalent to the scatter function, but also
    /// returns the index of the ith generator of the all zero state,
    /// which can be used by the `clean_and_find` function. If it does not exist,
    /// we return the size of the generator set.
    /// Deleberately put into seperate functions because checking
    fn scatter_and_find(
        &mut self,
        mut map: HashMap<BitVec, CoefficientList, FxBuildHasher>,
        i: usize,
    ) -> usize {
        self.pauli_strings.clear();
        self.generator_info.clear();

        let mut ith_generator_index = self.size;

        for (pstr_index, (pstr, coefficients)) in map.iter_mut().enumerate() {
            if coefficients.is_empty() {
                continue;
            }

            if self.is_single_z_pstr(pstr, i) {
                ith_generator_index = pstr_index;
            }

            self.pauli_strings.extend_from_bitslice(pstr);
            self.generator_info.push(coefficients.clone());
        }

        self.size = self.generator_info.len();
        ith_generator_index
    }

    /// Returns wheter the Pauli string contains only identity gates
    /// and a single Z gate at the ith position, i.e.,
    /// I^⊗{i-1}ZI^⊗{n-i}.
    fn is_single_z_pstr(&self, pstr: &BitVec, i: usize) -> bool {
        for gate_ind in 0..self.num_qubits {
            let pgate =
                PauliGate::pauli_gate_from_tuple(pstr[2 * gate_ind], pstr[2 * gate_ind + 1]);

            if (gate_ind == i && pgate != PauliGate::Z) || (gate_ind != i && pgate != PauliGate::I)
            {
                return false;
            }
        }
        true
    }

    /// Equivalent to the clean function but also returns the index
    /// of the ith generator of the all zero state, i.e., the position
    /// of I^⊗{i-1}ZI^⊗{n-i} in the list of generators.
    /// The reason for this is because before we do a measurement we must clean up the
    /// generators. Returning the position of the ith generator prevents us from searching
    /// for it again. If it does not exist, we return the size of the generator set.
    fn clean_and_find(&mut self, i: usize) -> usize {
        let map = self.gather();
        self.scatter_and_find(map, i)
    }

    /// Removes the ith Pauli string
    fn remove_pstr(&mut self, i: usize) {
        let start = self.pstr_first_bit(i);
        let end = self.pstr_last_bit(i);

        self.pauli_strings.drain(start..=end);
        self.generator_info.remove(i);
        self.size -= 1;
    }

    /// Updates all Pauli strings after a measurement
    fn measurement_update(&mut self, qubit: usize, measurement: bool, p0: f64) {
        // When we have measured a zero or a 1, all Pauli strings that are updated are
        // multiplied by 1/(p_0 * 4) or 1/(p_1 * 4) respectively.
        let multiplier = if measurement {
            1.0 / ((1.0 - p0) * 4.0)
        } else {
            1.0 / (p0 * 4.0)
        };

        for pstr_ind in 0..self.size {
            let target_p_gate = self.get_pauli_gate(pstr_ind, qubit);

            match target_p_gate {
                // Measurement 0: I -> 1/(p0 * 4) * (2I + 2Z)
                // Measurement 1: I -> 1/(p1 * 4) * (2I - 2Z)
                PauliGate::I => {
                    self.extend_from_within(pstr_ind);
                    self.set_pauli_gate(PauliGate::Z, self.size, qubit);
                    self.size += 1;

                    self.generator_info[pstr_ind].multiply(2.0 * multiplier);

                    self.generator_info
                        .push(self.generator_info[pstr_ind].clone());

                    if measurement {
                        self.generator_info.last_mut().unwrap().multiply(-1.0);
                    }
                }

                // Measurement 0, 1: X -> 1/(p0 * 4) * 2X
                PauliGate::X => {
                    self.generator_info[pstr_ind].multiply(2.0 * multiplier);
                }

                // Measruement 0, 1: Y -> -
                PauliGate::Y => {
                    self.remove_pstr(pstr_ind);
                }

                // Measurement 0: Z -> 1/(p0 * 4) * (2Z + 2I)
                // Measurement 1: Z -> 1/(p1 * 4) * (2Z - 2I)
                PauliGate::Z => {
                    self.extend_from_within(pstr_ind);
                    self.set_pauli_gate(PauliGate::I, self.size, qubit);
                    self.size += 1;

                    self.generator_info[pstr_ind].multiply(2.0 * multiplier);

                    self.generator_info
                        .push(self.generator_info[pstr_ind].clone());

                    if measurement {
                        self.generator_info.last_mut().unwrap().multiply(-1.0);
                    }
                }
            }
        }
    }
}

impl GeneratorSet for RowWiseBitVec {
    /// Initialize the RowWiseBitVec with the generators of the all zero state or all plus state.
    fn init_generators(&mut self, zero_state_generators: bool) {
        self.set_default(self.num_qubits);

        let p_gate = if zero_state_generators {
            PauliGate::Z
        } else {
            PauliGate::X
        };

        self.pauli_strings.resize(2 * self.size * self.size, false);

        for generator_index in 0..self.num_qubits {
            self.set_pauli_gate(p_gate, generator_index, generator_index);
            self.generator_info
                .push(CoefficientList::new(generator_index));
        }
    }

    /// Initialize the RowWiseBitVec with the ith generator of the all zero state or all plus state.
    fn init_single_generator(&mut self, i: usize, zero_state_generator: bool) {
        self.set_default(1);

        if zero_state_generator {
            self.set_pauli_gate(PauliGate::Z, 0, i);
        } else {
            self.set_pauli_gate(PauliGate::X, 0, i);
        };

        self.generator_info.push(CoefficientList::new(i));
    }

    fn is_x_or_z_generators(&mut self, _check_zero_state: bool) -> bool {
        unimplemented!()
    }

    fn is_single_x_or_z_generator(&mut self, check_zero_state: bool, i: usize) -> bool {
        self.apply_all_h_s_conjugations();

        if self.size != 1
            || self.generator_info[0].coefficients.len() != 1
            || self.generator_info[0].coefficients[0].0 != i
            // TODO or -1.0?
            || self.generator_info[0].coefficients[0].1 < OrderedFloat(1.0 - FP_ERROR_MARGIN)
        {
            return false;
        }

        for gate_ind in 0..self.num_qubits {
            let p_gate = self.get_pauli_gate(0, gate_ind);

            if gate_ind == i {
                if (check_zero_state && p_gate != PauliGate::Z)
                    || (!check_zero_state && p_gate != PauliGate::X)
                {
                    return false;
                }
            } else {
                if p_gate != PauliGate::I {
                    return false;
                }
            }
        }
        true
    }

    /// Conjugates all stored Pauli strings with the provided gate.
    fn conjugate(&mut self, gate: &Gate, conjugate_dagger: bool) -> Result<(), Box<dyn Error>> {
        match gate.gate_type {
            GateType::H | GateType::S => {
                self.h_s_conjugations_map.update(gate, conjugate_dagger);
            }
            GateType::CNOT => self.conjugate_cnot(gate),
            GateType::T => self.conjugate_t_gate(gate, conjugate_dagger),
            GateType::Rz => self.conjugate_rz(gate, conjugate_dagger),
            _ => {
                panic!("Can only conjugate a H, S, CNOT, T, Rz gate")
            }
        }

        Ok(())
    }

    fn measure(&mut self, i: usize) -> (bool, f64) {
        self.apply_all_h_s_conjugations();

        let ith_generator_index = self.clean_and_find(i);

        // Probability of measuring 0
        let mut p0 = 0.5;

        if ith_generator_index < self.size {
            let mut c_sum = OrderedFloat(0.0);
            for c in self.generator_info[ith_generator_index].coefficients.iter() {
                c_sum += c.1;
            }
            p0 += 0.5 * f64::from(c_sum);
        }

        // Measure true or false with probability p0 or 1-p0 respectively
        let measurment = [(true, p0), (false, 1.0 - p0)]
            .choose_weighted(&mut thread_rng(), |item| item.1)
            .unwrap()
            .0;

        self.measurement_update(i, measurment, p0);

        (measurment, p0)
    }

    /// Merges all duplicate Pauli strings and removes all Pauli strings
    /// with zero coefficients.
    fn clean(&mut self) {
        let map = self.gather();
        self.scatter(map);
    }

    /// Returns the number of Pauli strings stored in the bitvec.
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

// ------------------ Tests ---------------------------------------

#[cfg(test)]
mod tests {

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
