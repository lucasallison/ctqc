use std::{fmt, cmp};

mod circuit_errors;

use circuit_errors::CircuitError;

#[derive(PartialEq, Clone)]
pub enum GateType {
    H,
    CNOT,
    S,
    T,
}

impl fmt::Display for GateType {
      fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            GateType::H => write!(f, "H"),
            GateType::CNOT => write!(f, "CNOT"),
            GateType::S => write!(f, "S"),
            GateType::T => write!(f, "T"),
        }
    }
}

#[derive(Clone)]
pub struct Gate {
    pub gate_type: GateType,
    pub qubit_1: u32, // Gate applies to at least one qubit
    pub qubit_2: Option<u32>,
}

impl Gate {
    pub fn new(gate_type: &String, qubit_1: u32, qubit_2: Option<u32>) -> Result<Gate, CircuitError> {

        let gate_type = match gate_type.as_str() {
            "H" => GateType::H,
            "CNOT" => { if qubit_2.is_none() {
                            return Err(CircuitError { message: "CNOT gate must have two qubits".to_string() });
                        } else {
                            GateType::CNOT
                        }}
            "S" => GateType::S,
            "T" => GateType::T,
            _ => return Err(CircuitError { message: format!("{gate_type} has not been implemented, 
                                                    please use H, CNOT, S, or T") })
        };


        if gate_type != GateType::CNOT && qubit_2.is_some() {
            return Err(CircuitError { message: format!("{gate_type} gate must have one qubit") });
        }
        
        Ok(Gate {
            gate_type,
            qubit_1,
            qubit_2,
        })
    }
}

impl fmt::Display for Gate {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self.qubit_2 {
            Some(qubit_2) => write!(f, "{} {} {}", self.gate_type, self.qubit_1, qubit_2),
            None => write!(f, "{} {}", self.gate_type, self.qubit_1), 
        }
    }
}

// TODO: Deal with moments
pub struct Circuit {
    pub name: String,
    gates: Vec<Gate>,
    pub num_qubits: u32,
}

impl Circuit {

    pub fn new(name: String) -> Circuit {
        Circuit {
            name: name,
            gates: Vec::new(),
            num_qubits: 0,
        }
    }

    pub fn add_gate(&mut self, gate_type: &String, qubit_1: u32, qubit_2: Option<u32>) {

        let new_gate = match Gate::new(gate_type, qubit_1, qubit_2) {
            Ok(gate) => gate,
            Err(e) => {
                eprintln!("Could not add gate to circuit: {}", e);
                return;
            }
        };

        self.num_qubits = cmp::max(self.num_qubits, qubit_1 + 1);

        if let Some(qubit_2) = qubit_2 {
            self.num_qubits = cmp::max(self.num_qubits, qubit_2 + 1);
        }

        self.gates.push(new_gate);
    }

    pub fn len(&self) -> usize {
        self.gates.len()
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

        write!(f, "Circuit with {} qubits:\n", self.num_qubits)?;

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

