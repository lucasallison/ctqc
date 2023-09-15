
mod pauli_string;
mod generators;

use crate::circuit::Gate;
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

        // println!("{}", self.gen_cmpts);

        // let hadamard = Gate::new(&"H".to_string(), 0, None).unwrap();
        // let s_gate: Gate = Gate::new(&"S".to_string(), 0, None).unwrap();
        // let cnot = Gate::new(&"CNOT".to_string(), 0, Some(1)).unwrap();
        // let t_gate = Gate::new(&"T".to_string(), 0, None).unwrap();

        // self.gen_cmpts.conjugate(&hadamard);

        // println!("{}", self.gen_cmpts);

        // self.gen_cmpts.conjugate(&t_gate);

        // println!("{}", self.gen_cmpts);

        // self.gen_cmpts.conjugate(&t_gate);

        // println!("{}", self.gen_cmpts);

        println!("{}", self.gen_cmpts);

        for gate in self.circuit.iter() {
            self.gen_cmpts.conjugate(gate);
            println!("{}", self.gen_cmpts);
        }

    }
    
}