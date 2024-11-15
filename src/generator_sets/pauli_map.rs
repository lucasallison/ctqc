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
pub struct PauliMap {
    pauli_strings_src: HashMap<BitVec, CoefficientList, FxBuildHasher>,
    pauli_strings_dst: HashMap<BitVec, CoefficientList, FxBuildHasher>,
    h_s_conjugations_map: HSConjugationsMap,
    n_qubits: usize,
}

impl PauliMap {
    pub fn new(n_qubits: usize) -> PauliMap {
        PauliMap {
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

    fn empty_map(size: usize) -> HashMap<BitVec, CoefficientList, FxBuildHasher> {
        HashMap::<BitVec, CoefficientList, FxBuildHasher>::with_capacity_and_hasher(
            size,
            FxBuildHasher::default(),
        )
    }

    pub fn apply_all_h_s_conjugations(&mut self) {
        let mut pstrs_src = std::mem::take(&mut self.pauli_strings_src);
        for (mut pstr, mut coef_list) in pstrs_src.drain() {
            for gate_ind in 0..self.n_qubits {
                self.apply_h_s_conjugations(&mut pstr, &mut coef_list, gate_ind);
            }
            Self::insert_pstr_bitvec_into_map(&mut self.pauli_strings_dst, pstr, coef_list)
        }

        self.pauli_strings_src = std::mem::take(&mut pstrs_src);
        std::mem::swap(&mut self.pauli_strings_src, &mut self.pauli_strings_dst);

        self.h_s_conjugations_map.reset_all();
    }

    fn apply_h_s_conjugations(
        &self,
        pstr: &mut BitVec,
        coef_list: &mut CoefficientList,
        q_index: usize,
    ) {
        let current_p_gate = PauliUtils::get_pauli_gate_from_bitslice(pstr, q_index);
        let actual_p_gate = self
            .h_s_conjugations_map
            .get_actual_p_gate(q_index, current_p_gate);

        PauliUtils::set_pauli_gate_in_bitslice(pstr, actual_p_gate, q_index);
        coef_list.multiply(
            &self
                .h_s_conjugations_map
                .get_coefficient_multiplier(q_index, current_p_gate),
        );
    }

    fn conjugate_cnot(&mut self, cnot: &Gate) {
        let qubit_2 = cnot.qubit_2.unwrap();

        let mut pstrs_src = std::mem::take(&mut self.pauli_strings_src);

        for (mut pstr, mut coef_list) in pstrs_src.drain() {
            self.apply_h_s_conjugations(&mut pstr, &mut coef_list, cnot.qubit_1);
            self.apply_h_s_conjugations(&mut pstr, &mut coef_list, qubit_2);

            let q1_target_p_gate = PauliUtils::get_pauli_gate_from_bitslice(&pstr, cnot.qubit_1);
            let q2_target_p_gate = PauliUtils::get_pauli_gate_from_bitslice(&pstr, qubit_2);

            let look_up_output = CNOT_CONJ_UPD_RULES
                .get(&(q1_target_p_gate, q2_target_p_gate))
                .unwrap();

            coef_list.multiply(&look_up_output.coefficient);

            PauliUtils::set_pauli_gate_in_bitslice(
                &mut pstr,
                look_up_output.q1_p_gate,
                cnot.qubit_1,
            );
            PauliUtils::set_pauli_gate_in_bitslice(&mut pstr, look_up_output.q2_p_gate, qubit_2);

            Self::insert_pstr_bitvec_into_map(&mut self.pauli_strings_dst, pstr, coef_list);
        }

        self.pauli_strings_src = std::mem::take(&mut pstrs_src);
        std::mem::swap(&mut self.pauli_strings_src, &mut self.pauli_strings_dst);

        self.h_s_conjugations_map.reset(cnot.qubit_1);
        self.h_s_conjugations_map.reset(qubit_2);
    }

    fn conjugate_rz(&mut self, rz: &Gate, conjugate_dagger: bool) {

        if self.h_s_conjugations_map.conditionally_apply_rz(rz, conjugate_dagger) {
            return;
        }

        let mut pstrs_src = std::mem::take(&mut self.pauli_strings_src);

        // Reserve addtional memory for potential new Pauli strings
        self.pauli_strings_dst.reserve(pstrs_src.len() / 2);

        for (mut pstr, mut coef_list) in pstrs_src.drain() {
            self.apply_h_s_conjugations(&mut pstr, &mut coef_list, rz.qubit_1);

            let target_pgate = PauliUtils::get_pauli_gate_from_bitslice(&pstr, rz.qubit_1);

            if target_pgate == PauliGate::Z || target_pgate == PauliGate::I {
                self.pauli_strings_dst.insert(pstr, coef_list);
                continue;
            }

            let mut new_pstr = pstr.clone();
            let mut new_coef_list = coef_list.clone();

            PauliUtils::set_pauli_gate_in_bitslice(&mut pstr, PauliGate::X, rz.qubit_1);
            PauliUtils::set_pauli_gate_in_bitslice(&mut new_pstr, PauliGate::Y, rz.qubit_1);

            let (x_mult, y_mult) =
                Utils::rz_conj_coef_multipliers(rz, &target_pgate, conjugate_dagger);

            coef_list.multiply(&x_mult);
            new_coef_list.multiply(&y_mult);

            Self::insert_pstr_bitvec_into_map(&mut self.pauli_strings_dst, pstr, coef_list);
            Self::insert_pstr_bitvec_into_map(&mut self.pauli_strings_dst, new_pstr, new_coef_list);
        }

        // Take back ownership of the source map, which is now empty
        self.pauli_strings_src = std::mem::take(&mut pstrs_src);
        // Swap src and dest map, so the src map contains the updated Pauli strings
        std::mem::swap(&mut self.pauli_strings_src, &mut self.pauli_strings_dst);

        self.h_s_conjugations_map.reset(rz.qubit_1);
    }

    // ----------------- Public functions ----------------- //
    //
    // The following functions are deliberately not not associated to self
    // and public so other modules can use them.

    /// Removes all Pauli strings with zero coefficients from the map
    pub fn clean_map(map: &mut HashMap<BitVec, CoefficientList, FxBuildHasher>) {
        map.retain(|_, coef_list| !coef_list.is_empty(true));
    }

    /// Inserts the Pauli string into the map or merges the coefficient list with
    /// the existing one if the Pauli string already exists. If the coefficient list is empty
    /// the Pauli string is removed from the map.
    pub fn insert_pstr_bitvec_into_map(
        map: &mut HashMap<BitVec, CoefficientList, FxBuildHasher>,
        pstr: BitVec,
        coef_list: CoefficientList,
    ) {
        match map.entry(pstr) {
            Entry::Occupied(mut e) => {
                let existing_coef_list = e.get_mut();
                existing_coef_list.merge(&coef_list);
            }
            Entry::Vacant(e) => {
                if !coef_list.is_empty(true) {
                    e.insert(coef_list);
                }
            }
        }
    }

    /// Creates a PauliMap from a map of Pauli strings. It does not clean the input map, it stores it as
    /// provided.
    pub fn from_map(
        map: HashMap<BitVec, CoefficientList, FxBuildHasher>,
        n_qubits: usize,
    ) -> PauliMap {
        let dst_map_size = map.len();
        PauliMap {
            pauli_strings_src: map,
            pauli_strings_dst: HashMap::with_capacity_and_hasher(
                dst_map_size,
                FxBuildHasher::default(),
            ),
            h_s_conjugations_map: HSConjugationsMap::new(n_qubits),
            n_qubits,
        }
    }

    /// Returns the Pauli strings map and resets the generator set to its default state
    pub fn take_pstr_map(&mut self) -> HashMap<BitVec, CoefficientList, FxBuildHasher> {
        let map = std::mem::take(&mut self.pauli_strings_src);
        self.set_default();
        map
    }
}

impl GeneratorSet for PauliMap {
    fn init_generators(&mut self, zero_state_generators: bool) {
        self.set_default();

        let p_gate = PauliUtils::generator_non_identity_gate(zero_state_generators);

        for generator_index in 0..self.n_qubits {
            let mut pstr = bitvec![0; 2 * self.n_qubits];
            PauliUtils::set_pauli_gate_in_bitslice(&mut pstr, p_gate, generator_index);

            let coef_list = CoefficientList::new(generator_index);

            self.pauli_strings_src.insert(pstr, coef_list);
        }
    }

    /// Initialize the map with the ith generator of the all zero state or all plus state.
    fn init_single_generator(&mut self, i: usize, zero_state_generator: bool) {
        self.set_default();

        let p_gate = PauliUtils::generator_non_identity_gate(zero_state_generator);
        let mut pstr = bitvec![0; 2 * self.n_qubits];
        PauliUtils::set_pauli_gate_in_bitslice(&mut pstr, p_gate, i);

        let coef_list = CoefficientList::new(i);
        self.pauli_strings_src.insert(pstr, coef_list);
    }

    fn is_x_or_z_generators(&mut self, check_zero_state: bool) -> bool {
        self.apply_all_h_s_conjugations();

        if self.size() == 0 {
            return false;
        }

        let mut target_generators =
            HashMap::with_capacity_and_hasher(self.n_qubits, FxBuildHasher::default());

        for i in 0..self.n_qubits {
            let pgate = PauliUtils::generator_non_identity_gate(check_zero_state);
            let mut target_generator = PauliString::new(self.n_qubits);
            target_generator.set_pauli_gate(i, pgate);

            target_generators.insert(BitVec::from_bitslice(target_generator.as_bitslice()), i);
        }

        for (pstr, coef_list) in &self.pauli_strings_src {
            if target_generators.contains_key(pstr) {
                let i = target_generators.get(pstr).unwrap();
                if !coef_list.is_valid_ith_generator_coef_list(*i) {
                    return false;
                }
            } else {
                if !coef_list.is_empty(false) {
                    return false;
                }
            }
        }

        true
    }

    fn is_single_x_or_z_generator(&mut self, check_zero_state: bool, i: usize) -> bool {
        self.apply_all_h_s_conjugations();

        if self.size() == 0 {
            return false;
        }

        let pgate = PauliUtils::generator_non_identity_gate(check_zero_state);
        let mut target_generator = PauliString::new(self.n_qubits);
        target_generator.set_pauli_gate(i, pgate);

        for (pstr, coef_list) in &self.pauli_strings_src {
            if pstr == target_generator.as_bitslice()
                && !coef_list.is_valid_ith_generator_coef_list(i)
            {
                return false;
            }

            if pstr != target_generator.as_bitslice() && coef_list.is_empty(false) {
                continue;
            }

            if pstr != target_generator.as_bitslice() && !coef_list.is_empty(false) {
                return false;
            }
        }

        true
    }

    fn conjugate(&mut self, gate: &Gate, conjugate_dagger: bool) {
        match gate.gate_type {
            GateType::H | GateType::S => self.h_s_conjugations_map.update(gate, conjugate_dagger),
            GateType::CNOT => self.conjugate_cnot(gate),
            GateType::Rz | GateType::RzPi | GateType::RzHalfPi => self.conjugate_rz(gate, conjugate_dagger),
        }
    }

    fn get_measurement_sampler(&mut self) -> MeasurementSampler {
        self.apply_all_h_s_conjugations();
        MeasurementSampler::from_map(self.pauli_strings_src.clone(), self.n_qubits)
    }

    /// Since we only ever save unique Pauli strings associated to
    /// at least one generator, we never have to clean anything
    fn clean(&mut self) {}

    fn size(&self) -> usize {
        self.pauli_strings_src.len()
    }
}

impl fmt::Display for PauliMap {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        for (pstr, coef_list) in &self.pauli_strings_src {
            let mut actual_pstr = pstr.clone();
            let mut coef_multiplier = 1.0;

            for qubit_index in 0..self.n_qubits {
                let current_p_gate =
                    PauliUtils::get_pauli_gate_from_bitslice(&actual_pstr, qubit_index);
                let actual_p_gate = self
                    .h_s_conjugations_map
                    .get_actual_p_gate(qubit_index, current_p_gate);
                PauliUtils::set_pauli_gate_in_bitslice(
                    &mut actual_pstr,
                    actual_p_gate,
                    qubit_index,
                );

                coef_multiplier *= self
                    .h_s_conjugations_map
                    .get_coefficient_multiplier(qubit_index, current_p_gate)
                    .as_f64();
            }

            write!(f, "{}: (", PauliString::from_bitvec(actual_pstr))?;

            for c in coef_list.coefficients.iter() {
                write!(f, "{}: {}, ", c.0, c.1.as_f64() * coef_multiplier)?;
            }
            write!(f, ")\n")?;
        }

        Ok(())
    }
}
