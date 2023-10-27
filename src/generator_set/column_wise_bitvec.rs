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
        PauliGate::pauli_gate_from_tuple(column[2*pstr_ind], column[2*pstr_ind + 1])
    }

    /// Sets the jth gate of the ith Pauli string
    fn set_pauli_gate(&mut self, p_gate: PauliGate, pstr_ind: usize, gate_ind: usize) {
        let column = &mut self.columns[gate_ind];
        let (b1, b2) = PauliGate::pauli_gate_as_tuple(p_gate);

        column.set(2*pstr_ind, b1);
        column.set(2*pstr_ind + 1, b2)
    }

    /// Reset the RowWiseBitVec to its initial state
    fn reset(&mut self) {
        self.columns = vec![bitvec![0; 2*self.num_qubits]; self.num_qubits];
        self.generator_info = Vec::with_capacity(self.num_qubits);
        self.h_s_conjugations_map = HSConjugationsMap::new(self.num_qubits);
    }

    /// Apply the H and S conjugations to the jth gate of the ith Pauli string.
    // TODO abstract into trait
    fn apply_h_s_conjugations(&mut self, i: usize, j: usize) {
        let current_p_gate = self.get_pauli_gate(i, j);
        let actual_p_gate = self.h_s_conjugations_map.get_actual_p_gate(j, current_p_gate);

        self.set_pauli_gate(actual_p_gate, i, j);
        self.generator_info[i].multiply(
            self.h_s_conjugations_map
                .get_coefficient_multiplier(j, current_p_gate),
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

    /// Conjugate each Pauli string in the bitvec with a T gate.
    /// We use the update rules to adjust the Pauli gates and coefficients.
    fn conjugate_t_gate(
        &mut self,
        gate: &Gate,
        conjugate_dagger: bool,
    ) {
        // TODO 
        // for pstr_index in 0..self.size() {
        //     self.apply_h_s_conjugations(pstr_index, gate.qubit_1);

        //     let target_p_gate = self.get_pauli_gate(pstr_index, gate.qubit_1);

        //     match target_p_gate {
        //         PauliGate::X => {
        //             self.generator_info[pstr_index].multiply(*ONE_OVER_SQRT_TWO);

        //             // T^{\dag}XT -> 1/sqrt{2} (X - Y)
        //             if conjugate_dagger {
        //                 self.extend_from_within(pstr_index);

        //                 let mut new_generator_info = self.generator_info[pstr_index].clone();
        //                 new_generator_info.multiply(-1.0);
        //                 self.generator_info.push(new_generator_info);

        //             // TXT^{\dag} -> 1/sqrt{2} (X + Y)
        //             } else {
        //                 self.extend_from_within(pstr_index);

        //                 let new_generator_info = self.generator_info[pstr_index].clone();
        //                 self.generator_info.push(new_generator_info);
        //             }

        //             self.set_pauli_gate(PauliGate::X, pstr_index, gate.qubit_1);
        //             self.set_pauli_gate(PauliGate::Y, self.size, gate.qubit_1);
        //             self.size += 1;
        //         }

        //         PauliGate::Y => {
        //             self.generator_info[pstr_index].multiply(*ONE_OVER_SQRT_TWO);

        //             // T^{\dag}YT -> 1/sqrt(2) (Y + X)
        //             if conjugate_dagger {
        //                 self.extend_from_within(pstr_index);

        //                 let new_generator_info = self.generator_info[pstr_index].clone();
        //                 self.generator_info.push(new_generator_info);

        //             // TYT^{\dag} -> 1/sqrt(2) (Y - X)
        //             } else {
        //                 self.extend_from_within(pstr_index);

        //                 let mut new_generator_info = self.generator_info[pstr_index].clone();
        //                 new_generator_info.multiply(-1.0);
        //                 self.generator_info.push(new_generator_info);
        //             }

        //             self.set_pauli_gate(PauliGate::Y, pstr_index, gate.qubit_1);
        //             self.set_pauli_gate(PauliGate::X, self.size, gate.qubit_1);
        //             self.size += 1;
        //         }

        //         _ => {
        //             continue;
        //         }
        //     }
        }

}


impl GeneratorSet for ColumnWiseBitVec {

    /// Initialize the RowWiseBitVec with the generators of the all zero state or all plus state.
    fn init_generators(&mut self, zero_state_generators: bool) {
        self.reset();

        let p_gate = if zero_state_generators {
            PauliGate::Z
        } else {
            PauliGate::X
        };

        for generator_index in 0..self.num_qubits {
            self.set_pauli_gate(p_gate, generator_index, generator_index);
            self.generator_info.push(CoefficientList::new(generator_index));
        }
    }

    // TODO
    fn is_x_or_z_generators(&mut self, check_zero_state: bool) -> bool {
        false
    }

    /// Conjugates all stored Pauli strings with the provided gate.
    // TODO error
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
    // TODO
    fn clean(&mut self) {
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