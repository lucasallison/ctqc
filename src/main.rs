use clap::Parser;
use snafu::prelude::*;
use std::error::Error;

mod circuit;
use circuit::Circuit;

mod simulator;
use simulator::Simulator;

mod generator_set;
use generator_set::column_wise_bitvec::ColumnWiseBitVec;
use generator_set::generator_map::GeneratorMap;
use generator_set::pauli_pools::PauliPools;
use generator_set::pauli_trees::PauliTrees;
use generator_set::row_wise_bitvec::RowWiseBitVec;
use generator_set::GeneratorSet;

// TODO
// Floating point error margin
static FP_ERROR_MARGIN: f64 = 0.0000000001;

/// Quantum circuit simulator based on the sabilizer formalism.
#[derive(Parser, Debug)]
#[command(author, version, about, long_about = None)]
struct Args {
    /// File containing the circuit to simulate
    #[arg(short = 'f', long, verbatim_doc_comment)]
    circuit_file: String,

    /// Optional flag which will run an equivalence check between the circuit
    /// specified by the '-f' flag and the circuit from the file specified by this flag
    #[arg(short, long, default_value_t = String::from("None"), verbatim_doc_comment)]
    equiv_circuit_file: String,

    /// Provide the specific GeneratorSet implementation to use for the simulation. Options are:
    /// - map:     A map of Pauli strings to their coefficients.
    /// - rbitvec: (row-wise bitvector) All Pauli strings are saved sequentially in a single bitvector.
    /// - cbitvec: (column-wise bitvector) The Pauli gates of each Pauli string at a certain
    ///            index are saved sequentially in a seperate bitvector.
    /// - ppools:  All Pauli strings are divided between a number of row-wise bitvectors and
    ///            simulated in parallel.
    /// - ptrees:  Pauli strings are saved in a binary tree structure.
    /// See TODO for a more detailed explaination.
    #[arg(short, long, default_value_t = String::from("rbitvec"), verbatim_doc_comment)]
    data_structure: String,

    /// Provide after how many gates the simulator should "clean" the
    /// data structure, e.g., remove redundently stored Pauli strings, zero
    /// coefficient Pauli strings, etc...
    #[arg(short, long, default_value_t = 1000, verbatim_doc_comment)]
    clean: usize,

    /// Provide number of threads to use
    #[arg(short, long, default_value_t = 1, verbatim_doc_comment)]
    threads: usize,

    /// Optional flag to run the simulation in verbose mode.
    #[arg(short, long, default_value_t = false, verbatim_doc_comment)]
    verbose: bool,

    /// Ensures that we simulate all generators simultaneously when
    /// running an equivalence check, as opposed to the default behavior
    /// of simulating them one by one.
    #[arg(short = 'g', long, default_value_t = false, verbatim_doc_comment)]
    equiv_all_generators: bool,
}

fn circuit_from_file(file: String) -> Circuit {
    match Circuit::from_file(&file) {
        Ok(circuit) => return circuit,
        Err(e) => {
            eprintln!("{}", MainError::InvalidFileFormat { file: file, err: e });
            std::process::exit(1);
        }
    };
}

fn main() {
    // TODO remove
    std::env::set_var("RUST_BACKTRACE", "1");

    let args = Args::parse();

    let circuit = circuit_from_file(args.circuit_file);

    let mut generator_set: Box<dyn GeneratorSet> = match args.data_structure.as_str() {
        "map" => Box::new(GeneratorMap::new(circuit.n_qubits(), args.threads)),
        "cbitvec" => Box::new(ColumnWiseBitVec::new(circuit.n_qubits(), args.threads)),
        "rbitvec" => Box::new(RowWiseBitVec::new(circuit.n_qubits(), args.threads)),
        "ppools" => Box::new(PauliPools::new(circuit.n_qubits(), args.threads)),
        "ptrees" => Box::new(PauliTrees::new(
            circuit.n_qubits(),
            args.threads,
            None,
            None,
        )),
        _ => {
            eprintln!(
                "{}",
                MainError::InvalidGeneratorSet {
                    data_structure: args.data_structure
                }
            );
            std::process::exit(2);
        }
    };

    let mut simulator = Simulator::new(generator_set.as_mut(), args.clean, args.verbose);

    // No second file provided, run the simulation
    if args.equiv_circuit_file == "None" {
        if let Err(e) = simulator.simulate(&circuit) {
            eprintln!("{}", MainError::SimulationFailed { err: e });
            std::process::exit(1);
        }

    // Second file provided, run an equivalence check
    } else {
        let equiv_circuit = circuit_from_file(args.equiv_circuit_file);
        if let Err(e) =
            simulator.equivalence_check(&circuit, &equiv_circuit, args.equiv_all_generators)
        {
            eprintln!("{}", MainError::EquivalenceCheckFailed { err: e });
            std::process::exit(1);
        }
    }
    std::process::exit(0);
}

#[derive(Debug, Snafu)]
enum MainError {
    #[snafu(display("Invalid data structure type: {}. Use the help (-h) flag to see the available data structures", data_structure))]
    InvalidGeneratorSet { data_structure: String },

    #[snafu(display("Failed to parse {}: {} ", file, err))]
    InvalidFileFormat { file: String, err: Box<dyn Error> },

    #[snafu(display("Simulation failed: {} ", err))]
    SimulationFailed { err: Box<dyn Error> },

    #[snafu(display("Equivalence check failed: {} ", err))]
    EquivalenceCheckFailed { err: Box<dyn Error> },
}
