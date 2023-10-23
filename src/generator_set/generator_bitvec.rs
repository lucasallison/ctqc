use bitvec::{prelude::*, slice::BitSliceIndex};
use snafu::prelude::*;
use std::fmt;



use super::pauli_string::PauliGate;


pub struct GeneratorBitVec {
    pub pauli_strings: BitVec,
    // pub coefficients: Vec<f64>,
    num_qubits: usize,
}


impl GeneratorBitVec {


    pub fn new(num_qubits: usize) -> GeneratorBitVec {
        GeneratorBitVec {
            // TODO
            pauli_strings: bitvec![0; 2*num_qubits*num_qubits],
            // coefficients: Vec::new(),
            num_qubits,
        }
    }


    fn set_stabilizer_generators(&mut self, zero_state_generator: bool) {

        let p_gate = if zero_state_generator {PauliGate::Z} else {PauliGate::X};

        // Each Pauli string has num_qubit gates and each gate is represented by 2 bits. 
        self.pauli_strings = bitvec![0; 2*self.num_qubits*self.num_qubits];

        for generator_index in 0..self.num_qubits {
            self.set_pauli_gate_unchecked(p_gate, generator_index, generator_index);
        }
    }


    /// Returns the jth gate of the ith Pauli string
    /// WARNING: This function does not check if the index is out of bounds
    fn get_pauli_gate_unchecked(&self, i: usize, j: usize) -> PauliGate {
        let index = self.get_p_str_gate_index(i, j);
        PauliGate::pauli_gate_from_tuple(self.pauli_strings[index], self.pauli_strings[index + 1])
    }


    /// Sets the jth gate of the ith Pauli string
    /// WARNING: This function does not check if the index is out of bounds
    fn set_pauli_gate_unchecked(&mut self, p_gate: PauliGate, i: usize, j: usize) {
        let index = self.get_p_str_gate_index(i, j);

        let (b1, b2) = PauliGate::pauli_gate_as_tuple(p_gate);

        self.pauli_strings.set(index, b1);
        self.pauli_strings.set(index + 1, b2);

    }

    // Get the internal index of the jth gate of the ith Pauli string
    fn get_p_str_gate_index(&self, i: usize, j: usize) -> usize {
        2*i*self.num_qubits + 2*j
    }


}

impl fmt::Display for PauliArray {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let mut s = String::new();

        for i in 0..self.num_qubits {
            for j in 0..self.num_qubits {
                s.push_str(&format!("{}", self.get_pauli_gate_unchecked(i, j)));
            }
            s.push_str("\n");
        }

        write!(f, "{}", s)
    }
}

// ------------------ Errors --------------------------------------

#[derive(Debug, Snafu)]
pub enum PauliArrayError {
    #[snafu(display("Index out of bounds."))]
    IndexOutOfBounds {},
}

// ------------------ Tests ---------------------------------------

#[cfg(test)]
mod tests {

    use super::*;

    #[test]
    fn something() {
        let mut pa = PauliArray::new(3);
        pa.set_stabilizer_generators(false);
        

        println!("{}", pa);
    }
}