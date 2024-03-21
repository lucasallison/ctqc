use crate::circuit::Gate;
use std::fmt::Display;

mod shared;

pub mod measurement_sampler;
use measurement_sampler::MeasurementSampler;

// Implementations of the GeneratorSet trait
pub mod column_wise_bitvec;
pub mod generator_map;
pub mod pauli_pools;
pub mod pauli_trees;
pub mod row_wise_bitvec;

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
    fn conjugate(
        &mut self,
        gate: &Gate,
        conjugate_dagger: bool,
    ) -> Result<(), shared::errors::GenertorSetError>;

    /// Return a measurment sampler for the state represented by the generator set
    /// at the moment the function is called.
    fn get_measurement_sample(&mut self) -> MeasurementSampler;

    /// Performs any clean-up operations on the generator set, such as, merging duplicate Pauli strings
    /// and removing Pauli strings with zero coefficients.
    fn clean(&mut self);

    /// Number of Pauli strings in the generator set.
    fn size(&self) -> usize;
}
