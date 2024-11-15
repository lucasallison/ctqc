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
    ///            index are saved sequentially in a separate bitvector.
    /// - ptrees:  Pauli strings are saved in a binary tree structure.
    /// 
    #[arg(short='d', long, default_value_t = String::from("None"), verbatim_doc_comment)]
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

    /// Conjugate the stabilizer generators with all the gates in the circuit
    /// and subsequently start sampling measurements. This is in contrast to
    /// the default behavior of "simulating the circuit in reverse".
    #[arg(short = 's', long, default_value_t = false, verbatim_doc_comment)]
    sample_measurements: bool,

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

    // Parse the provided circuit(s)
    let circuit = Circuit::from_file(&args.circuit_file);
    let equiv_circuit = if args.equiv_circuit_file != "None" {
        Some(Circuit::from_file(&args.equiv_circuit_file))
    } else {
        None
    };

    // Determine the generator set to use
    let generator_set = match args.generator_set.as_str() {
        "None" => {
            let equiv_is_practically_clifford = equiv_circuit.as_ref().map_or(true, |c| c.practically_clifford());

            if circuit.practically_clifford() && equiv_is_practically_clifford {
                "rbitvec"
            } else {
                "map"
            }
        }
        other => other,
    };

    // Initialize the simulator
    let mut simulator = Simulator::new(
        generator_set.to_string(),
        args.conjugations_before_clean,
        args.threads,
        args.progress_bar,
        node_body_bits,
        pgates_per_leaf,
    );

    // Simulate, or run an equivalence check
    match equiv_circuit {
        Some(equiv) => {
            if args.sample_measurements {
                eprintln!("Sampling measurements can only be done when running a normal simulation, not an equivalence check.");
            } else {
                simulator.equivalence_check(&circuit, &equiv, args.equiv_all_generators);
            }
        },
        None => {
            if args.sample_measurements {
                simulator.simulate_with_sampler(&circuit);
            } else {
                simulator.simulate_backwards(&circuit);
            }
        },
    }

    std::process::exit(0);
}
