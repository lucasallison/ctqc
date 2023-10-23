use snafu::prelude::*;
use std::{error::Error, fs};

use crate::circuit::Circuit;

/// Parses a file containing a quantum circuit and returns a Circuit struct.
/// The accepted format can be found in the documentation.
pub fn parse_file(file_path: &String) -> Result<Circuit, Box<dyn Error>> {
    let contents = match fs::read_to_string(file_path) {
        Ok(contents) => contents,
        Err(e) => {
            return Err(Box::new(e));
        }
    };

    let mut circuit = Circuit::new(file_path.clone());
    let mut gate_type: String;
    let mut qubit_1: usize;
    let mut qubit_2: Option<usize>;

    for line in contents.lines() {
        let gate = line.split(" ").collect::<Vec<&str>>();

        if gate.len() < 2 || gate.len() > 3 {
            return Err(Box::new(ParseError::InvalidLine {
                line: line.to_string(),
            }));
        }

        qubit_1 = match gate[1].parse::<usize>() {
            Ok(qubit_1) => qubit_1,
            Err(_) => {
                return Err(Box::new(ParseError::InvalidQubit1 {
                    gate: line.to_string(),
                }));
            }
        };

        if gate.len() == 3 {
            qubit_2 = match gate[2].parse::<usize>() {
                Ok(qubit_2) => Some(qubit_2),
                Err(_) => {
                    return Err(Box::new(ParseError::InvalidQubit2 {
                        gate: line.to_string(),
                    }));
                }
            };
        } else {
            qubit_2 = None;
        }

        gate_type = gate[0].to_string();

        circuit.add_gate(&gate_type, qubit_1, qubit_2)?;
    }

    Ok(circuit)
}

#[derive(Debug, Snafu)]
pub enum ParseError {
    #[snafu(display(
        "Invalid line in file: {}. Expected: '<gate> <qubit_1> <qubit_2>'",
        line
    ))]
    InvalidLine { line: String },

    #[snafu(display(
        "Cannot add '{}', as it is not formatted correctly. Expected: '<gate> <qubit>'",
        gate
    ))]
    InvalidSingleQubitGate { gate: String },

    #[snafu(display(
        "Cannot add '{}', as it is not formatted correctly. Expected: '<gate> <qubit_1> <qubit_2>'",
        gate
    ))]
    InvalidTwoQubitGate { gate: String },

    #[snafu(display("Cannot add '{}', as qubit_1 is not a valid usize", gate))]
    InvalidQubit1 { gate: String },

    #[snafu(display("Cannot add '{}', as qubit_2 is not a valid usize", gate))]
    InvalidQubit2 { gate: String },
}
