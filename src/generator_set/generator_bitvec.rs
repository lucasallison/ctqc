use bitvec::prelude::*;
use snafu::prelude::*;
use std::error::Error;
use std::fmt;

use super::conjugation_look_up_tables::{H_CONJ_UPD_RULES, S_CONJ_UPD_RULES, S_DAGGER_CONJ_UPD_RULES, CNOT_CONJ_UPD_RULES};
use super::pauli_string::PauliGate;
use super::GeneratorSet;
use crate::circuit::{Gate, GateType};


pub struct GeneratorBitVec {
    pub pauli_strings: BitVec,
    pub generator_info: Vec<(usize, f64)>,
    num_qubits: usize,
    size: usize,
}


impl GeneratorBitVec {


    pub fn new(num_qubits: usize) -> GeneratorBitVec {
        GeneratorBitVec {
            // We have num_qubits Pauli strings, each with num_qubits gates. Each gate is represented by 2 bits.
            pauli_strings: bitvec![0; 2*num_qubits*num_qubits],
            generator_info: Vec::with_capacity(num_qubits),
            num_qubits,
            size: 0,
        }
    }

    /// Returns the jth gate of the ith Pauli string
    /// WARNING: This function does not check if the index is out of bounds
    fn get_pauli_gate(&self, i: usize, j: usize) -> PauliGate {
        let index = self.get_p_str_gate_index(i, j).unwrap();
        PauliGate::pauli_gate_from_tuple(self.pauli_strings[index], self.pauli_strings[index + 1])
    }


    /// Sets the jth gate of the ith Pauli string
    fn set_pauli_gate(&mut self, p_gate: PauliGate, i: usize, j: usize) {
        let index = self.get_p_str_gate_index(i, j).unwrap();

        let (b1, b2) = PauliGate::pauli_gate_as_tuple(p_gate);

        self.pauli_strings.set(index, b1);
        self.pauli_strings.set(index + 1, b2);

    }

    /// Get the internal index of the jth gate of the ith Pauli string
    fn get_p_str_gate_index(&self, i: usize, j: usize) -> Result<usize, GeneratorBitVecError> {
        let index = 2*i*self.num_qubits + 2*j;
        if index >= self.pauli_strings.len() {
            return Err(GeneratorBitVecError::IndexOutOfBounds {});
        }
        Ok(index)
    }

    /// Equivalent to get_p_str_gate_index but does not check if the index is out of bounds
    fn get_p_str_gate_index_unchecked(&self, i: usize, j: usize) -> usize {
        2*i*self.num_qubits + 2*j
    }

    fn reset(&mut self) {
        // TODO just set only zero bits?
        self.pauli_strings = bitvec![0; 2*self.num_qubits*self.num_qubits]; 
        self.size = 0;

    }

    fn conjugate_h_s(&mut self, gate: &Gate, conjugate_dagger: bool) -> Result<(), GeneratorBitVecError> {

        for pstr_index in 0..self.size {

            let target_pauli_gate = self.get_pauli_gate(pstr_index, gate.qubit_1);

            if target_pauli_gate == PauliGate::I {
                continue;
            }
            
            // Look up how the Pauli string changes as a result of the conjugation
            let look_up_output = match gate.gate_type {
                GateType::H => H_CONJ_UPD_RULES.get(&target_pauli_gate).unwrap(),
                GateType::S => {
                    if conjugate_dagger {
                        S_DAGGER_CONJ_UPD_RULES.get(&target_pauli_gate).unwrap()
                    } else {
                        S_CONJ_UPD_RULES.get(&target_pauli_gate).unwrap()
                    }
                }
                _ => return Err(GeneratorBitVecError::InvalidConjugationFunction {
                    function_called: "conjugate_h_s".to_string(),
                    gate_type: gate.gate_type.clone(),
                }),
            };


            // Update the coefficient and gate
            self.generator_info[pstr_index].1 *= look_up_output.coefficient;
            self.set_pauli_gate(look_up_output.p_gate, pstr_index, gate.qubit_1);
        }

        Ok(())
    }

    fn conjugate_cnot(&mut self, gate: &Gate) -> Result<(), GeneratorBitVecError> {

        let qubit_2 = gate.qubit_2.unwrap();

        for pstr_index in 0..self.size {

            let q1_target_pauli_gate = self.get_pauli_gate(pstr_index, gate.qubit_1);
            let q2_target_pauli_gate = self.get_pauli_gate(pstr_index, qubit_2);

            let look_up_output = CNOT_CONJ_UPD_RULES
                .get(&(q1_target_pauli_gate, q2_target_pauli_gate))
                .unwrap();

            // TODO check if the index changes?
            self.generator_info[pstr_index].1 *= look_up_output.coefficient;

            self.set_pauli_gate(look_up_output.q1_p_gate, pstr_index, gate.qubit_1);
            self.set_pauli_gate(look_up_output.q2_p_gate, pstr_index, qubit_2);
        }

        Ok(())
    }

}


impl GeneratorSet for GeneratorBitVec {

    fn init_generators(&mut self, zero_state_generators: bool) {
        self.reset();

        let p_gate = if zero_state_generators {PauliGate::Z} else {PauliGate::X};

        // Each Pauli string has num_qubit gates and each gate is represented by 2 bits. 
        self.pauli_strings = bitvec![0; 2*self.num_qubits*self.num_qubits];

        for generator_index in 0..self.num_qubits {
            self.set_pauli_gate(p_gate, generator_index, generator_index);
            self.generator_info.push((generator_index, 1.0));
        }

        self.size = self.num_qubits;
    }

    // TODO
    fn is_x_or_z_generators(&mut self, check_zero_state: bool) -> bool {
        false
    }

    // TODO
    fn conjugate(
            &mut self,
            gate: &Gate,
            conjugate_dagger: bool,
        ) -> Result<(), Box<dyn Error>> {

        match gate.gate_type {
            GateType::H | GateType::S => self.conjugate_h_s(gate, conjugate_dagger)?,
            GateType::CNOT => self.conjugate_cnot(gate)?,
            _ => return Err(GeneratorBitVecError::InvalidConjugationFunction {
                function_called: "conjugate".to_string(),
                gate_type: gate.gate_type.clone(),
            }.into()),
        }

        Ok(())
    }

    fn size(&self) -> usize {
        self.size
    }


}

impl fmt::Display for GeneratorBitVec {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let mut s = String::new();

        for i in 0..self.size {
            for j in 0..self.num_qubits {
                s.push_str(&format!("{}", self.get_pauli_gate(i, j)));
            }
            s.push_str(&format!(" ({}: {})", self.generator_info[i].0, self.generator_info[i].1));
            s.push_str("\n");
        }

        write!(f, "{}", s)
    }
}

// ------------------ Errors --------------------------------------

#[derive(Debug, Snafu)]
pub enum GeneratorBitVecError {
    #[snafu(display("Index out of bounds."))]
    IndexOutOfBounds {},

    #[snafu(display("Cannot conjugate {} gate with the function `{}`", gate_type, function_called))]
    InvalidConjugationFunction {function_called: String, gate_type: GateType},
}

// ------------------ Tests ---------------------------------------

#[cfg(test)]
mod tests {

    use crate::generator_set::generator_bitvec;

    use super::*;

    // TODO

}