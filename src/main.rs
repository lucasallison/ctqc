use clap::Parser;
use snafu::prelude::*;
use std::error::Error;

mod circuit;
mod input_parser;
mod simulator;

use input_parser::parse_file;
use simulator::Simulator;

// TODO
// Floating point error margin
static FP_ERROR_MARGIN: f64 = 0.0000000000001;

/// Quantum circuit simulator based on the sabilizer formalism
#[derive(Parser, Debug)]
#[command(author, version, about, long_about = None)]
struct Args {
    /// Optional flag to run the simulation in verbose mode.
    #[arg(short, default_value_t = false)]
    v: bool,

    /// File containing the circuit to simulate
    #[arg(short)]
    f: String,

    /// Option flag which will run an equivalence check between the circuit
    /// specified by the '-f' flag and the file specified this flag, instead of the simulation
    #[arg(short, default_value_t = String::from(""))]
    e: String,
}

fn main() {
    let args = Args::parse();

    let circuit = match parse_file(&args.f) {
        Ok(circuit) => circuit,
        Err(e) => {
            eprintln!(
                "{}",
                MError::InvalidFileFormat {
                    file: args.f,
                    err: e
                }
            );
            return;
        }
    };

    let simulator = Simulator::new();

    // No second file provided, run the simulation
    if args.e.is_empty() {
        if let Err(e) = simulator.simulate(&circuit, args.v) {
            eprintln!("{}", MError::SimulationFailed { err: e });
        }

    // Second file provided, run the equivalence check
    } else {
        let equiv_circuit = match parse_file(&args.e) {
            Ok(circuit) => circuit,
            Err(e) => {
                eprintln!(
                    "{}",
                    MError::InvalidFileFormat {
                        file: args.f,
                        err: e
                    }
                );
                return;
            }
        };

        if let Err(e) = simulator.equivalence_check(&circuit, &equiv_circuit, args.v) {
            eprintln!("{}", MError::EquivalenceCheckFailed { err: e });
        }
    }
}

#[derive(Debug, Snafu)]
enum MError {
    #[snafu(display("Failed to parse {}: {} ", file, err))]
    InvalidFileFormat { file: String, err: Box<dyn Error> },

    #[snafu(display("Simulation failed: {} ", err))]
    SimulationFailed { err: Box<dyn Error> },

    #[snafu(display("Equivalence check failed: {} ", err))]
    EquivalenceCheckFailed { err: Box<dyn Error> },
}
