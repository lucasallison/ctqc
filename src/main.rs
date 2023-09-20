use std::env;

mod circuit;
mod input_parser;
mod simulator;

use input_parser::parse_file;
use simulator::Simulator;

fn main() {

    let args: Vec<String> = env::args().collect();

    let file_path = &args[1];

    // TODO unwrap
    let circuit = parse_file(&file_path).unwrap();

    let mut simulator = Simulator::new(circuit);

    simulator.simulate();

    // println!("{}", circuit);
}
