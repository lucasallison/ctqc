use std::collections::{hash_map::Entry, HashMap};

use bitvec::prelude::*;
use fxhash::FxBuildHasher;

use super::pauli_string::{utils as PauliUtils, PauliGate, PauliString};
use super::shared::coefficient_list::CoefficientList;

use crate::circuit::Gate;

pub mod conjugation_look_up_tables;
pub mod imaginary_coefficient;

/// Miscellaneous shared functions

/// Returns two floats with which the coefficients of the Pauli strings should be multiplied
/// when a Rz gate is conjugated to the target qubit X/Y. The first float is the multiplier
/// for the resulting Pauli string with an X gate at the target qubit, and the second float
/// for the resulting Pauli string with a Y gate at the target qubit.
pub fn rz_conj_coef_multipliers(
    rz: &Gate,
    target_pgate: &PauliGate,
    conjugate_dagger: bool,
) -> (f64, f64) {
    // Multiply coeffients with +/- and cos/sin
    match (target_pgate, conjugate_dagger) {
        (PauliGate::X, false) => return (rz.angle.unwrap().cos(), rz.angle.unwrap().sin()),
        (PauliGate::Y, false) => return (-1.0 * rz.angle.unwrap().sin(), rz.angle.unwrap().cos()),
        (PauliGate::X, true) => return (rz.angle.unwrap().cos(), -1.0 * rz.angle.unwrap().sin()),
        (PauliGate::Y, true) => return (rz.angle.unwrap().sin(), rz.angle.unwrap().cos()),
        _ => {
            panic!(
                "`rz_conj_coef_multipliers` can only be used to determine the \
                coeficient multipliers when the target Pauli gate is an X or Y"
            )
        }
    }
}
