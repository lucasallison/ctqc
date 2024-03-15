use crate::circuit::Gate;
use std::fmt::Display;

mod shared;

// Implementations of the GeneratorSet trait
pub mod column_wise_bitvec;
pub mod generator_map;
pub mod pauli_pools;
pub mod pauli_trees;
pub mod row_wise_bitvec;

pub trait GeneratorSet: Display {
    fn init_generators(&mut self, zero_state_generators: bool);

    fn init_single_generator(&mut self, i: usize, zero_state_generator: bool);

    fn is_x_or_z_generators(&mut self, check_zero_state: bool) -> bool;

    fn is_single_x_or_z_generator(&mut self, check_zero_state: bool, i: usize) -> bool;

    fn conjugate(&mut self, gate: &Gate, conjugate_dagger: bool);

    /// Return the measurment result and the probability of measuring zero
    fn measure(&mut self, i: usize) -> (bool, f64);

    fn clean(&mut self);

    fn size(&self) -> usize;
}
