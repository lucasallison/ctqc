use bitvec::access::BitSafeUsize;
use bitvec::prelude::*;
use fxhash::FxBuildHasher;
use ordered_float::OrderedFloat;
use rand::prelude::*;
use core::panic;
use std::collections::{hash_map::Entry, HashMap};
use std::error::Error;
use std::fmt;
use std::thread::{self, JoinHandle};
use std::sync::{Arc, RwLock};

use super::coefficient_list::{CoefficientList, self};
use super::conjugation_look_up_tables::CNOT_CONJ_UPD_RULES;
use super::h_s_conjugations_map::HSConjugationsMap;
use super::pauli_string::PauliGate;
use super::GeneratorSet;
use super::row_wise_bitvec::RowWiseBitVec;
use super::ONE_OVER_SQRT_TWO;
use crate::circuit::{Gate, GateType};
use crate::FP_ERROR_MARGIN;

pub struct PauliPools {

    // Each thread will manage 1 Pauli pool. Each pool is
    // managed by using a RowWiseBitvec.
    pauli_pools: Vec<RowWiseBitVec>, 
    n_threads: usize,
    n_qubits: usize,
}

impl PauliPools {
    // Creates and returns an empty RowWiseBitVec
    pub fn new(n_qubits: usize, n_threads: usize) -> PauliPools {

        PauliPools {
            pauli_pools: Vec::with_capacity(n_threads),
            n_threads: n_threads,
            n_qubits: n_qubits,
        }

    }

    fn merge_and_distribute(&mut self) {

        let mut p_strs = HashMap::<BitVec, CoefficientList, FxBuildHasher>::with_capacity_and_hasher(
            self.size(),
            FxBuildHasher::default(),
        );
        
        // Collect all Pauli strings from all RowWiseBitVecs
        for rwbv in &mut self.pauli_pools {

            let mut rwbv_p_strs = rwbv.gather();

            for (p_str, coeff_list) in rwbv_p_strs.drain() {
                match p_strs.entry(p_str) {
                    Entry::Occupied(mut e) => {
                        e.get_mut().merge(&coeff_list);
                    }
                    Entry::Vacant(e) => {
                        e.insert(coeff_list);
                    }
                }
            }
        }


        // Redistribution of Pauli strings
        let p_strs: Vec<_> = p_strs.into_iter().collect();
        let p_strs_per_pool = (p_strs.len() as f64 / self.n_threads as f64).ceil() as usize;

        for (i, chunk) in p_strs.chunks(p_strs_per_pool).enumerate() {
            self.pauli_pools[i].replace(chunk);
        }
        
    }

    fn set_pauli_gate_in_bitvec(
        p_str: &mut BitVec,
        p_gate: PauliGate,
        j: usize,
    ) {
        let (b1, b2) = PauliGate::pauli_gate_as_tuple(p_gate);
        p_str.set(2*j, b1);
        p_str.set(2*j + 1, b2);
    }
}

impl GeneratorSet for PauliPools {
    /// Initialize the RowWiseBitVec with the generators of the all zero state or all plus state.
    fn init_generators(&mut self, zero_state_generators: bool) {
        let p_gate = if zero_state_generators {
            PauliGate::Z
        } else {
            PauliGate::X
        };

        let p_strs_per_pool = (self.n_qubits as f64 / self.n_threads as f64).ceil() as usize;

        for pool_index in 0..self.n_threads {

            let mut p_strs = HashMap::<BitVec, CoefficientList, FxBuildHasher>::with_capacity_and_hasher(
                self.n_qubits,
                FxBuildHasher::default(),
                );
            
            let mut p_str_in_pool_index = 0;

            loop {

                let generator_index = pool_index * p_strs_per_pool + p_str_in_pool_index;

                if generator_index >= self.n_qubits || p_str_in_pool_index >= p_strs_per_pool {
                    break;
                }
            
                let mut p_str = BitVec::repeat(false, self.n_qubits * 2);
                Self::set_pauli_gate_in_bitvec(&mut p_str, p_gate, generator_index);

                match p_strs.entry(p_str) {
                    Entry::Occupied(_) => {
                        panic!("Duplicate generator found in the generator set.")
                    }
                    Entry::Vacant(e) => {
                        e.insert(CoefficientList::new(generator_index));
                    }
                }
                
                p_str_in_pool_index += 1;
            }

            self.pauli_pools.push(RowWiseBitVec::new(self.n_qubits));
            self.pauli_pools.last_mut().unwrap().scatter(p_strs);
        }

    }

    /// Initialize the RowWiseBitVec with the ith generator of the all zero state or all plus state.
    fn init_single_generator(&mut self, i: usize, zero_state_generator: bool) {
        unimplemented!()
    }

    fn is_x_or_z_generators(&mut self, _check_zero_state: bool) -> bool {
        unimplemented!()
    }

    fn is_single_x_or_z_generator(&mut self, check_zero_state: bool, i: usize) -> bool {
        unimplemented!()
    }

    /// Conjugates all stored Pauli strings with the provided gate.
    fn conjugate(&mut self, gate: &Gate, conjugate_dagger: bool) -> Result<(), Box<dyn Error>> {

        thread::scope(|scope| {
            for rwbv in &mut self.pauli_pools 
            {
                scope.spawn(move || {
                    rwbv.conjugate(gate, conjugate_dagger).unwrap();
                });
            }
        });

        Ok(())
    }

    fn measure(&mut self, i: usize) -> (bool, f64) {
        unimplemented!()
    }

    /// Merges all duplicate Pauli strings and removes all Pauli strings
    /// with zero coefficients.
    fn clean(&mut self) {
        thread::scope(|scope| {
            for rwbv in &mut self.pauli_pools 
            {
                scope.spawn(move || {
                    rwbv.clean();
                });
            }
        });

        self.merge_and_distribute();
    }

    fn size(&self) -> usize {
        let mut size: usize = 0;

        for pool in &self.pauli_pools {
            size += pool.size();
        }

        size
    }
}

impl fmt::Display for PauliPools {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let mut s = String::new();

        for (i, pool) in self.pauli_pools.iter().enumerate() {
            s.push_str(&format!("Pauli Pool {}:\n{}\n", i, pool));
        }

        write!(f, "{}", s)
    }
}
