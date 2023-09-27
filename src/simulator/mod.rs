use std::io::{stdout, Write};

mod pauli_string;
mod generators;
mod component;
mod simulator_errors;
mod component_bucket;

use crate::circuit::Circuit;
use generators::GeneratorComponents;
use generators::Stats;

pub struct Simulator {
    circuit: Circuit,
    gen_cmpts: GeneratorComponents,
    verbose: bool,
    stats: Stats,
}

impl Simulator {

    pub fn new(circuit: Circuit, verbose: bool) -> Simulator {
        let num_qubits = circuit.num_qubits;

        Simulator {
            circuit: circuit,
            gen_cmpts: GeneratorComponents::new(num_qubits),
            verbose: verbose,
            stats: Stats::new(),
        }
    }

    pub fn simulate(&mut self) {

        let mut stdout = stdout();
        let num_gates = self.circuit.len();

        if self.verbose {
            println!("{}", self.gen_cmpts);
        }

        for (i, gate) in self.circuit.iter().enumerate() {

            if self.verbose {
                println!("Apply {}", gate);
            }

            if let Err(e) = self.gen_cmpts.conjugate(gate, &mut self.stats) {
                eprintln!("SIMULATION STOPPED PREEMPTIVELY -- {}", e);
                return;
            }

            if self.verbose {
                println!("{}", self.gen_cmpts);
            } else {
                print!("\rSimulating... {}% -- {} components {} merges", 
                      (i as f64 / num_gates as f64 * 100.0) as u32, self.gen_cmpts.len(), self.stats.num_merges);
                stdout.flush().unwrap();
            }
        }

        println!("\rSimulation complete");

    }
    
}