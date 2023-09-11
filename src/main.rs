
mod circuit;

use circuit::Circuit;

fn main() {

    let mut circuit = Circuit::new();

    let _  = circuit.add_gate("H".to_string(), 1, None);


    println!("{}", circuit);

}
