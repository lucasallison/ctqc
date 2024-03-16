use super::PauliGate;
use crate::utils::imaginary_coefficient::ImaginaryCoef;
use bitvec::prelude::*;
use snafu::prelude::*;

// --------------- Bitvec utils  --------------- //
pub fn get_pauli_gate_from_bitslice(p_str: &BitSlice, j: usize) -> PauliGate {
    pauli_gate_from_tuple(p_str[2 * j], p_str[2 * j + 1])
}

pub fn set_pauli_gate_in_bitslice(p_str: &mut BitSlice, p_gate: PauliGate, j: usize) {
    let (b1, b2) = pauli_gate_as_tuple(p_gate);
    p_str.set(2 * j, b1);
    p_str.set(2 * j + 1, b2);
}

// TODO remove?
pub fn pstr_bitslice_as_str(bitslice: &BitSlice) -> String {
    // TODO error?
    assert!(bitslice.len() % 2 == 0, "Bitslice length must be even");

    let n_gates = bitslice.len() / 2;

    let mut result = String::new();
    for gate_ind in 0..n_gates {
        let p_gate = get_pauli_gate_from_bitslice(bitslice, gate_ind);
        result.push_str(format!("{}", p_gate).as_str());
    }
    result
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

pub fn char_to_pauli_gate(c: &char) -> Result<PauliGate, PauliUtilError> {
    match *c {
        'I' => Ok(PauliGate::I),
        'X' => Ok(PauliGate::X),
        'Y' => Ok(PauliGate::Y),
        'Z' => Ok(PauliGate::Z),
        _ => Err(PauliUtilError::CharNotPauliGate {}),
    }
}

pub fn multiply_pauli_gates(g1: PauliGate, g2: PauliGate) -> (ImaginaryCoef, PauliGate) {
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

#[derive(Debug, Snafu)]
pub enum PauliUtilError {
    #[snafu(display("Character is not a valid Pauli gate"))]
    CharNotPauliGate {},
    // TODO
    // #[snafu(display("Bitslice must be of equal length"))]
    // UnevenBitslice {},
}
