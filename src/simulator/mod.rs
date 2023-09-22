
mod pauli_string;
mod generators;

use crate::circuit::Circuit;
use generators::GeneratorComponents;

pub struct Simulator {
    circuit: Circuit,
    gen_cmpts: GeneratorComponents,
}

impl Simulator {

    pub fn new(circuit: Circuit) -> Simulator {
        let num_qubits = circuit.num_qubits;
        Simulator {
            circuit,
            gen_cmpts: GeneratorComponents::all_zero_state_generators(num_qubits),
        }
    }

    pub fn simulate(&mut self) {

        println!("{}", self.gen_cmpts);

        for gate in self.circuit.iter() {
            println!("Apply {}", gate);
            if let Err(e) = self.gen_cmpts.conjugate(gate) {
                eprintln!("SIMULATION STOPPED PREEMPTIVELY -- {}", e);
                return;
            }
            println!("{}", self.gen_cmpts);
        }

    }
    
}