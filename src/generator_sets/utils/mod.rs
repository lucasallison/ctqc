use std::collections::{hash_map::Entry, HashMap};

use bitvec::prelude::*;
use fxhash::FxBuildHasher;

use super::shared::coefficient_list::CoefficientList;
use super::pauli_string::{PauliString, PauliGate, utils as PauliUtils};

use crate::circuit::Gate;

pub mod imaginary_coefficient;
pub mod conjugation_look_up_tables;

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

/// Inserts the Pauli string into the map or merges the coefficient list with
/// the existing one if the Pauli string already exists.
pub fn insert_pstr_bitvec_into_map(
    map: &mut HashMap<BitVec, CoefficientList, FxBuildHasher>,
    pstr: BitVec,
    coef_list: CoefficientList,
) {
    match map.entry(pstr) {
        Entry::Occupied(mut e) => {
            e.get_mut().merge(&coef_list);
        }
        Entry::Vacant(e) => {
            e.insert(coef_list);
        }
    }
}

/// Returns true if the Pauli string with the given index contains an X or Z gate
pub fn contains_ith_x_or_z_generator(
    map: &HashMap<BitVec, CoefficientList, FxBuildHasher>,
    i: usize,
    zero_state_generator: bool,
    n_qubits: usize,
) -> bool {
    let p_gate = PauliUtils::generator_non_identity_gate(zero_state_generator);
    let mut pstr = PauliString::new(n_qubits);
    pstr.set_pauli_gate(i, p_gate);

    match map.get(pstr.as_bitslice()) {
        Some(coef_list) => return coef_list.is_valid_ith_generator_coef_list(i),
        None => return false,
    }
}