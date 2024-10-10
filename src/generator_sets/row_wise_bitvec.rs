use std::collections::HashMap;
use std::fmt;

use bitvec::access::BitSafeUsize;
use bitvec::prelude::*;
use fxhash::FxBuildHasher;
use rayon::prelude::*;
use std::sync::Mutex;

// Explicit use statements for parallel iteration
use bitvec::slice::ChunksMut as BitSliceChunksMut;
use rayon::iter::IterBridge;
use rayon::iter::ParallelBridge;
use std::iter::Zip;
use std::slice::ChunksMut;

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

/// (UsizeOrSafeBitSlice) Represents a bitslice that is one of two types: BitSlice<usize> or BitSlice<BitSafeUsize>.
enum UOSBitSlice<'a> {
    Usize(&'a mut BitSlice),
    BitSafeUsize(&'a mut BitSlice<BitSafeUsize>),
}

/// Implementation of a generator set that stores the
/// Pauli strings in a single large bitvec.
pub struct RowWiseBitVec {
    pauli_strings: BitVec,
    generator_info: Vec<CoefficientList>,
    h_s_conjugations_map: HSConjugationsMap,
    n_qubits: usize,
    n_threads: usize,
    size: usize,
}

impl RowWiseBitVec {
    // Creates and returns an empty RowWiseBitVec
    pub fn new(n_qubits: usize, n_threads: usize) -> RowWiseBitVec {
        RowWiseBitVec {
            pauli_strings: BitVec::new(),
            generator_info: Vec::new(),
            h_s_conjugations_map: HSConjugationsMap::new(n_qubits),
            n_qubits,
            n_threads,
            size: 0,
        }
    }

    // -------------------- Helper Functions -------------------------- //
    //
    // Helper functions for the conjugations, measurements and clean up.

    /// Sets the RowWiseBitVec to contain `size` amount of Pauli strings
    /// consisting of identity gates only. No generator coefficient information is stored,
    /// only memory is allocated for it.
    fn set_default(&mut self, size: usize) {
        // With `size` number of Pauli strings, each with `n_qubits` number of gates, which are encoded
        // using two bits.
        self.size = size;
        self.pauli_strings = bitvec![0; 2*self.n_qubits*self.size];
        self.generator_info = Vec::with_capacity(self.size);
        self.h_s_conjugations_map = HSConjugationsMap::new(self.n_qubits);
    }

    /// Returns the gate of the Pauli string from the provided indices
    fn get_pauli_gate(&self, pstr_ind: usize, gate_ind: usize) -> PauliGate {
        let index = self.pstr_gate_index(pstr_ind, gate_ind);
        PauliUtils::pauli_gate_from_tuple(self.pauli_strings[index], self.pauli_strings[index + 1])
    }

    /// Sets the gate of the Pauli string at the provided indices with the
    /// provided PauliGate
    fn set_pauli_gate(&mut self, p_gate: PauliGate, pstr_ind: usize, gate_ind: usize) {
        let index = self.pstr_gate_index(pstr_ind, gate_ind);

        let (b1, b2) = PauliUtils::pauli_gate_as_tuple(p_gate);

        self.pauli_strings.set(index, b1);
        self.pauli_strings.set(index + 1, b2);
    }

    /// Get the internal index of the gate of the Pauli string at the given indices
    fn pstr_gate_index(&self, pstr_ind: usize, gate_ind: usize) -> usize {
        2 * pstr_ind * self.n_qubits + 2 * gate_ind
    }

    /// Get the index of the first bit of the Pauli string at the given index
    fn pstr_first_bit(&self, pstr_ind: usize) -> usize {
        2 * pstr_ind * self.n_qubits
    }

    /// Get the index of the last bit of Pauli string at the given index
    fn pstr_last_bit(&self, pstr_ind: usize) -> usize {
        self.pstr_first_bit(pstr_ind) + 2 * self.n_qubits - 1
    }

    /// Returns the bitslice with the bits of the Pauli string at the given index
    fn pstr_as_bitslice(&self, pstr_ind: usize) -> &BitSlice {
        let start = self.pstr_first_bit(pstr_ind);
        let end = self.pstr_last_bit(pstr_ind);
        &self.pauli_strings[start..=end]
    }

    /// Clones the bits of the Pauli string at the provided index and appends
    /// them to the end of the bitvec.
    fn extend_from_within(&mut self, pstr_ind: usize) {
        let start = self.pstr_first_bit(pstr_ind);
        let end = self.pstr_last_bit(pstr_ind);
        self.pauli_strings.extend_from_within(start..=end);
    }

    /// Apply the H and S conjugations to all the gates of all the Pauli strings.
    fn apply_all_h_s_conjugations(&mut self) {
        for pstr_ind in 0..self.size {
            for gate_ind in 0..self.n_qubits {
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
            &self
                .h_s_conjugations_map
                .get_coefficient_multiplier(j, current_p_gate),
        );
    }

    // Return a parallel iterator over chunks of Pauli strings and their coefficients
    fn get_parallel_iterator(
        &mut self,
    ) -> IterBridge<Zip<BitSliceChunksMut<'_, usize, LocalBits>, ChunksMut<'_, CoefficientList>>>
    {
        // Each thread will conjugate self.size / self.n_threads Pauli strings.
        // As a single Pauli string is 2 * self.num_qubits bits,
        // each process needs 2 * self.num_qubits * (self.size / self.n_threads) bits.
        let pstrs_per_chunk = if self.size < self.n_threads {
            self.size() / self.n_threads
        } else {
            1
        };
        let bits_per_thread = (2 * self.n_qubits) * pstrs_per_chunk;

        // Iterator we want to parallelize
        self.pauli_strings
            .chunks_mut(bits_per_thread)
            .zip(self.generator_info.chunks_mut(pstrs_per_chunk))
            .par_bridge()
    }

    // -------------------- (Non-Self) Helper Functions -------------------------- //
    //
    // The following functions are deliberately not associated to self, to make sharing
    // among threads easier. They are also deliberately not moved to the Pauli utils
    // module, as they are specific to the RowWiseBitVec implementation.

    /// Returns the gate from the provided index of the
    /// provided UOSBitSlice representing a Pauli string
    fn get_pauli_gate_from_uos_bitslice(pstr: &UOSBitSlice, gate_ind: usize) -> PauliGate {
        match pstr {
            UOSBitSlice::Usize(bits) => {
                PauliUtils::pauli_gate_from_tuple(bits[2 * gate_ind], bits[2 * gate_ind + 1])
            }
            UOSBitSlice::BitSafeUsize(bits) => {
                PauliUtils::pauli_gate_from_tuple(bits[2 * gate_ind], bits[2 * gate_ind + 1])
            }
        }
    }

    /// Set the gate at the provided index of the provided UOSBitSlice representing a
    /// Pauli string with the provided PauliGate
    fn set_pauli_gate_in_uos_bitslice(pstr: &mut UOSBitSlice, pgate: PauliGate, gate_ind: usize) {
        let (b1, b2) = PauliUtils::pauli_gate_as_tuple(pgate);
        match pstr {
            UOSBitSlice::Usize(bits) => {
                bits.set(2 * gate_ind, b1);
                bits.set(2 * gate_ind + 1, b2);
            }
            UOSBitSlice::BitSafeUsize(bits) => {
                bits.set(2 * gate_ind, b1);
                bits.set(2 * gate_ind + 1, b2);
            }
        }
    }

    /// Apply the H and S conjugations to a provided slice representing a Pauli string and its coefficients.
    fn apply_h_s_conjugations_to_uos_bitslice(
        pstr: &mut UOSBitSlice,
        coefficients: &mut CoefficientList,
        h_s_conjugations_map: &HSConjugationsMap,
        qubit: usize,
    ) {
        let current_p_gate = Self::get_pauli_gate_from_uos_bitslice(pstr, qubit);
        let actual_p_gate = h_s_conjugations_map.get_actual_p_gate(qubit, current_p_gate);

        Self::set_pauli_gate_in_uos_bitslice(pstr, actual_p_gate, qubit);

        coefficients
            .multiply(&h_s_conjugations_map.get_coefficient_multiplier(qubit, current_p_gate));
    }

    // -------------------------- Pauli Pools Helper Functions ------------------------- //

    // Replace the current Pauli strings with the Pauli string in the provided
    // pstrs and coefficents.
    pub fn replace(&mut self, p_strs: &[(BitVec, CoefficientList)]) {
        self.pauli_strings.clear();
        self.generator_info.clear();

        for (pstr, coefficients) in p_strs.iter() {
            self.pauli_strings.extend_from_bitslice(pstr);
            self.generator_info.push(coefficients.clone());
        }

        self.size = self.generator_info.len();
    }

    // -------------------------- CNOT conjugation ------------------------- //

    /// Conjugates the Pauli string and the coefficients with the provided CNOT gate.
    fn conjugate_bitslice_with_cnot(
        pstr: &mut UOSBitSlice,
        coef_list: &mut CoefficientList,
        hs_map: &HSConjugationsMap,
        cnot: &Gate,
    ) {
        let qubit_2 = cnot.qubit_2.unwrap();
        Self::apply_h_s_conjugations_to_uos_bitslice(pstr, coef_list, hs_map, cnot.qubit_1);
        Self::apply_h_s_conjugations_to_uos_bitslice(pstr, coef_list, hs_map, qubit_2);

        let q1_target_p_gate = Self::get_pauli_gate_from_uos_bitslice(pstr, cnot.qubit_1);
        let q2_target_p_gate = Self::get_pauli_gate_from_uos_bitslice(pstr, qubit_2);

        let look_up_output = CNOT_CONJ_UPD_RULES
            .get(&(q1_target_p_gate, q2_target_p_gate))
            .unwrap();

        coef_list.multiply(&look_up_output.coefficient);

        Self::set_pauli_gate_in_uos_bitslice(pstr, look_up_output.q1_p_gate, cnot.qubit_1);
        Self::set_pauli_gate_in_uos_bitslice(pstr, look_up_output.q2_p_gate, qubit_2);
    }

    /// Conjugate each Pauli string in the bitvec with a CNOT gate.
    /// We use the update rules to adjust the Pauli gates and coefficients.
    fn conjugate_cnot(&mut self, cnot: &Gate) {
        if self.n_threads > 1 {
            self.par_conjugate_cnot(cnot)
        } else {
            self.seq_conjugate_cnot(cnot)
        }

        self.h_s_conjugations_map.reset(cnot.qubit_1);
        self.h_s_conjugations_map.reset(cnot.qubit_2.unwrap());
    }

    /// Sequetially conjugates all Pauli strings with a CNOT gate.
    fn seq_conjugate_cnot(&mut self, cnot: &Gate) {
        for pstr_ind in 0..self.size {
            // We don't use `self.pstr_as_bislice_mut` here to avoid borrowing issues
            let start = self.pstr_first_bit(pstr_ind);
            let end = self.pstr_last_bit(pstr_ind);
            let mut pstr = UOSBitSlice::Usize(&mut self.pauli_strings[start..=end]);

            let gen_info = &mut self.generator_info;
            let hs_map = &self.h_s_conjugations_map;

            Self::conjugate_bitslice_with_cnot(&mut pstr, &mut gen_info[pstr_ind], &hs_map, cnot)
        }
    }

    /// Divides all Pauli strings into chunks and processes each chunk in parallel.
    fn par_conjugate_cnot(&mut self, cnot: &Gate) {
        let bits_per_pstr = 2 * self.n_qubits;

        // Copy items from self.h_s_conjugations_map to avoid borrowing issues
        let hs_map = self.h_s_conjugations_map.clone();

        let it = self.get_parallel_iterator();

        it.for_each(|(pstrs_chunk, gen_info_chunk)| {
            let hs_map = hs_map.clone();

            for (pstr_offset, pstr) in pstrs_chunk.chunks_mut(bits_per_pstr).enumerate() {
                let pstr = &mut UOSBitSlice::BitSafeUsize(pstr);
                Self::conjugate_bitslice_with_cnot(
                    pstr,
                    &mut gen_info_chunk[pstr_offset],
                    &hs_map,
                    cnot,
                )
            }
        });
    }

    // -------------------------- Rz Conjugation ------------------------- //

    /// Updates all Pauli strings according to the following rules:
    /// Rz(θ)XRz(θ)^† =  cos(θ)X + sin(θ)Y
    /// Rz(θ)YRz(θ)^† = -sin(θ)X + cos(θ)Y
    /// Rz(θ)^†XRz(θ) =  cos(θ)X - sin(θ)Y
    /// Rz(θ)^†YRz(θ) =  sin(θ)X + cos(θ)Y
    /// Z and I remain unchanged.
    fn conjugate_rz(&mut self, rz: &Gate, conjugate_dagger: bool) {
        if self.n_threads > 1 {
            self.par_conjugate_rz(rz, conjugate_dagger)
        } else {
            self.seq_conjugate_rz(rz, conjugate_dagger)
        }

        self.h_s_conjugations_map.reset(rz.qubit_1);
    }

    fn seq_conjugate_rz(&mut self, rz: &Gate, conjugate_dagger: bool) {
        for pstr_index in 0..self.size {
            self.apply_h_s_conjugations(pstr_index, rz.qubit_1);

            let target_pgate = self.get_pauli_gate(pstr_index, rz.qubit_1);

            if target_pgate == PauliGate::Z || target_pgate == PauliGate::I {
                continue;
            }

            // We create a new Pauli string
            // And ensure the original Pauli string has an X gate at the target qubit
            // and ensure the copied Pauli string has an Y gate at the target qubit
            self.extend_from_within(pstr_index);
            self.set_pauli_gate(PauliGate::X, pstr_index, rz.qubit_1);
            self.set_pauli_gate(PauliGate::Y, self.size, rz.qubit_1);

            self.generator_info
                .push(self.generator_info[pstr_index].clone());

            self.size += 1;

            let (x_mult, y_mult) =
                Utils::rz_conj_coef_multipliers(rz, &target_pgate, conjugate_dagger);

            self.generator_info[pstr_index].multiply(&x_mult);
            self.generator_info.last_mut().unwrap().multiply(&y_mult);
        }
    }

    fn par_conjugate_rz(&mut self, rz: &Gate, conjugate_dagger: bool) {
        let num_qubits = self.n_qubits;
        let hs_map = self.h_s_conjugations_map.clone();

        struct NewPstrs {
            pstrs: BitVec,
            gen_info: Vec<CoefficientList>,
        }

        // Allocate enough memory for self.size / 2 new Pauli strings
        self.pauli_strings.reserve(self.size * num_qubits);

        let all_new_pstrs = Mutex::new(NewPstrs {
            pstrs: BitVec::with_capacity(self.size * num_qubits),
            gen_info: Vec::with_capacity(self.size / 2),
        });

        let it = self.get_parallel_iterator();
        it.for_each(|(pstrs_chunk, gen_info_chunk)| {
            let hs_map = hs_map.clone();
            let mut new_pstrs: BitVec<BitSafeUsize, Lsb0> =
                BitVec::with_capacity(pstrs_chunk.len());
            let mut new_gen_info = Vec::with_capacity(gen_info_chunk.len());

            for (pstr_offset, pstr) in pstrs_chunk.chunks_mut(2 * num_qubits).enumerate() {
                Self::apply_h_s_conjugations_to_uos_bitslice(
                    &mut UOSBitSlice::BitSafeUsize(pstr),
                    &mut gen_info_chunk[pstr_offset],
                    &hs_map,
                    rz.qubit_1,
                );

                let target_pgate = Self::get_pauli_gate_from_uos_bitslice(
                    &mut UOSBitSlice::BitSafeUsize(pstr),
                    rz.qubit_1,
                );

                if target_pgate == PauliGate::Z || target_pgate == PauliGate::I {
                    continue;
                }

                let mut new_pstr = BitVec::from_bitslice(pstr);
                Self::set_pauli_gate_in_uos_bitslice(
                    &mut UOSBitSlice::BitSafeUsize(pstr),
                    PauliGate::X,
                    rz.qubit_1,
                );
                Self::set_pauli_gate_in_uos_bitslice(
                    &mut UOSBitSlice::BitSafeUsize(&mut new_pstr),
                    PauliGate::Y,
                    rz.qubit_1,
                );

                new_gen_info.push(gen_info_chunk[pstr_offset].clone());

                let (x_mult, y_mult) =
                    Utils::rz_conj_coef_multipliers(rz, &target_pgate, conjugate_dagger);

                gen_info_chunk[pstr_offset].multiply(&x_mult);
                new_gen_info.last_mut().unwrap().multiply(&y_mult);

                new_pstrs.extend_from_bitslice(&new_pstr);
            }

            let mut new_data = all_new_pstrs.lock().unwrap();
            new_data.pstrs.extend_from_bitslice(&new_pstrs);
            new_data.gen_info.extend_from_slice(&new_gen_info);
        });

        let new_data = all_new_pstrs.lock().unwrap();

        self.pauli_strings.extend_from_bitslice(&new_data.pstrs);
        self.generator_info.extend_from_slice(&new_data.gen_info);
        self.size = self.generator_info.len();
    }

    // -------------------------- Clean Up ------------------------- //

    /// Gather all unique Pauli strings in a map.
    /// Important! the row wise bitvector is emptied in order to populate te map. They should be scattered back.
    // Declared public for Pauli Pools
    pub fn gather(&mut self) -> HashMap<BitVec, CoefficientList, FxBuildHasher> {
        let mut map = HashMap::<BitVec, CoefficientList, FxBuildHasher>::with_capacity_and_hasher(
            self.size,
            FxBuildHasher::default(),
        );

        let mut gen_info = std::mem::take(&mut self.generator_info);

        for (pstr_ind, coef_list) in gen_info.drain(..).enumerate() {
            let pstr = self.pstr_as_bitslice(pstr_ind).to_bitvec();

            PauliMap::insert_pstr_bitvec_into_map(&mut map, pstr, coef_list)
        }
        self.pauli_strings.clear();
        self.size = 0;
        map
    }

    /// Scatter the Pauli strings in the provided map to the bitvec
    // Declared public for Pauli Pools
    pub fn scatter(&mut self, mut map: HashMap<BitVec, CoefficientList, FxBuildHasher>) {
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

impl GeneratorSet for RowWiseBitVec {
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
        // Scatter them back in case we want to apply more gates
        self.scatter(pstrs.clone());

        PauliMap::from_map(pstrs, self.n_qubits).is_x_or_z_generators(check_zero_state)
    }

    fn is_single_x_or_z_generator(&mut self, check_zero_state: bool, i: usize) -> bool {
        self.apply_all_h_s_conjugations();

        let mut pstrs = self.gather();
        PauliMap::clean_map(&mut pstrs);
        // Scatter them back in case we want to apply more gates
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
        self.apply_all_h_s_conjugations();
        self.clean();

        // We clone instead of using std::mem::take in case
        // we want to apply more gates
        MeasurementSampler::new(
            self.pauli_strings.clone(),
            self.generator_info.clone(),
            self.n_qubits,
        )
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

            for qubit_index in 0..self.n_qubits {
                let current_p_gate = self.get_pauli_gate(pstr_index, qubit_index);
                let actual_p_gate = self
                    .h_s_conjugations_map
                    .get_actual_p_gate(qubit_index, current_p_gate);

                coef_multiplier *= self
                    .h_s_conjugations_map
                    .get_coefficient_multiplier(qubit_index, current_p_gate)
                    .as_f64();

                s.push_str(&format!("{}", actual_p_gate));
            }

            s.push_str(" (");

            for c in self.generator_info[pstr_index].coefficients.iter() {
                s.push_str(&format!("{}: {}, ", c.0, c.1.as_f64() * coef_multiplier));
            }
            s.push_str(")\n");
        }
        write!(f, "{}", s)
    }
}
