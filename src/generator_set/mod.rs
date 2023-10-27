use crate::circuit::Gate;
use lazy_static::lazy_static;
use std::error::Error;
use std::fmt::Display;

mod h_s_conjugations_map;
mod coefficient_list;
mod conjugation_look_up_tables;
mod pauli_string;

// Implementations of the GeneratorSet trait
pub mod generator_map;
pub mod row_wise_bitvec;
pub mod column_wise_bitvec;

// Used for conjugation
lazy_static! {
    static ref ONE_OVER_SQRT_TWO: f64 = 1.0 / f64::sqrt(2.0);
}

pub trait GeneratorSet: Display {
    fn init_generators(&mut self, zero_state_generators: bool);
    // fn init_single_generator(&mut self, i: usize, zero_state_generators: bool);
    fn is_x_or_z_generators(&mut self, check_zero_state: bool) -> bool;
    // fn is_single_x_or_z_generator(&mut self, check_zero_state: bool, i: usize) -> bool;
    fn conjugate(&mut self, gate: &Gate, conjugate_dagger: bool) -> Result<(), Box<dyn Error>>;
    // fn measure() -> bool;
    fn clean(&mut self);
    fn size(&self) -> usize;
}
