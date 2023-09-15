mod circuit;
mod input_parser;
mod simulator;

use input_parser::parse_file;
use simulator::Simulator;

fn main() {

    // let file_path = String::from("/Users/lucas/Dev/thesis/simulator/src/sample_circuits/easy.txt");
    // let file_path = String::from("/Users/lucas/Dev/thesis/simulator/src/sample_circuits/single_qubit.txt");
    // let file_path = String::from("/Users/lucas/Dev/thesis/circuits/wrong.txt");
    let file_path = String::from("/Users/lucas/Dev/thesis/simulator/src/sample_circuits/test.txt");

    // TODO unwrap
    let circuit = parse_file(&file_path).unwrap();

    let mut simulator = Simulator::new(circuit);

    simulator.simulate();

    // println!("{}", circuit);
}
