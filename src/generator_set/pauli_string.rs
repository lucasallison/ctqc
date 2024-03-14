use bitvec::prelude::*;
use snafu::prelude::*;
use std::fmt;

use super::utils::ComplexCoef;

#[derive(PartialEq, Eq, Hash, Clone, Copy)]
pub enum PauliGate {
    I,
    X,
    Y,
    Z,
}

impl PauliGate {
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

    pub fn char_to_pauli_gate(c: &char) -> Result<PauliGate, PauliStringError> {
        match *c {
            'I' => Ok(PauliGate::I),
            'X' => Ok(PauliGate::X),
            'Y' => Ok(PauliGate::Y),
            'Z' => Ok(PauliGate::Z),
            _ => Err(PauliStringError::CharNotAPauliGate {}),
        }
    }

    pub fn multiply(g1: PauliGate, g2: PauliGate) -> (ComplexCoef, PauliGate) {
        //   |  X     Y     Z
        // ---------------------
        // X |   I |  iZ | -iY
        // Y | -iZ |   I |  iX
        // Z |  iY | -iX |   I

        match (g1, g2) {
            (PauliGate::I, _) => (ComplexCoef::new(1.0, false), g2),
            (_, PauliGate::I) => (ComplexCoef::new(1.0, false), g1),
            (PauliGate::X, PauliGate::X) => (ComplexCoef::new(1.0, false), PauliGate::I),
            (PauliGate::X, PauliGate::Y) => (ComplexCoef::new(1.0, true), PauliGate::Z),
            (PauliGate::X, PauliGate::Z) => (ComplexCoef::new(-1.0, true), PauliGate::Y),
            (PauliGate::Y, PauliGate::X) => (ComplexCoef::new(-1.0, true), PauliGate::Z),
            (PauliGate::Y, PauliGate::Y) => (ComplexCoef::new(1.0, false), PauliGate::I),
            (PauliGate::Y, PauliGate::Z) => (ComplexCoef::new(1.0, true), PauliGate::X),
            (PauliGate::Z, PauliGate::X) => (ComplexCoef::new(1.0, true), PauliGate::Y),
            (PauliGate::Z, PauliGate::Y) => (ComplexCoef::new(-1.0, true), PauliGate::X),
            (PauliGate::Z, PauliGate::Z) => (ComplexCoef::new(1.0, false), PauliGate::I),
        }
    }
}

impl fmt::Display for PauliGate {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            PauliGate::I => write!(f, "I"),
            PauliGate::X => write!(f, "X"),
            PauliGate::Y => write!(f, "Y"),
            PauliGate::Z => write!(f, "Z"),
        }
    }
}

#[derive(Debug, Eq, Hash, Clone)]
pub struct PauliString {
    pstr: BitVec,
}

impl PauliString {
    // Creates a new pauli string of size `size` of only identity gates
    pub fn new(size: usize) -> PauliString {
        PauliString {
            // Each gate is represented by 2 bits
            pstr: bitvec![0; 2*size],
        }
    }

    pub fn set_pauli_gate(
        &mut self,
        index: usize,
        gate: PauliGate,
    ) -> Result<(), PauliStringError> {
        let i = self.get_internal_index(index);

        if i + 1 >= self.pstr.len() {
            return Err(PauliStringError::IndexOutOfBounds {});
        }

        let (b1, b2) = PauliGate::pauli_gate_as_tuple(gate);
        self.pstr.set(i, b1);
        self.pstr.set(i + 1, b2);

        Ok(())
    }

    pub fn get_pauli_gate(&self, index: usize) -> Result<PauliGate, PauliStringError> {
        let i = self.get_internal_index(index);

        if i + 1 >= self.pstr.len() {
            return Err(PauliStringError::IndexOutOfBounds {});
        }

        Ok(PauliGate::pauli_gate_from_tuple(
            self.pstr[i],
            self.pstr[i + 1],
        ))
    }

    // Returns the internal index of the first bit of the pauli gate
    // saved in the pauli string
    fn get_internal_index(&self, index: usize) -> usize {
        2 * index
    }

    pub fn iter(&self) -> PauliStringIterator {
        PauliStringIterator { ps: self, index: 0 }
    }
}

impl PartialEq for PauliString {
    fn eq(&self, other: &Self) -> bool {
        self.pstr == other.pstr
    }
}

impl fmt::Display for PauliString {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let mut result = String::new();
        for gate in self.iter() {
            result.push_str(&format!("{}", gate));
        }
        write!(f, "{}", result)
    }
}

// ------------------ Iterator ------------------------------------

pub struct PauliStringIterator<'a> {
    ps: &'a PauliString,
    index: usize,
}

impl<'a> Iterator for PauliStringIterator<'a> {
    type Item = PauliGate;

    fn next(&mut self) -> Option<Self::Item> {
        if self.index + 1 < self.ps.pstr.len() {
            let gate = PauliGate::pauli_gate_from_tuple(
                self.ps.pstr[self.index],
                self.ps.pstr[self.index + 1],
            );
            self.index += 2;
            Some(gate)
        } else {
            None
        }
    }
}

// ------------------ Errors --------------------------------------

#[derive(Debug, Snafu)]
pub enum PauliStringError {
    #[snafu(display("Index out of bounds."))]
    IndexOutOfBounds {},

    #[snafu(display("Character is not a pauli gate."))]
    CharNotAPauliGate {},
}

// ------------------ Tests ---------------------------------------

#[cfg(test)]
mod tests {

    use super::*;

    #[test]
    fn set_and_get() {
        let set_gates = [(PauliGate::Z, 4), (PauliGate::X, 2), (PauliGate::Y, 0)];
        let target = [
            PauliGate::Y,
            PauliGate::I,
            PauliGate::X,
            PauliGate::I,
            PauliGate::Z,
        ];

        let mut pstr = PauliString::new(5);
        for (gate, index) in set_gates.iter() {
            pstr.set_pauli_gate(*index as usize, *gate).unwrap();
        }

        for (pos, gate) in pstr.iter().enumerate() {
            assert!(
                gate == target[pos],
                "Expected: {}, got: {} at index {}",
                target[pos],
                gate,
                pos
            );
        }
    }
}
