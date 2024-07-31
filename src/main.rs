use clap::Parser;
use env_logger;

mod circuit;
use circuit::Circuit;

mod simulator;
use simulator::Simulator;

mod generator_sets;

/// Quantum circuit simulator based on the sabilizer formalism.
#[derive(Parser, Debug)]
#[command(author, version, about, long_about = None)]
struct Args {
    /// File containing the first circuit.
    #[arg(short = 'f', long, verbatim_doc_comment)]
    circuit_file: String,

    /// File containing the second circuit
    #[arg(short, long, default_value_t = String::from("None"), verbatim_doc_comment)]
    equiv_circuit_file: String,

    /// Provide the specific GeneratorSet implementation to use for the simulation. Options are:
    /// - map:     A map of Pauli strings to their coefficients.
    /// - rbitvec: (row-wise bitvector) All Pauli strings are saved sequentially in a single bitvector.
    /// - cbitvec: (column-wise bitvector) The Pauli gates of each Pauli string at a certain
    ///            index are saved sequentially in a seperate bitvector.
    /// - ptrees:  Pauli strings are saved in a binary tree structure.
    /// See TODO for a more detailed explaination.
    #[arg(short='d', long, default_value_t = String::from("map"), verbatim_doc_comment)]
    generator_set: String,

    /// Provide after how many gates the simulator should "clean" the
    /// data structure, e.g., remove redundantly stored Pauli strings, zero
    /// coefficient Pauli strings, etc...
    #[arg(short, long, default_value_t = 10, verbatim_doc_comment)]
    conjugations_before_clean: usize,

    /// Provide number of threads to use. When 0 is provided
    /// the number of threads will equal the number of CPU cores.
    #[arg(short, long, default_value_t = 0, verbatim_doc_comment)]
    threads: usize,

    /// Print a progress bar to the terminal
    #[arg(short, long, default_value_t = false, verbatim_doc_comment)]
    progress_bar: bool,

    /// Ensures that we simulate all generators simultaneously when
    /// running an equivalence check, as opposed to the default behavior
    /// of simulating them one by one.
    #[arg(short = 'a', long, default_value_t = false, verbatim_doc_comment)]
    equiv_all_generators: bool,

    /// When using the ptrees implementation we can set the size
    /// of the internal nodes in the tree; the node body bits (nbb).
    /// By default or when a 0 is provided the argument is ignored
    #[arg(long, default_value_t = 0, verbatim_doc_comment)]
    nbb: usize,

    /// When using the ptrees implementation we can set the number
    /// Pauli gates we want to be stored in the leafs; Pauli gates per leaf (pgl).
    /// By default or when a 0 is provided the argument is ignored
    #[arg(long, default_value_t = 0, verbatim_doc_comment)]
    pgl: usize,
}

fn main() {
    env_logger::init();
    let args = Args::parse();

    if args.threads > 0 {
        rayon::ThreadPoolBuilder::new()
            .num_threads(args.threads)
            .build_global()
            .unwrap();
    }

    let node_body_bits = if args.nbb == 0 { None } else { Some(args.nbb) };
    let pgates_per_leaf = if args.pgl == 0 { None } else { Some(args.pgl) };

    // Initialize the simulator
    let mut simulator = Simulator::new(
        args.generator_set,
        args.conjugations_before_clean,
        args.threads,
        args.progress_bar,
        node_body_bits,
        pgates_per_leaf,
    );

    // Parse the provided circuit
    let circuit = Circuit::from_file(&args.circuit_file);

    // Simulate, or run an equivalence check
    match args.equiv_circuit_file.as_str() {
        "None" => {
            simulator.simulate(&circuit);
        }
        _ => {
            let equiv_circuit = Circuit::from_file(&args.equiv_circuit_file);
            simulator.equivalence_check(&circuit, &equiv_circuit, args.equiv_all_generators);
        }
    }

    std::process::exit(0);
}
