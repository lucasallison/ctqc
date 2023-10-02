use clap::Parser;

mod circuit;
mod input_parser;
mod simulator;

use input_parser::parse_file;
use simulator::Simulator;

// TODO
// Floating point error margin 
static FP_ERROR_MARGIN: f64 = 0.00000000001;


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

    /// Option flag which will run the equivalence check instead of the simulation
    /// A second file must be provided right after the flag to run the equivalence check
    #[arg(short, default_value_t = String::from(""))]
    e: String,
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

    let simulator = Simulator::new();

    if args.e.is_empty() {
        simulator.simulate(&circuit , args.v);
    } else {
        let equiv_circuit = match parse_file(&args.e) {
            Ok(circuit) => circuit,
            Err(e) => {
                eprintln!("Could not parse second file: {}", e);
                return;
            }
        };
        
        simulator.equivalence_check(&circuit, &equiv_circuit, args.v);
    }



}
