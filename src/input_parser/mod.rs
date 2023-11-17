use snafu::prelude::*;
use std::{error::Error, fs};
use meval;
use regex::Regex;

use crate::circuit::Circuit;


/// Parses a file containing a quantum circuit and returns a Circuit struct.
/// The accepted format can be found in the documentation.
pub fn parse_file(file_path: &String) -> Result<Circuit, Box<dyn Error>> {

    let h_s_t_m_re = Regex::new(r"^(H|S|T|M) (\d+)$").unwrap();
    let cnot_re = Regex::new(r"^CNOT (\d+) (\d+)$").unwrap();
    let rz_re = Regex::new(r"^Rz\(.*\) (\d+)$").unwrap();
    let paren_re = Regex::new(r"\((.*)\)").unwrap();    
    let rz_digit_re = Regex::new(r"\d+$").unwrap();


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
    let mut angle: Option<f64>; 

    for line in contents.lines() {


        qubit_2 = None;
        angle = None;

        if h_s_t_m_re.is_match(line) {

            let gate_qubit = line.split(" ").collect::<Vec<&str>>();
            gate_type = gate_qubit[0].to_string();
            qubit_1 = gate_qubit[1].parse::<usize>()?;
            
        } else if cnot_re.is_match(line) {

            let gate_qubits = line.split(" ").collect::<Vec<&str>>();
            gate_type = gate_qubits[0].to_string();
            qubit_1 = gate_qubits[1].parse::<usize>()?;
            qubit_2 = Some(gate_qubits[2].parse::<usize>()?);

        } else if rz_re.is_match(line) {

            gate_type = line[0..2].to_string();

            let expr = paren_re.captures(line).unwrap().get(1).unwrap().as_str().to_string();
            angle = Some(meval::eval_str(&expr)?);

            qubit_1 = rz_digit_re.captures(line).unwrap().get(0).unwrap().as_str().parse::<usize>()?;

        } else {
            return Err(Box::new(ParseError::InvalidLine {
                line: line.to_string(),
            }));
        }

        circuit.add_gate(&gate_type, qubit_1, qubit_2, angle)?;
    }

    Ok(circuit)
}

#[derive(Debug, Snafu)]
pub enum ParseError {
    #[snafu(display(
        "Invalid line in file: {}. Expected: '<gate> <qubit_1> Option(<qubit_2>)'",
        line
    ))]
    InvalidLine { line: String },
}
