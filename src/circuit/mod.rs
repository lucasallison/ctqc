use lazy_static::lazy_static;
use meval;
use regex::Regex;
use snafu::prelude::*;
use std::{cmp, fmt};
use std::{error::Error, fs};

#[derive(PartialEq, Clone, Debug)]
pub enum GateType {
    H,
    CNOT,
    S,
    Rz,
}

impl fmt::Display for GateType {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            GateType::H => write!(f, "H"),
            GateType::CNOT => write!(f, "CNOT"),
            GateType::S => write!(f, "S"),
            GateType::Rz => write!(f, "Rz"),
        }
    }
}

#[derive(Clone, Debug)]
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
                }
                if qubit_1 == qubit_2.unwrap() {
                    return Err(CircuitError::SameControlAndTargetQubit {});
                }
                GateType::CNOT
            }
            "S" => GateType::S,
            "Rz" => {
                if angle.is_none() {
                    return Err(CircuitError::RzMissingAngle {});
                }
                GateType::Rz
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

// Useful regexes when parsing the circuit file
lazy_static! {
    static ref H_S_RE: Regex = Regex::new(r"^(H|S) (\d+)$").unwrap();
    static ref CNOT_RE: Regex = Regex::new(r"^CNOT (\d+) (\d+)$").unwrap();
    static ref T_RE: Regex = Regex::new(r"^T (\d+)$").unwrap();
    static ref RZ_RE: Regex = Regex::new(r"^Rz\(.*\) (\d+)$").unwrap();
    static ref RZ_ANGLE_RE: Regex = Regex::new(r"\((.*)\)").unwrap();
    static ref RZ_DIGIT_RE: Regex = Regex::new(r"\d+$").unwrap();
    static ref M_RE: Regex = Regex::new(r"^M (\d+)$").unwrap();
}

/// Struct representing a quantum circuit, i.e., a sequence of gates.
pub struct Circuit {
    name: String,
    gates: Vec<Gate>,
    measurements: Vec<usize>,
    n_qubits: usize,
}

impl Circuit {
    pub fn from_file(file: &String) -> Circuit {
        let mut circuit = Circuit {
            name: file.clone(),
            gates: Vec::new(),
            measurements: Vec::new(),
            n_qubits: 0,
        };

        let contents = match fs::read_to_string(file) {
            Ok(contents) => contents,
            Err(e) => {
                eprintln!("Failed to reading {}: {}", file, e);
                std::process::exit(1);
            }
        };

        match circuit.add_gates_from_str(&contents) {
            Ok(_) => return circuit,
            Err(e) => {
                eprintln!("Failed to parse {}: {}", file, e);
                std::process::exit(1);
            }
        }
    }

    fn add_gates_from_str(&mut self, gates: &str) -> Result<(), Box<dyn Error>> {
        let mut gate_type: String;
        let mut qubit_1: usize;
        let mut qubit_2: Option<usize>;
        let mut angle: Option<f64>;

        for line in gates.lines() {
            qubit_2 = None;
            angle = None;

            if H_S_RE.is_match(line) {
                let gate_qubit = line.split(" ").collect::<Vec<&str>>();
                gate_type = gate_qubit[0].to_string();
                qubit_1 = gate_qubit[1].parse::<usize>()?;
            } else if CNOT_RE.is_match(line) {
                let gate_qubits = line.split(" ").collect::<Vec<&str>>();
                gate_type = gate_qubits[0].to_string();
                qubit_1 = gate_qubits[1].parse::<usize>()?;
                qubit_2 = Some(gate_qubits[2].parse::<usize>()?);
            } else if T_RE.is_match(line) {
                // Internally we use Rz(pi/4) to represent T
                gate_type = "Rz".to_string();
                qubit_1 = line.split(" ").collect::<Vec<&str>>()[1].parse::<usize>()?;
                angle = Some(std::f64::consts::FRAC_PI_4);
            } else if RZ_RE.is_match(line) {
                gate_type = line[0..2].to_string();

                let expr = RZ_ANGLE_RE.captures(line).unwrap().get(1).unwrap().as_str();
                angle = Some(meval::eval_str(expr)?);

                qubit_1 = RZ_DIGIT_RE
                    .captures(line)
                    .unwrap()
                    .get(0)
                    .unwrap()
                    .as_str()
                    .parse::<usize>()?;
            } else if M_RE.is_match(line) {
                let gate_qubit = line.split(" ").collect::<Vec<&str>>();
                self.measurements.push(gate_qubit[1].parse::<usize>()?);
                continue;
            } else {
                return Err(Box::new(ParseError::InvalidLine {
                    line: line.to_string(),
                }));
            }

            self.add_gate(&gate_type, qubit_1, qubit_2, angle)?;
        }
        Ok(())
    }

    /// If a valid gate is provided, it is appended to the circuit.
    /// If a gate targets a qubit that is not yet in the circuit, the number of qubits is increased to this qubit.
    fn add_gate(
        &mut self,
        gate_type: &String,
        qubit_1: usize,
        qubit_2: Option<usize>,
        angle: Option<f64>,
    ) -> Result<(), CircuitError> {
        let new_gate = Gate::new(gate_type, qubit_1, qubit_2, angle)?;

        self.n_qubits = cmp::max(self.n_qubits, qubit_1 + 1);

        if let Some(qubit_2) = qubit_2 {
            self.n_qubits = cmp::max(self.n_qubits, qubit_2 + 1);
        }

        self.gates.push(new_gate);
        Ok(())
    }

    pub fn len(&self) -> usize {
        self.gates.len()
    }

    pub fn n_qubits(&self) -> usize {
        self.n_qubits
    }

    pub fn name(&self) -> String {
        self.name.clone()
    }

    pub fn iter(&self, reversed: bool) -> CircuitIterator {
        if reversed {
            CircuitIterator {
                circuit: self,
                gate_index: 0,
                reverse: false,
            }
        } else {
            CircuitIterator {
                circuit: self,
                gate_index: self.gates.len() - 1,
                reverse: true,
            }
        }
    }

    pub fn measurements(&self) -> &Vec<usize> {
        &self.measurements
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

        if self.reverse && self.gate_index == 0 {
            // Will cause the iterator to stop and prevent
            // gate_index from overflowing
            self.gate_index = self.circuit.gates.len();
        } else if self.reverse {
            self.gate_index -= 1;
        } else {
            self.gate_index += 1;
        }
        Some(gate)
    }
}

#[derive(Debug, Snafu)]
pub enum ParseError {
    #[snafu(display(
        "Invalid line: {}. Expected: '<gate> <qubit_1> (Optional: <qubit_2>)'",
        line
    ))]
    InvalidLine { line: String },
}

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

    #[snafu(display("CNOT control and target qubit cannot be the same."))]
    SameControlAndTargetQubit {},
}
