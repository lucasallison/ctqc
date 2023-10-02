use std::io::{stdout, Write};
use lazy_static::lazy_static;

mod pauli_string;
mod generators;
mod component;
mod simulator_errors;
// mod distributed_components;
// mod component_bucket;

use crate::circuit::Circuit;
use generators::GeneratorComponents;
use generators::Stats;

lazy_static! {
    static ref DAG_CHAR: char = std::char::from_u32(8224).unwrap();
}

// Holds all the data for simulations/equivalence checks
struct SimData<'a> {
    circuit: &'a Circuit,
    gen_cmpts: GeneratorComponents,
    stats: Stats,
    verbose: bool
}

// Executes the simulation/equivalence check
pub struct Simulator { }

impl Simulator {

    pub fn new() -> Simulator {
        Simulator {  }
    }

    pub fn simulate(&self, circuit: &Circuit, verbose: bool) {

        let mut sim_data = SimData {
            circuit: circuit,
            gen_cmpts: GeneratorComponents::new(circuit.num_qubits, false),
            stats: Stats::new(),
            verbose: verbose
        };

        self.sim(&mut sim_data, false, String::from("Simulating... "));
    }

    // Returns true if the two circuits are equivalent, false otherwise
    pub fn equivalence_check(&self, circuit_1: &Circuit, circuit_2: &Circuit, verbose: bool) {

        if circuit_1.num_qubits != circuit_2.num_qubits {
            eprintln!("Cannot check equivalence: Circuits have different number of qubits");
            return;
        }

        println!("Checking equivalence for circuits U, V");

        if !self.equiv(circuit_1, circuit_2, true, verbose) {
            println!("Circuits are not equivalent: V(UZU^{})^{} does not yield the generator for the all zero state", *DAG_CHAR, *DAG_CHAR);
            return;
        }

        if !self.equiv(circuit_1, circuit_2, false, verbose) {
            println!("Circuits are not equivalent: V(UXU^{})^{} does not yield the generator for the all plus state", *DAG_CHAR, *DAG_CHAR);
            return;
        }

        println!("Circuits are equivalent")
    }

    fn equiv(&self, circuit_1: &Circuit, circuit_2: &Circuit, check_zero_state: bool, verbose: bool) -> bool {

        let mut sim_data = SimData {
            circuit: circuit_1,
            gen_cmpts: GeneratorComponents::new(circuit_1.num_qubits, check_zero_state),
            stats: Stats::new(),
            verbose: verbose
        };

        let z_x_char = if check_zero_state { 'Z' } else { 'X' };

        // First we simulate the first circuit with the all zero/plus state generators
        self.sim(&mut sim_data, false, format!("Determining U{}U^{}... ", z_x_char, *DAG_CHAR));

        // Then we simulate the inverse second circuit with the generators produced by the simulation
        // of the first circuit
        sim_data.circuit = circuit_2;
        self.sim(&mut sim_data, true, format!("Determining V(U{}U^{})^{}... ", z_x_char, *DAG_CHAR, *DAG_CHAR));

        return sim_data.gen_cmpts.is_x_or_z_generators(check_zero_state);
    }

    // Performs a simulation based on the data currently stored in the struct. These values should
    // be initialized meaningfully by other functions, e.g. simulate or equivalence_check
    // 'inverse' specifies whether to run the inverse of the circuit
    fn sim(&self, sim_data: &mut SimData, inverse: bool, sim_msg: String) {

        let mut stdout = stdout();
        let num_gates = sim_data.circuit.len();

        if sim_data.verbose {
            println!("Initial components:");
            println!("{}", sim_data.gen_cmpts);
        }

        let circ_iter = if inverse { sim_data.circuit.rev() } else { sim_data.circuit.iter() };

        for (i, gate) in circ_iter.enumerate() {

            if sim_data.verbose {
                println!("Applied {}", gate);
            }

            if let Err(e) = sim_data.gen_cmpts.conjugate(gate, &mut sim_data.stats, inverse) {
                eprintln!("SIMULATION STOPPED PREEMPTIVELY -- {}", e);
                return;
            }

            if sim_data.verbose {
                println!("{}", sim_data.gen_cmpts);
            } else {
                print!("\r{}{}% -- {} components {} merges", sim_msg,
                      (i as f64 / num_gates as f64 * 100.0) as u32, sim_data.gen_cmpts.len(), sim_data.stats.num_merges);
                stdout.flush().unwrap();
            }
        }

        if !sim_data.verbose {
            println!("\r{}100% -- {} components {} merges", sim_msg, sim_data.gen_cmpts.len(), sim_data.stats.num_merges);
        }

    }

}