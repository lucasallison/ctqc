use bitvec::prelude::*;
use snafu::prelude::*;
use std::error::Error;
use std::fmt;

use super::conjugation_look_up_tables::{H_CONJ_UPD_RULES, S_CONJ_UPD_RULES, S_DAGGER_CONJ_UPD_RULES, CNOT_CONJ_UPD_RULES};
use super::pauli_string::PauliGate;
use super::GeneratorSet;
use crate::circuit::{Gate, GateType};
use super::ONE_OVER_SQRT_TWO;

struct HSConjugations {
    map: Vec<[(PauliGate, f64); 3]>,
}

impl HSConjugations {
    fn new(num_qubits: usize) -> HSConjugations {
        let mut m = HSConjugations {
            map: Vec::with_capacity(num_qubits),
        };

        // TODO
        for _ in 0..num_qubits {
            m.map.push([(PauliGate::X, 1.0), (PauliGate::Y, 1.0), (PauliGate::Z, 1.0)]);
        }

        m
    }

    fn reset(&mut self, i: usize) {
        self.map[i] = [(PauliGate::X, 1.0), (PauliGate::Y, 1.0), (PauliGate::Z, 1.0)];
    }

    // TODO: what about S^{\dag}?
    fn update(&mut self, gate: &Gate, conjugate_dagger: bool) {

        for e in self.map[gate.qubit_1].iter_mut() {
            let target_pauli_gate = e.0;

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
                // TODO
                _ => panic!(".."),
            };

            e.0 = look_up_output.p_gate;
            e.1 *= look_up_output.coefficient;
        }

    }

    fn get_actual_p_gate(&self, i: usize, p_gate: PauliGate) -> PauliGate {
        match p_gate {
            PauliGate::X => { return self.map[i][0].0 },
            PauliGate::Y => { return self.map[i][1].0 },
            PauliGate::Z => { return self.map[i][2].0 },
            PauliGate::I => { return PauliGate::I },
        }
    }

    fn get_actual_coefficient_multiplier(&self, i: usize, p_gate: PauliGate) -> f64 {
        match p_gate {
            PauliGate::X => { return self.map[i][0].1 },
            PauliGate::Y => { return self.map[i][1].1 },
            PauliGate::Z => { return self.map[i][2].1 },
            PauliGate::I => { 1.0 }
        }
    }

    
}

pub struct GeneratorBitVec {
    pauli_strings: BitVec,
    generator_info: Vec<(usize, f64)>,
    h_s_conjugations: HSConjugations,
    num_qubits: usize,
    size: usize,
}

impl GeneratorBitVec {


    pub fn new(num_qubits: usize) -> GeneratorBitVec {
        GeneratorBitVec {
            // We have num_qubits Pauli strings, each with num_qubits gates. Each gate is represented by 2 bits.
            pauli_strings: bitvec![0; 2*num_qubits*num_qubits],
            generator_info: Vec::with_capacity(num_qubits),
            h_s_conjugations: HSConjugations::new(num_qubits),
            num_qubits,
            size: 0,
        }
    }

    /// Returns the jth gate of the ith Pauli string
    fn get_pauli_gate(&self, i: usize, j: usize) -> PauliGate {
        let index = self.pstr_gate_index(i, j);
        PauliGate::pauli_gate_from_tuple(self.pauli_strings[index], self.pauli_strings[index + 1])
    }


    /// Sets the jth gate of the ith Pauli string
    fn set_pauli_gate(&mut self, p_gate: PauliGate, i: usize, j: usize) {
        let index = self.pstr_gate_index(i, j);

        let (b1, b2) = PauliGate::pauli_gate_as_tuple(p_gate);

        self.pauli_strings.set(index, b1);
        self.pauli_strings.set(index + 1, b2);

    }

    /// Get the internal index of the jth gate of the ith Pauli string
    fn pstr_gate_index(&self, i: usize, j: usize) -> usize {
        2*i*self.num_qubits + 2*j
    }

    fn pstr_first_gate_index(&self, i: usize) -> usize {
        2*i*self.num_qubits
    }

    fn pstr_last_gate_index(&self, i: usize) -> usize {
        self.pstr_first_gate_index(i) + 2*self.num_qubits - 1
    }

    fn reset(&mut self) {
        // TODO just set only zero bits?
        self.pauli_strings = bitvec![0; 2*self.num_qubits*self.num_qubits]; 
        self.size = 0;

    }

    // TODO
    fn apply_h_s_conjugations(&mut self) {

        for pstr_index in 0..self.size {

            for qubit_index in 0..self.num_qubits {
                let current_p_gate = self.get_pauli_gate(pstr_index, qubit_index);
                let actual_p_gate = self.h_s_conjugations.get_actual_p_gate(qubit_index, current_p_gate);
                let coefficient_multiplier = self.h_s_conjugations.get_actual_coefficient_multiplier(qubit_index, current_p_gate);

                self.set_pauli_gate(actual_p_gate, pstr_index, qubit_index);
                self.generator_info[pstr_index].1 *= coefficient_multiplier;
            }
        }
        self.h_s_conjugations = HSConjugations::new(self.num_qubits);
    }

    fn conjugate_cnot(&mut self, gate: &Gate) -> Result<(), GeneratorBitVecError> {

        let qubit_2 = gate.qubit_2.unwrap();

        for pstr_index in 0..self.size {

            let q1_current_p_gate = self.get_pauli_gate(pstr_index, gate.qubit_1);
            let q2_current_p_gate = self.get_pauli_gate(pstr_index, qubit_2);

            let q1_target_pauli_gate = self.h_s_conjugations.get_actual_p_gate(gate.qubit_1, q1_current_p_gate);
            let q2_target_pauli_gate = self.h_s_conjugations.get_actual_p_gate(qubit_2, q2_current_p_gate);
            let q1_coefficient_multiplier = self.h_s_conjugations.get_actual_coefficient_multiplier(gate.qubit_1, q1_current_p_gate);
            let q2_coefficient_multiplier = self.h_s_conjugations.get_actual_coefficient_multiplier(qubit_2, q2_current_p_gate);

            self.h_s_conjugations.reset(gate.qubit_1);
            self.h_s_conjugations.reset(qubit_2);


            let look_up_output = CNOT_CONJ_UPD_RULES
                .get(&(q1_target_pauli_gate, q2_target_pauli_gate))
                .unwrap();

            self.generator_info[pstr_index].1 *= look_up_output.coefficient * q1_coefficient_multiplier * q2_coefficient_multiplier;

            self.set_pauli_gate(look_up_output.q1_p_gate, pstr_index, gate.qubit_1);
            self.set_pauli_gate(look_up_output.q2_p_gate, pstr_index, qubit_2);
        }

        self.h_s_conjugations.reset(gate.qubit_1);
        self.h_s_conjugations.reset(qubit_2);
        Ok(())
    }

    fn conjugate_t_gate(&mut self, gate: &Gate, conjugate_dagger: bool) -> Result<(), GeneratorBitVecError> {

        for pstr_index in 0..self.size {

            // TODO abstract this
            let current_pauli_gate = self.get_pauli_gate(pstr_index, gate.qubit_1);
            let target_pauli_gate = self.h_s_conjugations.get_actual_p_gate(gate.qubit_1, current_pauli_gate);
            let coefficient_multiplier = self.h_s_conjugations.get_actual_coefficient_multiplier(gate.qubit_1, current_pauli_gate);

            match target_pauli_gate {
                PauliGate::X => {
                    
                    if conjugate_dagger {
                        // T^{\dag}XT -> 1/sqrt{2} (X - Y)
                        self.generator_info[pstr_index].1 *= *ONE_OVER_SQRT_TWO * coefficient_multiplier;
                        self.pauli_strings.extend_from_within(self.pstr_first_gate_index(pstr_index)..=self.pstr_last_gate_index(pstr_index));
                        self.generator_info.push((self.generator_info[pstr_index].0, self.generator_info[pstr_index].1 * -1.0));

                    } else {
                        // TXT^{\dag} -> 1/sqrt{2} (X + Y)
                        self.generator_info[pstr_index].1 *= *ONE_OVER_SQRT_TWO * coefficient_multiplier;
                        self.pauli_strings.extend_from_within(self.pstr_first_gate_index(pstr_index)..=self.pstr_last_gate_index(pstr_index));
                        self.generator_info.push((self.generator_info[pstr_index].0, self.generator_info[pstr_index].1));
                    }

                    self.set_pauli_gate(PauliGate::X, pstr_index, gate.qubit_1);
                    self.set_pauli_gate(PauliGate::Y, self.size, gate.qubit_1);
                    self.size += 1;
                }

                PauliGate::Y => {

                    if conjugate_dagger {
                        // T^{\dag}YT -> 1/sqrt(2) (Y + X)
                        self.generator_info[pstr_index].1 *= *ONE_OVER_SQRT_TWO * coefficient_multiplier;
                        self.pauli_strings.extend_from_within(self.pstr_first_gate_index(pstr_index)..=self.pstr_last_gate_index(pstr_index));
                        self.generator_info.push((self.generator_info[pstr_index].0, self.generator_info[pstr_index].1));
                    } else {
                        // TYT^{\dag} -> 1/sqrt(2) (Y - X)
                        self.generator_info[pstr_index].1 *= *ONE_OVER_SQRT_TWO * coefficient_multiplier;
                        self.pauli_strings.extend_from_within(self.pstr_first_gate_index(pstr_index)..=self.pstr_last_gate_index(pstr_index));
                        self.generator_info.push((self.generator_info[pstr_index].0, self.generator_info[pstr_index].1 * -1.0));
                    }

                    self.set_pauli_gate(PauliGate::Y, pstr_index, gate.qubit_1);
                    self.set_pauli_gate(PauliGate::X, self.size, gate.qubit_1);
                    self.size += 1;

                }

                _ => {
                    self.generator_info[pstr_index].1 *= coefficient_multiplier;
                }
            }
        }
        self.h_s_conjugations.reset(gate.qubit_1);
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
            GateType::H | GateType::S => { self.h_s_conjugations.update(gate, conjugate_dagger); }
            GateType::CNOT => self.conjugate_cnot(gate)?,
            GateType::T => self.conjugate_t_gate(gate, conjugate_dagger)?,
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

        for pstr_index in 0..self.size {
            let mut coefficient = self.generator_info[pstr_index].1;
            for qubit_index in 0..self.num_qubits {

                let current_p_gate = self.get_pauli_gate(pstr_index, qubit_index);
                let actual_p_gate = self.h_s_conjugations.get_actual_p_gate(qubit_index, current_p_gate);
                coefficient *= self.h_s_conjugations.get_actual_coefficient_multiplier(qubit_index, current_p_gate);

                s.push_str(&format!("{}", actual_p_gate));
            }
            s.push_str(&format!(" ({}: {})", self.generator_info[pstr_index].0, coefficient));
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