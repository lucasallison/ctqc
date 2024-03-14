use bitvec::prelude::*;

use super::pauli_string::{PauliGate, PauliString};

// TODO rename to ImaginaryCoef/ImCoef
pub struct ComplexCoef {
    pub real: f64,
    pub i: bool,
}

impl ComplexCoef {
    pub fn new(real: f64, i: bool) -> ComplexCoef {
        ComplexCoef { real, i }
    }

    pub fn multiply(&mut self, other: &ComplexCoef) {
        self.real = self.real * other.real;
        if self.i && other.i {
            self.real *= -1.0;
        }
        self.i ^= other.i;
    }

    pub fn mutliply_with_f64(&mut self, other: f64) {
        self.real *= other;
    }

    pub fn divide(&mut self, other: &ComplexCoef) {
        let mut divisor = other.real;
        if other.i {
            divisor *= -1.0 * other.real;
        }
        self.multiply(other);
        self.real /= divisor;
    }

    pub fn divide_by_f64(&mut self, other: f64) {
        self.real /= other;
    }
}

// TODO put in seperate file??
pub struct PauliUtils {}

impl PauliUtils {
    pub fn get_pauli_gate_from_bitslice(p_str: &BitSlice, j: usize) -> PauliGate {
        PauliGate::pauli_gate_from_tuple(p_str[2 * j], p_str[2 * j + 1])
    }

    pub fn set_pauli_gate_in_bitslice(p_str: &mut BitSlice, p_gate: PauliGate, j: usize) {
        let (b1, b2) = PauliGate::pauli_gate_as_tuple(p_gate);
        p_str.set(2 * j, b1);
        p_str.set(2 * j + 1, b2);
    }

    pub fn pstr_bitslice_as_str(bitslice: &BitSlice) -> String {
        assert!(bitslice.len() % 2 == 0, "Bitslice length must be even");

        let n_gates = bitslice.len() / 2;

        let mut result = String::new();
        for gate_ind in 0..n_gates {
            let p_gate = Self::get_pauli_gate_from_bitslice(bitslice, gate_ind);
            result.push_str(format!("{}", p_gate).as_str());
        }
        result
    }
}
