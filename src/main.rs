use std::env;

mod circuit;
mod input_parser;
mod simulator;

use input_parser::parse_file;
use simulator::Simulator;


fn print_usage() {
    eprintln!("Usage: cargo run <input_file>");
    eprintln!("Or optionally run it verbose mode: cargo run -v <input_file>");
}

fn main() {

    let args: Vec<String> = env::args().collect();

    let mut verbose = false;
    let mut file_path = String::new();


    match args.len() {
        2 => {
            file_path = args[1].clone();
        },
        3 => {
            file_path = args[1].clone();

            if args[2] == "-v" {
                verbose = true;
            } else { return; }
        },
        _ => { print_usage(); return; },
    }

    println!("Parsing circuit from file...");
    
    let circuit = match parse_file(&file_path) {
        Ok(circuit) => circuit,
        Err(e) => {
            eprintln!("Could not parse file: {}", e);
            return;
        }
    };


    println!("Parsing complete. Simulating circuit...");

    let mut simulator = Simulator::new(circuit, verbose);
    simulator.simulate();

    println!("Simulation complete.");

}
