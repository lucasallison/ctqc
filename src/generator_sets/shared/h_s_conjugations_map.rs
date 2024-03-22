use crate::circuit::{Gate, GateType};
use crate::generator_sets::pauli_string::PauliGate;
use crate::generator_sets::utils::conjugation_look_up_tables::{
    H_CONJ_UPD_RULES, S_CONJ_UPD_RULES, S_DAGGER_CONJ_UPD_RULES,
};

/// A 'map' that stores the conjugations of the H and S gates.
/// For each qubit, we store a triple of tuples of the form (PauliGate, f64).
/// The tuples represent the transformations of the X, Y, and Z Pauli gates respectively.
/// Example: if we want to conjugate the gate H 5 we apply the update rules to the
/// three tuples stored at index 4. If no conjugation is applied the map at index 4 yet
/// the triples will be [(PauliGate::Z, 1.0), (PauliGate::Y, -1.0), (PauliGate::X, 1.0)].
/// We know that if a Pauli string has an X gate at qubit 5 it should be treated as a Z gate,
/// and a Pauli string that has a Y gate at qubit 5 should be treated as a -Y gate.
#[derive(Clone)]
pub struct HSConjugationsMap {
    map: Vec<[(PauliGate, f64); 3]>,
}

impl HSConjugationsMap {
    pub fn new(num_qubits: usize) -> HSConjugationsMap {
        HSConjugationsMap {
            map: vec![
                [
                    (PauliGate::X, 1.0),
                    (PauliGate::Y, 1.0),
                    (PauliGate::Z, 1.0)
                ];
                num_qubits
            ],
        }
    }

    /// Reset the map for all qubits
    pub fn reset_all(&mut self) {
        for i in 0..self.map.len() {
            self.reset(i);
        }
    }

    /// Reset the map for a given qubit, that is,
    /// undo the conjugations that have been applied.
    /// This function should only be called once the
    /// updates have been applied to all Pauli strings.
    pub fn reset(&mut self, qubit: usize) {
        self.map[qubit] = [
            (PauliGate::X, 1.0),
            (PauliGate::Y, 1.0),
            (PauliGate::Z, 1.0),
        ];
    }

    /// Apply the conjugation rules for the provided H or S gate to the map.
    pub fn update(&mut self, gate: &Gate, conjugate_dagger: bool) {
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
                _ => {
                    panic!("Invalid gate type for HSConjugationsMap update")
                }
            };

            e.0 = look_up_output.p_gate;
            e.1 *= look_up_output.coefficient;
        }
    }

    /// Return the gate that should be at the qubit index of the Pauli string
    pub fn get_actual_p_gate(&self, qubit: usize, p_gate: PauliGate) -> PauliGate {
        match p_gate {
            PauliGate::X => return self.map[qubit][0].0,
            PauliGate::Y => return self.map[qubit][1].0,
            PauliGate::Z => return self.map[qubit][2].0,
            PauliGate::I => return PauliGate::I,
        }
    }

    /// Return the coefficient multiplier that should be applied to the Pauli string
    pub fn get_coefficient_multiplier(&self, i: usize, p_gate: PauliGate) -> f64 {
        match p_gate {
            PauliGate::X => return self.map[i][0].1,
            PauliGate::Y => return self.map[i][1].1,
            PauliGate::Z => return self.map[i][2].1,
            PauliGate::I => 1.0,
        }
    }
}
