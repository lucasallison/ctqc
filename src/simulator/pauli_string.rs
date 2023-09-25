use std::fmt;
use std::error::Error;
use bitvec::prelude::*;

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

#[derive(Eq, Hash, Clone)]
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

    pub fn set_pauli_gate(&mut self, index: usize, gate: PauliGate) -> Result<(), PauliStringError> {

        let i = self.get_internal_index(index);

        if i + 1 >= self.pstr.len() {
            return Err(PauliStringError 
                { message: "Index out of bounds while setting Pauli gate".to_string() })
        }


        let (b1, b2) = PauliString::pauli_gate_as_tuple(gate);
        self.pstr.set(i, b1);
        self.pstr.set(i+1, b2);

        Ok(())
    }

    pub fn get_pauli_gate(&self, index: usize) -> Result<PauliGate, PauliStringError> {
        let i = self.get_internal_index(index);

        if i + 1 >= self.pstr.len() {
            return Err(PauliStringError 
                { message: "Index out of bounds while getting Pauli gate".to_string() })
        }

        Ok(PauliString::pauli_gate_from_tuple(self.pstr[i], self.pstr[i+1]))
    }

    pub fn copy(&self) -> PauliString {
        PauliString {
            pstr: self.pstr.clone(),
        }
    }

    fn pauli_gate_as_tuple(gate: PauliGate) -> (bool, bool) {
        match gate {
            PauliGate::I => (false, false),
            PauliGate::X => (true, false),
            PauliGate::Y => (true, true),
            PauliGate::Z => (false, true),
        }
    }

    fn pauli_gate_from_tuple(b1: bool, b2: bool) -> PauliGate {
        match (b1, b2) {
            (false, false) => PauliGate::I,
            (true, false) => PauliGate::X,
            (true, true) => PauliGate::Y,
            (false, true) => PauliGate::Z,
        }
    }

    // Returns the internal index of the first bit of the pauli gate 
    // saved in the pauli string
    fn get_internal_index(&self, index: usize) -> usize {
        2*index
    }

    pub fn iter(&self) -> PauliStringIterator {
        PauliStringIterator {
            ps: self,
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
            let gate = PauliString::pauli_gate_from_tuple(self.ps.pstr[self.index], self.ps.pstr[self.index+1]);
            self.index += 2;
            Some(gate)
        } else {
            None
        }
    }
}

// ------------------ Errors --------------------------------------

#[derive(Debug)]
pub struct PauliStringError {
    pub message: String,
}

impl fmt::Display for PauliStringError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "Pauli string error: {}", self.message)
    }
}

impl Error for PauliStringError {}

// ------------------ Tests ---------------------------------------

#[cfg(test)]
mod tests {

    use super::*;

    #[test]
    fn set_and_get() {

       let set_gates = [(PauliGate::Z, 4), (PauliGate::X, 2), (PauliGate::Y, 0)];
       let target = [PauliGate::Y, PauliGate::I, PauliGate::X, PauliGate::I, PauliGate::Z];

        let mut pstr = PauliString::new(5);
        for (gate, index) in set_gates.iter() {
            pstr.set_pauli_gate(*index as usize, *gate).unwrap();
        }

        for (pos, gate) in pstr.iter().enumerate() {
            assert!(gate == target[pos], "Expected: {}, got: {} at index {}", target[pos], gate, pos);
        }

    }

}
