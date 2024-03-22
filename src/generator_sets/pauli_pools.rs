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

    fn gather(&mut self) -> HashMap<BitVec, CoefficientList, FxBuildHasher> {
        let mut pstrs = HashMap::<BitVec, CoefficientList, FxBuildHasher>::with_capacity_and_hasher(
            self.size(),
            FxBuildHasher::default(),
        );

        // Collect all Pauli strings from all RowWiseBitVecs
        for rwbv in &mut self.pauli_pools {
            let mut rwbv_pstrs = rwbv.gather();

            for (pstr, coeff_list) in rwbv_pstrs.drain() {
                PauliMap::insert_pstr_bitvec_into_map(&mut pstrs, pstr, coeff_list);
            }
        }

        pstrs
    }

    fn scatter(&mut self, mut pstrs: HashMap<BitVec, CoefficientList, FxBuildHasher>) {
        PauliMap::clean_map(&mut pstrs);

        // Redistribution of Pauli strings
        let pstrs: Vec<_> = pstrs.into_iter().collect();
        let pstrs_per_pool = (pstrs.len() as f64 / self.n_threads as f64).ceil() as usize;

        for (i, chunk) in pstrs.chunks(pstrs_per_pool).enumerate() {
            self.pauli_pools[i].replace(chunk);
        }
    }

    fn merge_and_distribute(&mut self) {
        let pstrs = self.gather();
        self.scatter(pstrs);
    }
}

impl GeneratorSet for PauliPools {
    /// Initialize the RowWiseBitVec with the generators of the all zero state or all plus state.
    fn init_generators(&mut self, zero_state_generators: bool) {
        let mut gm = PauliMap::new(self.n_qubits, 1);
        gm.init_generators(zero_state_generators);
        let generators = gm.take_pstr_map();

        self.scatter(generators);

        // let p_gate = if zero_state_generators {
        //     PauliGate::Z
        // } else {
        //     PauliGate::X
        // };

        // let p_strs_per_pool = (self.n_qubits as f64 / self.n_threads as f64).ceil() as usize;

        // for pool_index in 0..self.n_threads {
        //     let mut p_strs =
        //         HashMap::<BitVec, CoefficientList, FxBuildHasher>::with_capacity_and_hasher(
        //             self.n_qubits,
        //             FxBuildHasher::default(),
        //         );

        //     let mut p_str_in_pool_index = 0;

        //     loop {
        //         let generator_index = pool_index * p_strs_per_pool + p_str_in_pool_index;

        //         if generator_index >= self.n_qubits || p_str_in_pool_index >= p_strs_per_pool {
        //             break;
        //         }

        //         let mut p_str = BitVec::repeat(false, self.n_qubits * 2);
        //         Self::set_pauli_gate_in_bitvec(&mut p_str, p_gate, generator_index);

        //         match p_strs.entry(p_str) {
        //             Entry::Occupied(_) => {
        //                 panic!("Duplicate generator found in the generator set.")
        //             }
        //             Entry::Vacant(e) => {
        //                 e.insert(CoefficientList::new(generator_index));
        //             }
        //         }

        //         p_str_in_pool_index += 1;
        //     }

        //     self.pauli_pools.push(RowWiseBitVec::new(self.n_qubits, 1));
        //     self.pauli_pools.last_mut().unwrap().scatter(p_strs);
        // }
    }

    fn init_single_generator(&mut self, i: usize, zero_state_generator: bool) {
        let mut gm = PauliMap::new(self.n_qubits, 1);
        gm.init_single_generator(i, zero_state_generator);
        let generators = gm.take_pstr_map();

        self.scatter(generators);
    }

    fn is_x_or_z_generators(&mut self, check_zero_state: bool) -> bool {
        let mut pstrs = PauliMap::from_map(self.gather(), self.n_qubits);

        let res = pstrs.is_x_or_z_generators(check_zero_state);

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
        self.pauli_pools.par_iter_mut().for_each(|rwbv| {
            rwbv.clean();
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
