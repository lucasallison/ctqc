use std::{fmt, cmp};

mod circuit_errors;

use circuit_errors::CircuitError;

#[derive(PartialEq)]
enum GateType {
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

struct Gate {
    gate_type: GateType,
    qubit_1: u32, // Gate applies to at least one qubit
    qubit_2: Option<u32>,
}

impl Gate {
    fn new(gate_type: &String, qubit_1: u32, qubit_2: Option<u32>) -> Result<Gate, CircuitError> {

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
    gates: Vec<Gate>,
    num_qubits: u32,
}

impl Circuit {

    pub fn new() -> Circuit {
        Circuit {
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

        self.num_qubits = cmp::max(self.num_qubits, qubit_1);

        if let Some(qubit_2) = qubit_2 {
            self.num_qubits = cmp::max(self.num_qubits, qubit_2);
        }

        self.gates.push(new_gate);

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