use std::{error::Error, fs};

use crate::circuit::Circuit;

pub fn parse_file(file_path: &String) -> Result<Circuit, Box<dyn Error>> {
    
    let mut circuit = Circuit::new(file_path.clone());

    let contents = match fs::read_to_string(file_path) {
        Ok(contents) => contents,
        Err(e) => { return Err(Box::new(e)); },
    };

    contents.lines().for_each(|line| {

        let gate = line.split(" ").collect::<Vec<&str>>(); 

        let gate_type;
        let qubit_1; 
        let qubit_2;

        if gate.len() < 2 || gate.len() > 3 {
            eprintln!("Failed to add '{}', as it is not formatted correctly. 
                        Expected: '<gate> <qubit_1> <qubit_2>'", line);
            return;
        }

        gate_type = gate[0].to_string();
        qubit_1 = match gate[1].parse::<u32>() {
                Ok(qubit_1) => qubit_1,
                Err(_) => { eprintln!("Failed to add '{}', as qubit_1 is not a valid u32", line); return; }
            };
        // TODO refactor?
        if gate.len() == 3 {
            qubit_2 = match gate[2].parse::<u32>() {
                Ok(qubit_2) => Some(qubit_2),
                Err(_) => { eprintln!("Failed to add '{}', as qubit_2 is not a valid u32", line); return; }
            };
        } else {
            qubit_2 = None;
        }

        circuit.add_gate(&gate_type, qubit_1, qubit_2)
    
    });

    Ok(circuit)
}
