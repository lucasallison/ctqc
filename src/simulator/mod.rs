use std::io::{stdout, Write};

mod pauli_string;
mod generators;
mod component;
mod simulator_errors;
// mod distributed_components;
// mod component_bucket;

use crate::circuit::Circuit;
use generators::GeneratorComponents;
use generators::Stats;

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
            eprintln!("Circuits have different number of qubits");
            return;
        }

        let mut sim_data = SimData {
            circuit: circuit_1,
            gen_cmpts: GeneratorComponents::new(circuit_1.num_qubits, false),
            stats: Stats::new(),
            verbose: verbose
        };

        let dag_char = std::char::from_u32(8224).unwrap();

        println!("Checking equivalence for circuits U, V");
        // First we simulate the first circuit with the all zero state generators
        self.sim(&mut sim_data, false, format!("Determining UZU^{}... ", dag_char));

        // Then we simulate the inverse second circuit with the generators produced by the simulation
        // of the first circuit
        sim_data.circuit = circuit_2;
        self.sim(&mut sim_data, true, format!("Determining V(UZU^{})^{}... ", dag_char, dag_char));

        if !sim_data.gen_cmpts.is_zero_state_generators() {
            println!("Circuits are not equivalent");
            return;
        }

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