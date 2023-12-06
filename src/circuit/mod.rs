use snafu::prelude::*;
use std::{cmp, fmt};

#[derive(Debug, Snafu)]
pub enum CircuitError {
    #[snafu(display("{} has not been implemented.", gate_type))]
    GateNotImplemented { gate_type: String },

    #[snafu(display("A second qubit must be provided for the CNOT gate."))]
    MissingSecondQubit {},

    #[snafu(display("Two qubits specified for single qubit gate {}", gate_type))]
    TwoQubitsSingleQubitGate { gate_type: String },

    #[snafu(display("A valid angle must be specified to construct an Rz gate."))]
    RzMissingAngle {},

    #[snafu(display("An angle should only be provided for an Rz gate."))]
    AngleProvidedForNonRzGate {},
}

/// Enum representing the different types of gates in the circuit
/// H - Hadamard gate
/// CNOT - Controlled NOT gate
/// S - Phase gate
/// T - T gate
#[derive(PartialEq, Clone, Debug)]
pub enum GateType {
    H,
    CNOT,
    S,
    T,
    M,
    Rz,
}

impl fmt::Display for GateType {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            GateType::H => write!(f, "H"),
            GateType::CNOT => write!(f, "CNOT"),
            GateType::S => write!(f, "S"),
            GateType::T => write!(f, "T"),
            GateType::M => write!(f, "M"),
            GateType::Rz => write!(f, "Rz"),
        }
    }
}

/// Struct representing a gate in the circuit
/// All gates apply to a single qubit, except for the CNOT gate
/// which applies to two qubits.
#[derive(Clone)]
pub struct Gate {
    pub gate_type: GateType,
    pub qubit_1: usize,
    pub qubit_2: Option<usize>, // Optional: Only used for CNOT
    pub angle: Option<f64>,     // Optional: Only used for Rz
}

impl Gate {
    pub fn new(
        gate_type: &String,
        qubit_1: usize,
        qubit_2: Option<usize>,
        angle: Option<f64>,
    ) -> Result<Gate, CircuitError> {
        let gate_type = match gate_type.as_str() {
            "H" => GateType::H,
            "CNOT" => {
                if qubit_2.is_none() {
                    return Err(CircuitError::MissingSecondQubit {});
                } else {
                    GateType::CNOT
                }
            }
            "S" => GateType::S,
            "T" => GateType::T,
            "M" => GateType::M,
            "Rz" => {
                if angle.is_none() {
                    return Err(CircuitError::RzMissingAngle {});
                } else {
                    GateType::Rz
                }
            }
            gate_type => {
                return Err(CircuitError::GateNotImplemented {
                    gate_type: gate_type.to_string(),
                })
            }
        };

        if gate_type != GateType::CNOT && qubit_2.is_some() {
            return Err(CircuitError::TwoQubitsSingleQubitGate {
                gate_type: gate_type.to_string(),
            });
        }

        if gate_type != GateType::Rz && angle.is_some() {
            return Err(CircuitError::AngleProvidedForNonRzGate {});
        }

        Ok(Gate {
            gate_type,
            qubit_1,
            qubit_2,
            angle,
        })
    }
}

impl fmt::Display for Gate {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self.gate_type {
            GateType::CNOT => write!(
                f,
                "{} {} {}",
                self.gate_type,
                self.qubit_1,
                self.qubit_2.unwrap()
            ),
            GateType::Rz => write!(
                f,
                "{}({}) {}",
                self.gate_type,
                self.angle.unwrap(),
                self.qubit_1,
            ),
            _ => write!(f, "{} {}", self.gate_type, self.qubit_1),
        }
    }
}

/// Struct representing the circuit, i.e., a sequence of gates.
pub struct Circuit {
    name: String,
    pub gates: Vec<Gate>,
    num_qubits: usize,
}

impl Circuit {
    pub fn new(name: String) -> Circuit {
        Circuit {
            name: name,
            gates: Vec::new(),
            num_qubits: 0,
        }
    }

    /// If a valid gate is provided, it is appended to the circuit.
    /// If a gate targets a qubit that is not yet in the circuit, the number of qubits is increased to this qubit.
    pub fn add_gate(
        &mut self,
        gate_type: &String,
        qubit_1: usize,
        qubit_2: Option<usize>,
        angle: Option<f64>,
    ) -> Result<(), CircuitError> {
        let new_gate = Gate::new(gate_type, qubit_1, qubit_2, angle)?;

        self.num_qubits = cmp::max(self.num_qubits, qubit_1 + 1);

        if let Some(qubit_2) = qubit_2 {
            self.num_qubits = cmp::max(self.num_qubits, qubit_2 + 1);
        }

        self.gates.push(new_gate);
        Ok(())
    }

    pub fn len(&self) -> usize {
        self.gates.len()
    }

    pub fn num_qubits(&self) -> usize {
        self.num_qubits
    }

    pub fn name(&self) -> &String {
        &self.name
    }

    pub fn iter(&self) -> CircuitIterator {
        CircuitIterator {
            circuit: self,
            gate_index: 0,
            reverse: false,
        }
    }

    pub fn rev(&self) -> CircuitIterator {
        CircuitIterator {
            circuit: self,
            gate_index: self.gates.len() - 1,
            reverse: true,
        }
    }
}

impl fmt::Display for Circuit {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(
            f,
            "Circuit '{}' with {} qubits:\n",
            self.name, self.num_qubits
        )?;

        for gate in &self.gates {
            write!(f, " {}\n", gate)?;
        }

        Ok(())
    }
}

pub struct CircuitIterator<'a> {
    circuit: &'a Circuit,
    gate_index: usize,
    reverse: bool,
}

impl<'a> Iterator for CircuitIterator<'a> {
    type Item = &'a Gate;

    fn next(&mut self) -> Option<Self::Item> {
        if self.gate_index >= self.circuit.gates.len() {
            return None;
        }

        let gate = &self.circuit.gates[self.gate_index];

        if !self.reverse {}

        if self.reverse {
            if self.gate_index == 0 {
                // Will cause the iterator to stop
                self.gate_index = self.circuit.gates.len();
            } else {
                self.gate_index -= 1;
            }
        } else {
            self.gate_index += 1;
        }
        Some(gate)
    }
}
