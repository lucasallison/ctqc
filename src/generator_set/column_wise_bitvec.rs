use bitvec::prelude::*;
use fxhash::FxBuildHasher;
use ordered_float::OrderedFloat;
use std::collections::{hash_map::Entry, HashMap};
use std::error::Error;
use std::fmt;

use super::coefficient_list::CoefficientList;
use super::conjugation_look_up_tables::CNOT_CONJ_UPD_RULES;
use super::h_s_conjugations_map::HSConjugationsMap;
use super::pauli_string::PauliGate;
use super::GeneratorSet;
use super::ONE_OVER_SQRT_TWO;
use crate::circuit::{Gate, GateType};
use crate::FP_ERROR_MARGIN;

// TODO abstract code with RowWiseBitVec?

pub struct ColumnWiseBitVec {
    columns: Vec<BitVec>,
    generator_info: Vec<CoefficientList>,
    h_s_conjugations_map: HSConjugationsMap,
    num_qubits: usize,
}

impl ColumnWiseBitVec {
    pub fn new(num_qubits: usize) -> ColumnWiseBitVec {
        ColumnWiseBitVec {
            columns: vec![bitvec![0; 2*num_qubits]; num_qubits],
            generator_info: Vec::with_capacity(num_qubits),
            h_s_conjugations_map: HSConjugationsMap::new(num_qubits),
            num_qubits,
        }
    }

    /// Returns the jth gate of the ith Pauli string
    fn get_pauli_gate(&self, pstr_ind: usize, gate_ind: usize) -> PauliGate {
        let column = &self.columns[gate_ind];
        PauliGate::pauli_gate_from_tuple(column[2 * pstr_ind], column[2 * pstr_ind + 1])
    }

    /// Sets the jth gate of the ith Pauli string
    fn set_pauli_gate(&mut self, p_gate: PauliGate, pstr_ind: usize, gate_ind: usize) {
        let column = &mut self.columns[gate_ind];
        let (b1, b2) = PauliGate::pauli_gate_as_tuple(p_gate);

        column.set(2 * pstr_ind, b1);
        column.set(2 * pstr_ind + 1, b2)
    }

    // Ensures that all columns contain `size` number of identity gates, i.e.,
    // the datastructure stores `size` number of Pauli strings of only identity gates.
    fn set_default(&mut self, size: usize) {
        self.columns = vec![bitvec![0; 2*size]; self.num_qubits];
        self.generator_info = Vec::with_capacity(size);
        self.h_s_conjugations_map = HSConjugationsMap::new(self.num_qubits);
    }

    /// Clear all information. This only clears the vectors and does not reset the
    /// struct to its initial state.
    fn clear(&mut self) {
        for column in self.columns.iter_mut() {
            column.clear();
        }
        self.generator_info.clear();
    }

    /// Apply the H and S conjugations to all the gates of all the Pauli strings.
    fn apply_all_h_s_conjugations(&mut self) {
        for pstr_ind in 0..self.size() {
            for gate_ind in 0..self.num_qubits {
                self.apply_h_s_conjugations(pstr_ind, gate_ind);
            }
        }
        self.h_s_conjugations_map.reset_all();
    }

    /// Apply the H and S conjugations to the jth gate of the ith Pauli string.
    fn apply_h_s_conjugations(&mut self, pstr_ind: usize, gate_ind: usize) {
        let current_p_gate = self.get_pauli_gate(pstr_ind, gate_ind);
        let actual_p_gate = self
            .h_s_conjugations_map
            .get_actual_p_gate(gate_ind, current_p_gate);

        self.set_pauli_gate(actual_p_gate, pstr_ind, gate_ind);
        self.generator_info[pstr_ind].multiply(
            self.h_s_conjugations_map
                .get_coefficient_multiplier(gate_ind, current_p_gate),
        );
    }

    fn conjugate_cnot(&mut self, gate: &Gate) {
        let qubit_2 = gate.qubit_2.unwrap();

        for pstr_index in 0..self.size() {
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

    /// Return all the indices of Pauli strings that have an X or Y gate in the provided column
    /// IMPORTANT: Applies the H and S conjugations to the provided column
    fn x_y_in_column(&mut self, col_ind: usize) -> Vec<usize> {
        let mut x_y_pos = Vec::with_capacity(self.size());

        for pstr_ind in 0..self.size() {
            self.apply_h_s_conjugations(pstr_ind, col_ind);
            let pgate = self.get_pauli_gate(pstr_ind, col_ind);

            match pgate {
                PauliGate::X | PauliGate::Y => {
                    x_y_pos.push(pstr_ind);
                }
                _ => {
                    continue;
                }
            }
        }

        self.h_s_conjugations_map.reset(col_ind);
        x_y_pos
    }

    /// Conjugate each Pauli string in the bitvec with a T gate.
    /// We use the update rules to adjust the Pauli gates and coefficients.
    fn conjugate_t_gate(&mut self, gate: &Gate, conjugate_dagger: bool) {
        // First check where X and Y gates are in the column and apply the H and S conjugations
        let x_y_pos = self.x_y_in_column(gate.qubit_1);

        // Copy the Pauli strings that have X or Y gates in the column
        for gate_ind in 0..self.columns.len() {
            for pstr_ind in x_y_pos.iter() {
                let pgate = self.get_pauli_gate(*pstr_ind, gate_ind);
                let (b1, mut b2) = PauliGate::pauli_gate_as_tuple(pgate);

                // We adjust the coeffients of the old and new Pauli strings based on
                // the gate that is conjugated with the T gate
                if gate_ind == gate.qubit_1 {
                    // Whevenver we conjugate with a T gate, the new Pauli string will
                    // have the same gates except for the gat that the T gate conjugates.
                    // There an X gate will become a Y gate and vice versa.
                    // Since an X is encode as 10 and Y as 11, we can simply flip the second bit.
                    b2 = !b2;

                    // The result is always multiplied by 1 over sqrt 2
                    self.generator_info[*pstr_ind].multiply(*ONE_OVER_SQRT_TWO);

                    self.generator_info
                        .push(self.generator_info[*pstr_ind].clone());

                    let new_generator_info = self.generator_info.last_mut().unwrap();

                    match (pgate, conjugate_dagger) {
                        (PauliGate::X, true) => {
                            // T^{\dag}XT -> 1/sqrt{2} (X - Y)
                            new_generator_info.multiply(-1.0);
                        }

                        (PauliGate::Y, false) => {
                            // TYT^{\dag} -> 1/sqrt(2) (Y - X)
                            new_generator_info.multiply(-1.0);
                        }

                        // In all other cases we do nothing, particularly for TXT^{\dag} -> 1/sqrt{2} (X + Y) and
                        // T^{\dag}YT -> 1/sqrt(2) (Y + X) we alreay had the correct coefficients because we multiplied
                        // with 1/sqrt{2} before.
                        _ => {}
                    }
                }

                self.columns[gate_ind].push(b1);
                self.columns[gate_ind].push(b2);
            }
        }
    }

    /// Gather all unique Pauli strings in a map and merge coefficients for duplicates
    fn gather(&mut self) -> HashMap<BitVec, CoefficientList, FxBuildHasher> {
        let mut map = HashMap::<BitVec, CoefficientList, FxBuildHasher>::with_capacity_and_hasher(
            self.size(),
            FxBuildHasher::default(),
        );

        for pstr_ind in 0..self.size() {
            let mut pstr: BitVec = BitVec::with_capacity(2 * self.num_qubits);
            for gate_ind in 0..self.num_qubits {
                let current_p_gate = self.get_pauli_gate(pstr_ind, gate_ind);
                let (b1, b2) = PauliGate::pauli_gate_as_tuple(current_p_gate);

                pstr.push(b1);
                pstr.push(b2);
            }

            match map.entry(pstr) {
                Entry::Occupied(mut entry) => {
                    entry.get_mut().merge(&self.generator_info[pstr_ind]);
                }
                Entry::Vacant(entry) => {
                    entry.insert(self.generator_info[pstr_ind].clone());
                }
            }
        }

        map
    }

    /// Scatter the Pauli strings in the provided map to the bitvec
    fn scatter(&mut self, mut map: HashMap<BitVec, CoefficientList, FxBuildHasher>) {
        self.clear();

        for (pstr, coefficients) in map.iter_mut() {
            if coefficients.is_empty() {
                continue;
            }
            for (gate_ind, bslice) in pstr.chunks_exact(2).enumerate() {
                self.columns[gate_ind].push(bslice[0]);
                self.columns[gate_ind].push(bslice[1]);
            }
            self.generator_info.push(coefficients.clone());
        }
    }
}

impl GeneratorSet for ColumnWiseBitVec {
    /// Initialize the RowWiseBitVec with the generators of the all zero state or all plus state.
    fn init_generators(&mut self, zero_state_generators: bool) {
        self.set_default(self.num_qubits);

        let p_gate = if zero_state_generators {
            PauliGate::Z
        } else {
            PauliGate::X
        };

        for generator_index in 0..self.num_qubits {
            self.set_pauli_gate(p_gate, generator_index, generator_index);
            self.generator_info
                .push(CoefficientList::new(generator_index));
        }
    }

    fn init_single_generator(&mut self, i: usize, zero_state_generator: bool) {
        self.set_default(1);

        let p_gate = if zero_state_generator {
            PauliGate::Z
        } else {
            PauliGate::X
        };

        self.set_pauli_gate(p_gate, 0, i);
        self.generator_info.push(CoefficientList::new(i));
    }

    fn is_x_or_z_generators(&mut self, _check_zero_state: bool) -> bool {
        unimplemented!()
    }

    fn is_single_x_or_z_generator(&mut self, check_zero_state: bool, i: usize) -> bool {
        self.apply_all_h_s_conjugations();

        if self.size() != 1
            || self.generator_info[0].coefficients.len() != 1
            || self.generator_info[0].coefficients[0].0 != i
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
        self.columns[0].len() / 2
    }
}

impl fmt::Display for ColumnWiseBitVec {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let mut s = String::new();

        for pstr_ind in 0..self.size() {
            let mut coef_multiplier = 1.0;
            for gate_ind in 0..self.num_qubits {
                let current_p_gate = self.get_pauli_gate(pstr_ind, gate_ind);

                let actual_p_gate = self
                    .h_s_conjugations_map
                    .get_actual_p_gate(gate_ind, current_p_gate);

                coef_multiplier *= self
                    .h_s_conjugations_map
                    .get_coefficient_multiplier(gate_ind, current_p_gate);

                s.push_str(&format!("{}", actual_p_gate));
            }

            s.push_str(" (");
            for c in self.generator_info[pstr_ind].coefficients.iter() {
                s.push_str(&format!("{}: {}, ", c.0, c.1 * coef_multiplier));
            }
            s.push_str(")\n");
        }
        write!(f, "{}", s)
    }
}
