use std::fmt::Display;

use crate::circuit::Gate;

mod measurement_sampler;
use measurement_sampler::MeasurementSampler;

mod pauli_string;
mod shared;
mod utils;

// Implementations of the GeneratorSet trait
pub mod column_wise_bitvec;
pub mod pauli_map;
pub mod pauli_pools;
pub mod pauli_trees;
pub mod row_wise_bitvec;

use column_wise_bitvec::ColumnWiseBitVec;
use pauli_map::PauliMap;
use pauli_pools::PauliPools;
use pauli_trees::PauliTrees;
use row_wise_bitvec::RowWiseBitVec;

pub trait GeneratorSet: Display {
    /// Initialize the generator set with the generators of the all zero state or all plus state.
    fn init_generators(&mut self, zero_state_generators: bool);

    /// Initialize the generator set with the ith generator of the all zero/plus state.
    fn init_single_generator(&mut self, i: usize, zero_state_generator: bool);

    /// Returns true if the generator set contains exactly the generators of the all zero/plust state.
    fn is_x_or_z_generators(&mut self, check_zero_state: bool) -> bool;

    /// Returns true if the generator set contains only the ith generator of the all zero/plust state.
    fn is_single_x_or_z_generator(&mut self, check_zero_state: bool, i: usize) -> bool;

    /// Conjugates all stored Pauli strings with the provided gate.
    fn conjugate(&mut self, gate: &Gate, conjugate_dagger: bool);

    /// Return a measurment sampler for the state represented by the generator set
    /// at the moment the function is called.
    fn get_measurement_sampler(&mut self) -> MeasurementSampler;

    /// Performs any clean-up operations on the generator set, such as, merging duplicate Pauli strings
    /// and removing Pauli strings with zero coefficients.
    fn clean(&mut self);

    /// Number of Pauli strings in the generator set.
    fn size(&self) -> usize;
}

/// The available generator set implementations.
pub enum GeneratorSetImplementation {
    PauliMap,
    PauliPools,
    PauliTrees,
    ColumnWiseBitVec,
    RowWiseBitVec,
}

impl GeneratorSetImplementation {
    pub fn from_string(data_structure: &str) -> Self {
        match data_structure {
            "map" => GeneratorSetImplementation::PauliMap,
            "ppools" => GeneratorSetImplementation::PauliPools,
            "ptrees" => GeneratorSetImplementation::PauliTrees,
            "cbitvec" => GeneratorSetImplementation::ColumnWiseBitVec,
            "rbitvec" => GeneratorSetImplementation::RowWiseBitVec,
            _ => { 
                eprintln!("\"{}\" is not a valid generator set implementation. Defaulting to row-wise bitvector", data_structure);
                GeneratorSetImplementation::RowWiseBitVec
            },
        }
    }
}

pub fn get_generator_set(
    generator_set: &GeneratorSetImplementation,
    n_qubits: usize,
    n_threads: usize,
) -> Box<dyn GeneratorSet> {
    match generator_set {
        GeneratorSetImplementation::PauliMap => return Box::new(PauliMap::new(n_qubits)),
        GeneratorSetImplementation::ColumnWiseBitVec => return Box::new(ColumnWiseBitVec::new(n_qubits)),
        GeneratorSetImplementation::RowWiseBitVec => return Box::new(RowWiseBitVec::new(n_qubits, n_threads)),
        GeneratorSetImplementation::PauliPools => return Box::new(PauliPools::new(n_qubits, n_threads)),
        GeneratorSetImplementation::PauliTrees => return Box::new(PauliTrees::new(n_qubits, None, None)),
    };
}
