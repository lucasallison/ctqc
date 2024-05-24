use super::pauli_string::PauliGate;

use crate::circuit::Gate;

pub mod conjugation_look_up_tables;
pub mod imaginary_coefficient;
use crate::generator_sets::shared::floating_point_opc::FloatingPointOPC;

/// Miscellaneous shared functions

/// Returns two floats with which the coefficients of the Pauli strings should be multiplied
/// when a Rz gate is conjugated to the target qubit X/Y. The first float is the multiplier
/// for the resulting Pauli string with an X gate at the target qubit, and the second float
/// for the resulting Pauli string with a Y gate at the target qubit.
pub fn rz_conj_coef_multipliers(
    rz: &Gate,
    target_pgate: &PauliGate,
    conjugate_dagger: bool,
) -> (FloatingPointOPC, FloatingPointOPC) {

    let mut x_mult = FloatingPointOPC::new(rz.angle.unwrap());
    let mut y_mult = FloatingPointOPC::new(rz.angle.unwrap());

    // Multiply coeffients with +/- and cos/sin
    match (target_pgate, conjugate_dagger) {
        (PauliGate::X, false) => {
            // x_mult -> cos(angle), y_mult -> sin(angle)
            x_mult.cos();
            y_mult.sin();
            return (x_mult, y_mult)
        },
        (PauliGate::Y, false) => {
            // x_mult -> -1.0 * sin(angle), y_mult -> cos(angle)
            x_mult.sin();
            x_mult.mul(&FloatingPointOPC::new(-1.0));
            y_mult.cos();
            return (x_mult, y_mult)
        },
        (PauliGate::X, true) => {
            // x_mult -> cos(angle), y_mult -> -1.0 * sin(angle)
            x_mult.cos();
            y_mult.sin();
            y_mult.mul(&FloatingPointOPC::new(-1.0));
            return (x_mult, y_mult)
        },
        (PauliGate::Y, true) => {
            // x_mult -> sin(angle), y_mult -> cos(angle)
            x_mult.sin();
            y_mult.cos();
            return (x_mult, y_mult)
        },
        _ => {
            panic!(
                "`rz_conj_coef_multipliers` can only be used to determine the \
                coeficient multipliers when the target Pauli gate is an X or Y"
            )
        }
    }
}
