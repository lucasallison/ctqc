use std::fmt;

mod circuit_errors;

use circuit_errors::CircuitError;

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
    fn new(gate_type: String, qubit_1: u32, qubit_2: Option<u32>) -> Result<Gate, CircuitError> {

        let gate_type = match gate_type.as_str() {
            "H" => GateType::H,
            "CNOT" => { if qubit_2.is_none() {
                            return Err(CircuitError { message: "CNOT gate must have two qubits".to_string() });
                        } else {
                            GateType::CNOT
                        }}
            "S" => GateType::S,
            "T" => GateType::T,
            _ => return Err(CircuitError { message: "{gate_type} has not been implemented, 
                                                    please use H, CNOT, S, or T".to_string()})
        };
        
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

    pub fn add_gate(&mut self, gate_type: String, qubit_1: u32, qubit_2: Option<u32>) -> Result<(), CircuitError> {
    
        let new_gate = Gate::new(gate_type, qubit_1, qubit_2)?;

        self.gates.push(new_gate);

        Ok(())
    }

}

impl fmt::Display for Circuit {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {

        write!(f, "Circuit:\n")?;

        for gate in &self.gates {
            write!(f, " {}\n", gate)?;
        }

        Ok(())
    }
    
}