use log::warn;
use std::collections::HashMap;
use std::fmt;

use bitvec::prelude::*;
use fxhash::FxBuildHasher;
use rayon::prelude::*;

use super::measurement_sampler::MeasurementSampler;
use super::pauli_map::PauliMap;
use super::row_wise_bitvec::RowWiseBitVec;
use super::shared::coefficient_list::CoefficientList;
use super::GeneratorSet;

use crate::circuit::Gate;

// TODO Implement a batch conjugation
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
        if n_threads < 2 {
            warn!("WARNING! n_threads < 2, using 2 threads instead.");
        }

        let n_threads = if n_threads < 2 { 2 } else { n_threads };

        let mut pp = PauliPools {
            pauli_pools: Vec::with_capacity(n_threads),
            n_threads: n_threads,
            n_qubits: n_qubits,
        };

        for _ in 0..n_threads {
            pp.pauli_pools.push(RowWiseBitVec::new(n_qubits, 1));
        }

        pp
    }

    /// Collect all Pauli strings from all the row-wise bitvectors
    fn gather(&mut self) -> HashMap<BitVec, CoefficientList, FxBuildHasher> {
        let mut pstrs = HashMap::<BitVec, CoefficientList, FxBuildHasher>::with_capacity_and_hasher(
            self.size(),
            FxBuildHasher::default(),
        );

        for rwbv in &mut self.pauli_pools {
            let mut rwbv_pstrs = rwbv.gather();

            for (pstr, coeff_list) in rwbv_pstrs.drain() {
                PauliMap::insert_pstr_bitvec_into_map(&mut pstrs, pstr, coeff_list);
            }
        }

        pstrs
    }

    /// Redistributes the Pauli strings amoung the row-wise bitvectors
    fn scatter(&mut self, pstrs: HashMap<BitVec, CoefficientList, FxBuildHasher>) {
        let n_pstrs = pstrs.len();
        let pstrs: Vec<_> = pstrs.into_iter().collect();
        let pstrs_per_pool = n_pstrs.div_ceil(self.n_threads);

        for (i, chunk) in pstrs.chunks(pstrs_per_pool).enumerate() {
            self.pauli_pools[i].replace(chunk);
        }
    }
}

impl GeneratorSet for PauliPools {
    /// Initialize the RowWiseBitVec with the generators of the all zero state or all plus state.
    fn init_generators(&mut self, zero_state_generators: bool) {
        let mut gm = PauliMap::new(self.n_qubits);
        gm.init_generators(zero_state_generators);
        let generators = gm.take_pstr_map();

        self.scatter(generators);
    }

    fn init_single_generator(&mut self, i: usize, zero_state_generator: bool) {
        let mut gm = PauliMap::new(self.n_qubits);
        gm.init_single_generator(i, zero_state_generator);
        let generators = gm.take_pstr_map();

        self.scatter(generators);
    }

    fn is_x_or_z_generators(&mut self, check_zero_state: bool) -> bool {
        let mut pstrs = PauliMap::from_map(self.gather(), self.n_qubits);
        let res = pstrs.is_x_or_z_generators(check_zero_state);

        // In case we want to continue
        self.scatter(pstrs.take_pstr_map());

        res
    }

    fn is_single_x_or_z_generator(&mut self, check_zero_state: bool, i: usize) -> bool {
        let mut pstrs = PauliMap::from_map(self.gather(), self.n_qubits);

        let res = pstrs.is_single_x_or_z_generator(check_zero_state, i);

        self.scatter(pstrs.take_pstr_map());

        res
    }

    /// Conjugates all stored Pauli strings with the provided gate.
    fn conjugate(&mut self, gate: &Gate, conjugate_dagger: bool) {
        self.pauli_pools.par_iter_mut().for_each(|rwbv| {
            rwbv.conjugate(gate, conjugate_dagger);
        });
    }

    fn get_measurement_sampler(&mut self) -> MeasurementSampler {
        let mut pstrs = self.gather();
        PauliMap::clean_map(&mut pstrs);
        self.scatter(pstrs.clone());
        MeasurementSampler::from_map(pstrs, self.n_qubits)
    }

    /// Merges all duplicate Pauli strings and removes all Pauli strings
    /// with zero coefficients.
    fn clean(&mut self) {
        let mut pstrs = self.gather();
        PauliMap::clean_map(&mut pstrs);
        self.scatter(pstrs);
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
