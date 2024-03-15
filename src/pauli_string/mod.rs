use bitvec::prelude::*;
use std::fmt;

pub mod utils;
use utils as PauliUtils;

#[derive(PartialEq, Eq, Hash, Clone, Copy)]
pub enum PauliGate {
    I,
    X,
    Y,
    Z,
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
    /// Returns a Pauli string of size `size` with all gates set to `I`
    pub fn new(size: usize) -> PauliString {
        PauliString {
            // Each gate is represented by 2 bits
            pstr: bitvec![0; 2*size],
        }
    }

    pub fn set_pauli_gate(&mut self, index: usize, gate: PauliGate) {
        let (b1, b2) = PauliUtils::pauli_gate_as_tuple(gate);
        self.pstr.set(2 * index, b1);
        self.pstr.set(2 * index + 1, b2);
    }

    pub fn get_pauli_gate(&self, index: usize) -> PauliGate {
        PauliUtils::pauli_gate_from_tuple(self.pstr[index], self.pstr[index + 1])
    }

    pub fn len(&self) -> usize {
        self.pstr.len() / 2
    }

    pub fn iter(&self) -> PauliStringIterator {
        PauliStringIterator {
            pstr: self,
            index: 0,
        }
    }
}

impl PartialEq for PauliString {
    fn eq(&self, other: &Self) -> bool {
        self.pstr == other.pstr
    }
}

impl fmt::Display for PauliString {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let mut pstr = String::new();
        for gate in self.iter() {
            pstr.push_str(&format!("{}", gate));
        }
        write!(f, "{}", pstr)
    }
}

// ------------------ Iterator ------------------------------------

pub struct PauliStringIterator<'a> {
    pstr: &'a PauliString,
    index: usize,
}

impl<'a> Iterator for PauliStringIterator<'a> {
    type Item = PauliGate;

    fn next(&mut self) -> Option<Self::Item> {
        if self.index < self.pstr.len() {
            self.index += 2;
            Some(self.pstr.get_pauli_gate(self.index))
        } else {
            None
        }
    }
}
