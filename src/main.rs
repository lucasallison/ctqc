use clap::Parser;

mod circuit;
mod input_parser;
mod simulator;

use input_parser::parse_file;
use simulator::Simulator;

/// Quantum circuit simulator
#[derive(Parser, Debug)]
#[command(author, version, about, long_about = None)]
struct Args {
    /// Optional flag to run the simulation in verbose mode.
    #[arg(short, default_value_t = false)]
    v: bool,

    /// File containing the circuit to simulate
    #[arg(short)]
    f: String,
}

fn main() {

    let args = Args::parse();
    
    let circuit = match parse_file(&args.f) {
        Ok(circuit) => circuit,
        Err(e) => {
            eprintln!("Could not parse file: {}", e);
            return;
        }
    };

    let mut simulator = Simulator::new(circuit, args.v);
    simulator.simulate();


}
