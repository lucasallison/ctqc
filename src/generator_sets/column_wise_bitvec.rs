use core::panic;
use std::collections::HashMap;
use std::fmt;

use bitvec::prelude::*;
use fxhash::FxBuildHasher;

use super::measurement_sampler::MeasurementSampler;
use super::pauli_map::PauliMap;
use super::pauli_string::utils as PauliUtils;
use super::pauli_string::PauliGate;
use super::shared::coefficient_list::CoefficientList;
use super::shared::h_s_conjugations_map::HSConjugationsMap;
use super::utils as Utils;
use super::utils::conjugation_look_up_tables::CNOT_CONJ_UPD_RULES;
use super::GeneratorSet;

use crate::circuit::{Gate, GateType};

pub struct ColumnWiseBitVec {
    columns: Vec<BitVec>,
    generator_info: Vec<CoefficientList>,
    h_s_conjugations_map: HSConjugationsMap,
    n_qubits: usize,
}

impl ColumnWiseBitVec {
    pub fn new(n_qubits: usize) -> ColumnWiseBitVec {
        ColumnWiseBitVec {
            columns: vec![bitvec![0; 2*n_qubits]; n_qubits],
            generator_info: Vec::with_capacity(n_qubits),
            h_s_conjugations_map: HSConjugationsMap::new(n_qubits),
            n_qubits,
        }
    }

    // Ensures that all columns contain `size` number of identity gates, i.e.,
    // the datastructure stores `size` number of Pauli strings of only identity gates.
    fn set_default(&mut self, size: usize) {
        self.columns = vec![bitvec![0; 2*size]; self.n_qubits];
        self.generator_info = Vec::with_capacity(size);
        self.h_s_conjugations_map = HSConjugationsMap::new(self.n_qubits);
    }

    /// Returns the jth gate of the ith Pauli string
    fn get_pauli_gate(&self, pstr_ind: usize, gate_ind: usize) -> PauliGate {
        let column = &self.columns[gate_ind];
        PauliUtils::pauli_gate_from_tuple(column[2 * pstr_ind], column[2 * pstr_ind + 1])
    }

    /// Sets the jth gate of the ith Pauli string
    fn set_pauli_gate(&mut self, pgate: PauliGate, pstr_ind: usize, gate_ind: usize) {
        let column = &mut self.columns[gate_ind];
        let (b1, b2) = PauliUtils::pauli_gate_as_tuple(pgate);

        column.set(2 * pstr_ind, b1);
        column.set(2 * pstr_ind + 1, b2)
    }

    // Copy the ith Pauli string and add its gates to to the end of the column bit vectors
    fn extend_from_within(&mut self, pstr_ind: usize) {
        for col in self.columns.iter_mut() {
            let b1 = col[2 * pstr_ind];
            let b2 = col[2 * pstr_ind + 1];
            col.push(b1);
            col.push(b2);
        }
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
            for gate_ind in 0..self.n_qubits {
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
            &self
                .h_s_conjugations_map
                .get_coefficient_multiplier(gate_ind, current_p_gate),
        );
    }

    fn conjugate_cnot(&mut self, cnot: &Gate) {
        let qubit_2 = cnot.qubit_2.unwrap();

        for pstr_index in 0..self.size() {
            self.apply_h_s_conjugations(pstr_index, cnot.qubit_1);
            self.apply_h_s_conjugations(pstr_index, qubit_2);

            let q1_target_p_gate = self.get_pauli_gate(pstr_index, cnot.qubit_1);
            let q2_target_p_gate = self.get_pauli_gate(pstr_index, qubit_2);

            let look_up_output = CNOT_CONJ_UPD_RULES
                .get(&(q1_target_p_gate, q2_target_p_gate))
                .unwrap();

            self.generator_info[pstr_index].multiply(&look_up_output.coefficient);

            self.set_pauli_gate(look_up_output.q1_p_gate, pstr_index, cnot.qubit_1);
            self.set_pauli_gate(look_up_output.q2_p_gate, pstr_index, qubit_2);
        }

        self.h_s_conjugations_map.reset(cnot.qubit_1);
        self.h_s_conjugations_map.reset(qubit_2);
    }

    /// Conjugate each Pauli string in the bitvec with a T gate.
    /// We use the update rules to adjust the Pauli gates and coefficients.
    fn conjugate_rz(&mut self, rz: &Gate, conjugate_dagger: bool) {
        for pstr_ind in 0..self.size() {
            self.apply_h_s_conjugations(pstr_ind, rz.qubit_1);
            let target_pgate = self.get_pauli_gate(pstr_ind, rz.qubit_1);

            if target_pgate == PauliGate::I || target_pgate == PauliGate::Z {
                continue;
            }

            // We set the current Pauli string to have a Y gate at the gate index.
            // Then we copy it and set the gate to be an X gate.
            // This way the first Pauli string will have a Y gate and the last an X gate.
            self.set_pauli_gate(PauliGate::Y, pstr_ind, rz.qubit_1);
            self.extend_from_within(pstr_ind);
            self.set_pauli_gate(PauliGate::X, pstr_ind, rz.qubit_1);

            self.generator_info
                .push(self.generator_info[pstr_ind].clone());

            let (x_mult, y_mult) =
                Utils::rz_conj_coef_multipliers(rz, &target_pgate, conjugate_dagger);

            self.generator_info[pstr_ind].multiply(&x_mult);
            self.generator_info.last_mut().unwrap().multiply(&y_mult);
        }

        self.h_s_conjugations_map.reset(rz.qubit_1);
    }

    /// Gather all unique Pauli strings in a map and merge coefficients for duplicates
    fn gather(&mut self) -> HashMap<BitVec, CoefficientList, FxBuildHasher> {
        let mut map = HashMap::<BitVec, CoefficientList, FxBuildHasher>::with_capacity_and_hasher(
            self.size(),
            FxBuildHasher::default(),
        );

        let mut generator_info = std::mem::take(&mut self.generator_info);

        for (pstr_ind, coef_list) in generator_info.drain(..).enumerate() {
            let mut pstr: BitVec = BitVec::with_capacity(2 * self.n_qubits);
            for gate_ind in 0..self.n_qubits {
                let current_p_gate = self.get_pauli_gate(pstr_ind, gate_ind);
                let (b1, b2) = PauliUtils::pauli_gate_as_tuple(current_p_gate);

                pstr.push(b1);
                pstr.push(b2);
            }

            PauliMap::insert_pstr_bitvec_into_map(&mut map, pstr, coef_list)
        }

        for col in self.columns.iter_mut() {
            col.clear();
        }

        map
    }

    /// Scatter the Pauli strings in the provided map to the bitvec
    fn scatter(&mut self, mut map: HashMap<BitVec, CoefficientList, FxBuildHasher>) {
        self.clear();

        for (pstr, coef_list) in map.drain() {
            for (gate_ind, bslice) in pstr.chunks_exact(2).enumerate() {
                self.columns[gate_ind].push(bslice[0]);
                self.columns[gate_ind].push(bslice[1]);
            }
            self.generator_info.push(coef_list);
        }
    }
}

impl GeneratorSet for ColumnWiseBitVec {
    fn init_generators(&mut self, zero_state_generators: bool) {
        self.set_default(self.n_qubits);

        let pgate = PauliUtils::generator_non_identity_gate(zero_state_generators);

        for generator_index in 0..self.n_qubits {
            self.set_pauli_gate(pgate, generator_index, generator_index);
            self.generator_info
                .push(CoefficientList::new(generator_index));
        }
    }

    fn init_single_generator(&mut self, i: usize, zero_state_generator: bool) {
        self.set_default(1);

        let pgate = PauliUtils::generator_non_identity_gate(zero_state_generator);

        self.set_pauli_gate(pgate, 0, i);
        self.generator_info.push(CoefficientList::new(i));
    }

    fn is_x_or_z_generators(&mut self, check_zero_state: bool) -> bool {
        self.apply_all_h_s_conjugations();

        let mut pstrs = self.gather();
        PauliMap::clean_map(&mut pstrs);
        self.scatter(pstrs.clone());

        PauliMap::from_map(pstrs, self.n_qubits).is_x_or_z_generators(check_zero_state)
    }

    fn is_single_x_or_z_generator(&mut self, check_zero_state: bool, i: usize) -> bool {
        self.apply_all_h_s_conjugations();

        let mut pstrs = self.gather();
        PauliMap::clean_map(&mut pstrs);
        self.scatter(pstrs.clone());

        PauliMap::from_map(pstrs, self.n_qubits).is_single_x_or_z_generator(check_zero_state, i)
    }

    fn conjugate(&mut self, gate: &Gate, conjugate_dagger: bool) {
        match gate.gate_type {
            GateType::H | GateType::S => self.h_s_conjugations_map.update(gate, conjugate_dagger),
            GateType::CNOT => self.conjugate_cnot(gate),
            GateType::Rz => self.conjugate_rz(gate, conjugate_dagger),
        }
    }

    fn get_measurement_sampler(&mut self) -> MeasurementSampler {
        // TODO apply all H/S conjugations
        panic!("Cannot get measurement sampler from ColumnWiseBitVec, all H/S conjugations must be applied first");
        // let pstrs = self.gather();
        // MeasurementSampler::from_map(pstrs, self.n_qubits)
    }

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
            for gate_ind in 0..self.n_qubits {
                let current_p_gate = self.get_pauli_gate(pstr_ind, gate_ind);

                let actual_p_gate = self
                    .h_s_conjugations_map
                    .get_actual_p_gate(gate_ind, current_p_gate);

                coef_multiplier *= self
                    .h_s_conjugations_map
                    .get_coefficient_multiplier(gate_ind, current_p_gate)
                    .as_f64();

                s.push_str(&format!("{}", actual_p_gate));
            }

            s.push_str(" (");
            for c in self.generator_info[pstr_ind].coefficients.iter() {
                s.push_str(&format!("{}: {}, ", c.0, c.1.as_f64() * coef_multiplier));
            }
            s.push_str(")\n");
        }
        write!(f, "{}", s)
    }
}
