use std::collections::{hash_map::Entry, HashMap};
use std::fmt;

use bitvec::prelude::*;
use fxhash::FxBuildHasher;

use super::measurement_sampler::MeasurementSampler;
use super::pauli_string::utils as PauliUtils;
use super::pauli_string::{PauliGate, PauliString};
use super::shared::coefficient_list::CoefficientList;
use super::shared::h_s_conjugations_map::HSConjugationsMap;
use super::utils as Utils;
use super::utils::conjugation_look_up_tables::CNOT_CONJ_UPD_RULES;
use super::GeneratorSet;

use crate::circuit::{Gate, GateType};

/// Stores a map of Pauli strings and their associated coefficient lists.
pub struct GeneratorMap {
    pauli_strings_src: HashMap<PauliString, CoefficientList, FxBuildHasher>,
    pauli_strings_dst: HashMap<PauliString, CoefficientList, FxBuildHasher>,
    h_s_conjugations_map: HSConjugationsMap,
    n_qubits: usize,
}

impl GeneratorMap {
    pub fn new(n_qubits: usize, n_threads: usize) -> GeneratorMap {
        if n_threads > 1 {
            eprintln!("WARNING: GeneratorMap does not support parallelism. Ignoring n_threads.");
        }

        GeneratorMap {
            pauli_strings_src: Self::empty_map(n_qubits),
            pauli_strings_dst: Self::empty_map(n_qubits),
            h_s_conjugations_map: HSConjugationsMap::new(n_qubits),
            n_qubits,
        }
    }

    fn set_default(&mut self) {
        self.pauli_strings_src = Self::empty_map(self.n_qubits);
        self.pauli_strings_dst = Self::empty_map(self.n_qubits);
        self.h_s_conjugations_map = HSConjugationsMap::new(self.n_qubits);
    }

    fn insert_or_merge_into_dst(&mut self, pstr: PauliString, coef_list: CoefficientList) {
        match self.pauli_strings_dst.entry(pstr) {
            Entry::Occupied(mut e) => {
                let existing_coef_list = e.get_mut();

                existing_coef_list.merge(&coef_list);

                if existing_coef_list.is_empty() {
                    e.remove_entry();
                }
            }
            Entry::Vacant(e) => {
                e.insert(coef_list);
            }
        }
    }

    fn empty_map(size: usize) -> HashMap<PauliString, CoefficientList, FxBuildHasher> {
        HashMap::<PauliString, CoefficientList, FxBuildHasher>::with_capacity_and_hasher(
            size,
            FxBuildHasher::default(),
        )
    }

    fn apply_all_h_s_conjugations(&mut self) {
        let mut pstrs_src = std::mem::take(&mut self.pauli_strings_src);
        for (mut pstr, mut coef_list) in pstrs_src.drain() {
            for gate_ind in 0..self.n_qubits {
                self.apply_h_s_conjugations(&mut pstr, &mut coef_list, gate_ind);
            }
            self.insert_or_merge_into_dst(pstr, coef_list);
        }

        self.pauli_strings_src = std::mem::take(&mut pstrs_src);
        std::mem::swap(&mut self.pauli_strings_src, &mut self.pauli_strings_dst);

        self.h_s_conjugations_map.reset_all();
    }

    fn apply_h_s_conjugations(
        &self,
        pstr: &mut PauliString,
        coef_list: &mut CoefficientList,
        q_index: usize,
    ) {
        let current_p_gate = pstr.get_pauli_gate(q_index);
        let actual_p_gate = self
            .h_s_conjugations_map
            .get_actual_p_gate(q_index, current_p_gate);
        pstr.set_pauli_gate(q_index, actual_p_gate);
        coef_list.multiply(
            self.h_s_conjugations_map
                .get_coefficient_multiplier(q_index, current_p_gate),
        );
    }

    fn conjugate_cnot(&mut self, cnot: &Gate) {
        let qubit_2 = cnot.qubit_2.unwrap();

        let mut pstrs_src = std::mem::take(&mut self.pauli_strings_src);

        for (mut pstr, mut coef_list) in pstrs_src.drain() {
            self.apply_h_s_conjugations(&mut pstr, &mut coef_list, cnot.qubit_1);
            self.apply_h_s_conjugations(&mut pstr, &mut coef_list, qubit_2);

            let q1_target_p_gate = pstr.get_pauli_gate(cnot.qubit_1);
            let q2_target_p_gate = pstr.get_pauli_gate(qubit_2);

            let look_up_output = CNOT_CONJ_UPD_RULES
                .get(&(q1_target_p_gate, q2_target_p_gate))
                .unwrap();

            coef_list.multiply(look_up_output.coefficient);

            pstr.set_pauli_gate(cnot.qubit_1, look_up_output.q1_p_gate);
            pstr.set_pauli_gate(qubit_2, look_up_output.q2_p_gate);

            self.insert_or_merge_into_dst(pstr, coef_list);
        }

        self.pauli_strings_src = std::mem::take(&mut pstrs_src);
        std::mem::swap(&mut self.pauli_strings_src, &mut self.pauli_strings_dst);

        self.h_s_conjugations_map.reset(cnot.qubit_1);
        self.h_s_conjugations_map.reset(qubit_2);
    }

    fn conjugate_rz(&mut self, rz: &Gate, conjugate_dagger: bool) {
        let mut pstrs_src = std::mem::take(&mut self.pauli_strings_src);

        // Reserve addtional memory for potential new Pauli strings
        self.pauli_strings_dst.reserve(pstrs_src.len() / 2);

        for (mut pstr, mut coef_list) in pstrs_src.drain() {
            self.apply_h_s_conjugations(&mut pstr, &mut coef_list, rz.qubit_1);

            let target_pgate = pstr.get_pauli_gate(rz.qubit_1);

            if target_pgate == PauliGate::Z || target_pgate == PauliGate::I {
                self.pauli_strings_dst.insert(pstr, coef_list);
                continue;
            }

            let mut new_pstr = pstr.clone();
            let mut new_coef_list = coef_list.clone();

            pstr.set_pauli_gate(rz.qubit_1, PauliGate::X);
            new_pstr.set_pauli_gate(rz.qubit_1, PauliGate::Y);

            let (x_mult, y_mult) =
                Utils::rz_conj_coef_multipliers(rz, &target_pgate, conjugate_dagger);

            coef_list.multiply(x_mult);
            new_coef_list.multiply(y_mult);

            self.insert_or_merge_into_dst(pstr, coef_list);
            self.insert_or_merge_into_dst(new_pstr, new_coef_list);
        }

        // Take back ownership of the source map, which is now empty
        self.pauli_strings_src = std::mem::take(&mut pstrs_src);
        // Swap src and dest map, so the src map contains the updated Pauli strings
        std::mem::swap(&mut self.pauli_strings_src, &mut self.pauli_strings_dst);

        self.h_s_conjugations_map.reset(rz.qubit_1);
    }

    /// Returns true if the Pauli string with the given index contains an X or Z gate
    fn contains_ith_x_or_z_generator(&self, i: usize, zero_state_generator: bool) -> bool {
        let p_gate = PauliUtils::generator_non_identity_gate(zero_state_generator);
        let mut pstr = PauliString::new(self.n_qubits);
        pstr.set_pauli_gate(i, p_gate);

        match self.pauli_strings_src.get(&pstr) {
            Some(coef_list) => return coef_list.is_valid_ith_generator_coef_list(i),
            None => return false,
        }
    }
}

impl GeneratorSet for GeneratorMap {
    fn init_generators(&mut self, zero_state_generators: bool) {
        self.set_default();

        let p_gate = PauliUtils::generator_non_identity_gate(zero_state_generators);

        for generator_index in 0..self.n_qubits {
            let mut pstr = PauliString::new(self.n_qubits);
            pstr.set_pauli_gate(generator_index, p_gate);
            let coef_list = CoefficientList::new(generator_index);
            self.pauli_strings_src.insert(pstr, coef_list);
        }
    }

    /// Initialize the map with the ith generator of the all zero state or all plus state.
    fn init_single_generator(&mut self, i: usize, zero_state_generator: bool) {
        self.set_default();

        let p_gate = PauliUtils::generator_non_identity_gate(zero_state_generator);
        let mut pstr = PauliString::new(self.n_qubits);
        pstr.set_pauli_gate(i, p_gate);

        let coef_list = CoefficientList::new(i);
        self.pauli_strings_src.insert(pstr, coef_list);
    }

    fn is_x_or_z_generators(&mut self, check_zero_state: bool) -> bool {
        self.apply_all_h_s_conjugations();

        if !(self.size() == self.n_qubits) {
            return false;
        }

        for i in 0..self.n_qubits {
            if !self.contains_ith_x_or_z_generator(i, check_zero_state) {
                return false;
            }
        }
        true
    }

    fn is_single_x_or_z_generator(&mut self, check_zero_state: bool, i: usize) -> bool {
        self.apply_all_h_s_conjugations();

        if !(self.size() == 1) {
            return false;
        }

        self.contains_ith_x_or_z_generator(i, check_zero_state)
    }

    fn conjugate(&mut self, gate: &Gate, conjugate_dagger: bool) {
        match gate.gate_type {
            GateType::H | GateType::S => {
                self.h_s_conjugations_map
                    .update(gate, conjugate_dagger)
            }
            GateType::CNOT => self.conjugate_cnot(gate),
            GateType::Rz => self.conjugate_rz(gate, conjugate_dagger),
        }
    }

    fn get_measurement_sampler(&mut self) -> MeasurementSampler {
        let mut pauli_strings = BitVec::with_capacity(2 * self.n_qubits * self.size());
        let mut generator_info = Vec::with_capacity(self.size());

        let mut map = self.pauli_strings_src.clone();
        for (pstr, mut coefficients) in map.drain() {
            if coefficients.is_empty() {
                continue;
            }
            pauli_strings.extend_from_bitslice(pstr.as_bitslice());
            generator_info.push(coefficients);
        }

        MeasurementSampler::new(pauli_strings, generator_info, self.n_qubits)
    }

    /// Since we only ever save unique Pauli strings associated to
    /// at least one generator, we never have to clean anything
    fn clean(&mut self) {}

    fn size(&self) -> usize {
        self.pauli_strings_src.len()
    }
}

impl fmt::Display for GeneratorMap {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        for (pstr, coef_list) in &self.pauli_strings_src {
            let mut actual_pstr = pstr.clone();
            let mut coef_multiplier = 1.0;

            for qubit_index in 0..self.n_qubits {
                let current_p_gate = pstr.get_pauli_gate(qubit_index);
                let actual_p_gate = self
                    .h_s_conjugations_map
                    .get_actual_p_gate(qubit_index, current_p_gate);
                actual_pstr.set_pauli_gate(qubit_index, actual_p_gate);

                coef_multiplier *= self
                    .h_s_conjugations_map
                    .get_coefficient_multiplier(qubit_index, current_p_gate);
            }

            write!(f, "{}: (", actual_pstr)?;

            for c in coef_list.coefficients.iter() {
                write!(f, "{}: {}, ", c.0, c.1 * coef_multiplier)?;
            }
            write!(f, ")\n")?;
        }

        Ok(())
    }
}
