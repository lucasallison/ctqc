use std::collections::{hash_map::Entry, HashMap};
use std::fmt;

use bitvec::prelude::*;
use fxhash::FxBuildHasher;
use ordered_float::OrderedFloat;

// Explicit use statements for parallel iteration
use bitvec::slice::ChunksMut as BitSliceChunksMut;
use rayon::iter::ParallelBridge;
use rayon::iter::{IterBridge, ParallelIterator};
use std::iter::Zip;
use std::slice::ChunksMut;

use super::measurement_sampler::MeasurementSampler;
use super::pauli_map::PauliMap;
use super::pauli_string::utils as PauliUtils;
use super::pauli_string::PauliGate;
use super::shared::coefficient_list::CoefficientList;
use super::shared::h_s_conjugations_map::HSConjugationsMap;
use super::shared::FP_ERROR_MARGIN;
use super::utils::conjugation_look_up_tables::CNOT_CONJ_UPD_RULES;
use super::GeneratorSet;

use crate::circuit::{Gate, GateType};

pub struct ColumnWiseBitVec {
    columns: Vec<BitVec>,
    generator_info: Vec<CoefficientList>,
    h_s_conjugations_map: HSConjugationsMap,
    n_qubits: usize,
    n_threads: usize,
}

impl ColumnWiseBitVec {
    pub fn new(n_qubits: usize, n_threads: usize) -> ColumnWiseBitVec {
        if n_threads > 1 {
            eprintln!(
                "WARNING: column-wise bitvector does not support parallelism. Ignoring n_threads."
            );
        }

        ColumnWiseBitVec {
            columns: vec![bitvec![0; 2*n_qubits]; n_qubits],
            generator_info: Vec::with_capacity(n_qubits),
            h_s_conjugations_map: HSConjugationsMap::new(n_qubits),
            n_qubits,
            n_threads,
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
    fn set_pauli_gate(&mut self, p_gate: PauliGate, pstr_ind: usize, gate_ind: usize) {
        let column = &mut self.columns[gate_ind];
        let (b1, b2) = PauliUtils::pauli_gate_as_tuple(p_gate);

        column.set(2 * pstr_ind, b1);
        column.set(2 * pstr_ind + 1, b2)
    }

    // Clear all columns
    fn clear_columns(&mut self) {
        for column in self.columns.iter_mut() {
            column.clear();
        }
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
            self.h_s_conjugations_map
                .get_coefficient_multiplier(gate_ind, current_p_gate),
        );
    }

    // -------------------------- Parallel Helper Function ------------------------- //

    /// Returns a mutable parallel iterator over the two provided columns.
    fn get_parallel_double_column_iterator<'a>(
        &mut self,
        col_1: &'a mut BitVec,
        col_2: &'a mut BitVec,
    ) -> IterBridge<
        Zip<
            Zip<BitSliceChunksMut<'a, usize, Lsb0>, BitSliceChunksMut<'a, usize, Lsb0>>,
            ChunksMut<'_, CoefficientList>,
        >,
    > {
        //-> IterBridge<Zip<BitSliceChunksMut<'_, usize, Lsb0>, BitSliceChunksMut<'_, usize, Lsb0>,ChunksMut<'_, CoefficientList>>
        // A thread will process a chunk of gates_per_chunk gates
        let gates_per_chunk = if self.size() < self.n_threads {
            self.size() / self.n_threads
        } else {
            1
        };
        let bits_per_thread = 2 * gates_per_chunk;

        let col_1_iter = col_1.chunks_mut(bits_per_thread);
        let col_2_iter = col_2.chunks_mut(bits_per_thread);
        let gen_info_iter = self.generator_info.chunks_mut(gates_per_chunk);

        let zipped = col_1_iter.zip(col_2_iter).zip(gen_info_iter);

        zipped.par_bridge()
    }

    /// Returns a mutable parallel iterator over the column with the provided index.
    fn get_parallel_column_iterator(
        &mut self,
        col_ind: usize,
    ) -> IterBridge<Zip<BitSliceChunksMut<'_, usize, LocalBits>, ChunksMut<'_, CoefficientList>>>
    {
        // A thread will process a chunk of gates_per_chunk gates
        let gates_per_chunk = if self.size() < self.n_threads {
            self.size() / self.n_threads
        } else {
            1
        };
        let bits_per_thread = 2 * gates_per_chunk;

        self.columns[col_ind]
            .chunks_mut(bits_per_thread)
            .zip(self.generator_info.chunks_mut(gates_per_chunk))
            .par_bridge()
    }

    fn get_two_columns_mut(
        columns: &mut Vec<BitVec>,
        col_ind_1: usize,
        col_ind_2: usize,
    ) -> (&mut BitVec, &mut BitVec) {
        if col_ind_1 == col_ind_2 {
            panic!("Cant get two columns mutabily if they are the same");
        }

        if col_ind_1 > col_ind_2 {
            let (mut_col_l, mut_col_r) = columns.split_at_mut(col_ind_1);
            (&mut mut_col_r[0], &mut mut_col_l[col_ind_2])
        } else {
            let (mut_col_l, mut_col_r) = columns.split_at_mut(col_ind_1);
            (&mut mut_col_r[0], &mut mut_col_l[col_ind_2])
        }
    }

    // -------------------------- CNOT Conjugation ------------------------- //

    fn conjugate_cnot(&mut self, cnot: &Gate) {
        if self.n_threads > 1 {
            self.par_conjugate_cnot(cnot)
        } else {
            self.seq_conjugate_cnot(cnot)
        }

        self.h_s_conjugations_map.reset(cnot.qubit_1);
        self.h_s_conjugations_map.reset(cnot.qubit_2.unwrap());
    }

    fn seq_conjugate_cnot(&mut self, cnot: &Gate) {
        let qubit_2 = cnot.qubit_2.unwrap();

        for pstr_index in 0..self.size() {
            self.apply_h_s_conjugations(pstr_index, cnot.qubit_1);
            self.apply_h_s_conjugations(pstr_index, qubit_2);

            let q1_target_p_gate = self.get_pauli_gate(pstr_index, cnot.qubit_1);
            let q2_target_p_gate = self.get_pauli_gate(pstr_index, qubit_2);

            let look_up_output = CNOT_CONJ_UPD_RULES
                .get(&(q1_target_p_gate, q2_target_p_gate))
                .unwrap();

            self.generator_info[pstr_index].multiply(look_up_output.coefficient);

            self.set_pauli_gate(look_up_output.q1_p_gate, pstr_index, cnot.qubit_1);
            self.set_pauli_gate(look_up_output.q2_p_gate, pstr_index, qubit_2);
        }
    }


    fn par_conjugate_cnot(&mut self, cnot: &Gate) {
        let qubit_2 = cnot.qubit_2.unwrap();

        let mut columns = std::mem::take(&mut self.columns);

        let (q1_col, q2_col) =
            ColumnWiseBitVec::get_two_columns_mut(&mut columns, cnot.qubit_1, qubit_2);

        let it = self.get_parallel_double_column_iterator(q1_col, q2_col);

        it.for_each(|((q1_col_chunk, q2_col_chunk), gen_info)| {
            // Grab the gates in the chunk, each gate is two bits
            let q1_gates_iter = q1_col_chunk.chunks_exact_mut(2);
            let q2_gates_iter = q2_col_chunk.chunks_exact_mut(2);

            for ((q1_gate_bits, q2_gate_bits), coef_list) in
                q1_gates_iter.zip(q2_gates_iter).zip(gen_info.iter_mut())
            {

                let current_q1_gate = PauliUtils::pauli_gate_from_tuple(q1_gate_bits[0], q1_gate_bits[1]);
                let current_q2_gate = PauliUtils::pauli_gate_from_tuple(q2_gate_bits[0], q2_gate_bits[1]);

                let actual_q1_gate = PauliUtils::pauli_gate_from_tuple(q1_gate_bits[0], q1_gate_bits[1]);
                let actual_q2_gate = PauliUtils::pauli_gate_from_tuple(q2_gate_bits[0], q2_gate_bits[1]);

                // TODO
            }
        });

        self.columns = std::mem::take(&mut columns);
    }


    // -------------------------- Rz Conjugation ------------------------- //

    /// Returns all the indices of Pauli strings that have an X or Y gate in the provided column
    /// and applies the H and S conjugations to the provided column
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
    fn conjugate_rz(&mut self, gate: &Gate, conjugate_dagger: bool) {
        // First check where X and Y gates are in the column and apply the H and S conjugations.
        let x_y_pos = self.x_y_in_column(gate.qubit_1);

        // Copy the Pauli strings that have X or Y gates in the column
        for gate_ind in 0..self.columns.len() {
            for pstr_ind in x_y_pos.iter() {
                let pgate = self.get_pauli_gate(*pstr_ind, gate_ind);
                let (b1, mut b2) = PauliUtils::pauli_gate_as_tuple(pgate);

                // We adjust the coeffients of the old and new Pauli strings based on
                // the gate that is conjugated with the T gate
                if gate_ind == gate.qubit_1 {
                    // Whevenver we conjugate with a T gate, the new Pauli string will
                    // have the same gates except for the gate that the T gate conjugates.
                    // There an X gate will become a Y gate and vice versa.
                    // Since an X is encode as 10 and Y as 11, we can simply flip the second bit.
                    b2 = !b2;

                    self.generator_info
                        .push(self.generator_info[*pstr_ind].clone());

                    match pgate {
                        PauliGate::X => {
                            // Rz(θ)^†XRz(θ) = cos(θ)X  - sin(θ)Y
                            // Rz(θ)XRz(θ)^† = cos(θ)X  + sin(θ)Y
                            self.generator_info[*pstr_ind].multiply(gate.angle.unwrap().cos());
                            self.generator_info
                                .last_mut()
                                .unwrap()
                                .multiply(gate.angle.unwrap().sin());

                            if conjugate_dagger {
                                self.generator_info.last_mut().unwrap().multiply(-1.0);
                            }
                        }

                        PauliGate::Y => {
                            // Rz(θ)YRz(θ)^† = -sin(θ)X + cos(θ)Y
                            // Rz(θ)^†YRz(θ) = sin(θ)X  + cos(θ)Y
                            self.generator_info[*pstr_ind].multiply(gate.angle.unwrap().cos());
                            self.generator_info
                                .last_mut()
                                .unwrap()
                                .multiply(gate.angle.unwrap().sin());

                            if !conjugate_dagger {
                                self.generator_info.last_mut().unwrap().multiply(-1.0);
                            }
                        }

                        _ => {
                            unreachable!();
                        }
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
            let mut pstr: BitVec = BitVec::with_capacity(2 * self.n_qubits);
            for gate_ind in 0..self.n_qubits {
                let current_p_gate = self.get_pauli_gate(pstr_ind, gate_ind);
                let (b1, b2) = PauliUtils::pauli_gate_as_tuple(current_p_gate);

                pstr.push(b1);
                pstr.push(b2);
            }

            // PauliMap::insert_pstr_bitvec_into_map(&mut map, pstr, self.generator_info[pstr_ind].clone());

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
        self.clear_columns();
        self.generator_info.clear();

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
        self.set_default(self.n_qubits);

        let p_gate = if zero_state_generators {
            PauliGate::Z
        } else {
            PauliGate::X
        };

        for generator_index in 0..self.n_qubits {
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

        for gate_ind in 0..self.n_qubits {
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
    fn conjugate(&mut self, gate: &Gate, conjugate_dagger: bool) {
        match gate.gate_type {
            GateType::H | GateType::S => self.h_s_conjugations_map.update(gate, conjugate_dagger),
            GateType::CNOT => self.conjugate_cnot(gate),
            GateType::Rz => self.conjugate_rz(gate, conjugate_dagger),
        }
    }

    fn get_measurement_sampler(&mut self) -> MeasurementSampler {
        unimplemented!()
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
            for gate_ind in 0..self.n_qubits {
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
