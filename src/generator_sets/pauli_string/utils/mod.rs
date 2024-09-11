use core::panic;

use super::PauliGate;
use crate::generator_sets::utils::imaginary_coefficient::ImaginaryCoef;
use bitvec::prelude::*;

// --------------- BitVec/BitSlice utils  --------------- //
// TODO Should we check whether the bitslices are valid Pauli strings, i.e. of even length?

pub fn get_pauli_gate_from_bitslice(pstr: &BitSlice, j: usize) -> PauliGate {
    pauli_gate_from_tuple(pstr[2 * j], pstr[2 * j + 1])
}

pub fn set_pauli_gate_in_bitslice(pstr: &mut BitSlice, pgate: PauliGate, j: usize) {
    let (b1, b2) = pauli_gate_as_tuple(pgate);
    pstr.set(2 * j, b1);
    pstr.set(2 * j + 1, b2);
}

/// Returns wheter the Pauli string contains only identity gates
/// and a single Z gate at the ith position, i.e., I^⊗{i-1}ZI^⊗{n-i}
/// The functionility is the same as `bitslice_is_ith_generator` but
/// this function provides clarity in some contexts.
pub fn is_single_z_pstr(pstr: &BitSlice, i: usize) -> bool {
    bitslice_is_ith_generator(pstr, i, true)
}

/// Returns true if the bitslice is the ith generator of the all zero/plus state,
/// i.e., I^⊗{i-1}ZI^⊗{n-i} or I^⊗{i-1}ZI^⊗{n-i}.
pub fn bitslice_is_ith_generator(pstr: &BitSlice, i: usize, zero_state_generator: bool) -> bool {
    let n_gates = pstr.len() / 2;
    let non_identity_gate = generator_non_identity_gate(zero_state_generator);

    for gate_ind in 0..n_gates {
        let p_gate = get_pauli_gate_from_bitslice(pstr, gate_ind);

        if (gate_ind == i && p_gate != non_identity_gate)
            || (gate_ind != i && p_gate != PauliGate::I)
        {
            return false;
        }
    }

    true
}

// --------------- PauliGate utils  --------------- //

pub fn pauli_gate_as_tuple(gate: PauliGate) -> (bool, bool) {
    match gate {
        PauliGate::I => (false, false),
        PauliGate::X => (true, false),
        PauliGate::Y => (true, true),
        PauliGate::Z => (false, true),
    }
}

pub fn pauli_gate_from_tuple(b1: bool, b2: bool) -> PauliGate {
    match (b1, b2) {
        (false, false) => PauliGate::I,
        (true, false) => PauliGate::X,
        (true, true) => PauliGate::Y,
        (false, true) => PauliGate::Z,
    }
}

pub fn char_to_pauli_gate(c: &char) -> PauliGate {
    match *c {
        'I' => PauliGate::I,
        'X' => PauliGate::X,
        'Y' => PauliGate::Y,
        'Z' => PauliGate::Z,
        _ => panic!("Character is not a valid Pauli gate"),
    }
}

pub fn multiply_pauli_gates(g1: PauliGate, g2: PauliGate) -> (ImaginaryCoef, PauliGate) {
    // The products are given by the caley table:
    //   |  X     Y     Z
    // ---------------------
    // X |   I |  iZ | -iY
    // Y | -iZ |   I |  iX
    // Z |  iY | -iX |   I

    match (g1, g2) {
        (PauliGate::I, _) => (ImaginaryCoef::new(1.0, false), g2),
        (_, PauliGate::I) => (ImaginaryCoef::new(1.0, false), g1),
        (PauliGate::X, PauliGate::X) => (ImaginaryCoef::new(1.0, false), PauliGate::I),
        (PauliGate::X, PauliGate::Y) => (ImaginaryCoef::new(1.0, true), PauliGate::Z),
        (PauliGate::X, PauliGate::Z) => (ImaginaryCoef::new(-1.0, true), PauliGate::Y),
        (PauliGate::Y, PauliGate::X) => (ImaginaryCoef::new(-1.0, true), PauliGate::Z),
        (PauliGate::Y, PauliGate::Y) => (ImaginaryCoef::new(1.0, false), PauliGate::I),
        (PauliGate::Y, PauliGate::Z) => (ImaginaryCoef::new(1.0, true), PauliGate::X),
        (PauliGate::Z, PauliGate::X) => (ImaginaryCoef::new(1.0, true), PauliGate::Y),
        (PauliGate::Z, PauliGate::Y) => (ImaginaryCoef::new(-1.0, true), PauliGate::X),
        (PauliGate::Z, PauliGate::Z) => (ImaginaryCoef::new(1.0, false), PauliGate::I),
    }
}

// --------------- Other utils  --------------- //

/// Returns which gate should be used as the only non-identity
/// gate when construction/checking for generators.
pub fn generator_non_identity_gate(zero_state_generator: bool) -> PauliGate {
    if zero_state_generator {
        PauliGate::Z
    } else {
        PauliGate::X
    }
}
