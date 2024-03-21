use crate::circuit::Gate;
use crate::pauli_string::PauliGate;

/// Code shared among the generator set implementations


/// Modules defining shared functionality
pub mod coefficient_list;
pub mod conjugation_look_up_tables;
pub mod errors;
pub mod h_s_conjugations_map;


/// Miscellaneous shared constant(s) and functions

// TODO
// Floating point error margin
pub static FP_ERROR_MARGIN: f64 = 0.0000000001;

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
        (PauliGate::Y, false) => {
            return (-1.0 * rz.angle.unwrap().sin(), rz.angle.unwrap().cos())
        }
        (PauliGate::X, true) => {
            return (rz.angle.unwrap().cos(), -1.0 * rz.angle.unwrap().sin())
        }
        (PauliGate::Y, true) => return (rz.angle.unwrap().sin(), rz.angle.unwrap().cos()),
        _ => {
            panic!(
                "`rz_conj_coef_multipliers` can only be used to determine the \
                coeficient multipliers when the target Pauli gate is an X or Y"
            )
        }
    }
}