use lazy_static::lazy_static;
use snafu::prelude::*;
use std::error::Error;
use std::io::{stdout, Write};

use crate::circuit::Circuit;
use crate::generator_set::GeneratorSet;

lazy_static! {
    static ref DAG_CHAR: char = std::char::from_u32(8224).unwrap();
}

/// Executes the simulation/equivalence check
pub struct Simulator<T: GeneratorSet> {
    generator_set: T,
    verbose: bool,
}

impl<T: GeneratorSet> Simulator<T> {
    pub fn new(generator_set: T, verbose: bool) -> Simulator<T> {
        Simulator { generator_set, verbose }
    }

    /// Simulates the provided ciricuit by setting the generators to the generators of the all zero state
    /// and calling the 'sim' function.
    pub fn simulate(&mut self, circuit: &Circuit) -> Result<(), Box<dyn Error>> {
        self.generator_set.init_generators(true);

        self.sim(circuit, false, String::from("Simulating... "))
    }

    /// Returns true if the two circuits, U and V, are equivalent, false otherwise. It does so by
    /// simulating the circuit UV^† twice, once for the all zero state generators, once for the all plus stat generators.
    /// If, in both cases, the generators produced by the simulation are the generators we started with, we know
    /// the circuits are equivalent.
    pub fn equivalence_check(
        &mut self,
        circuit_1: &Circuit,
        circuit_2: &Circuit,
    ) -> Result<(), Box<dyn Error>> {
        if circuit_1.num_qubits() != circuit_2.num_qubits() {
            return Err(SimulationError::DifferentSizedCiruicuits {
                n_qubits_c1: circuit_1.num_qubits(),
                n_qubits_c2: circuit_2.num_qubits(),
            }
            .into());
        }

        println!(
            "Checking equivalence for circuits U = {} and V = {}",
            circuit_1.name(),
            circuit_2.name()
        );

        let equiv = self.equiv(circuit_1, circuit_2, true)?;
        if !equiv {
            println!("Circuits are not equivalent: V(UZU^{})^{} does not yield the generators for the all zero state", *DAG_CHAR, *DAG_CHAR);
            return Ok(());
        }

        let equiv = self.equiv(circuit_1, circuit_2, false)?;
        if !equiv {
            println!("Circuits are not equivalent: V(UXU^{})^{} does not yield the generators for the all plus state", *DAG_CHAR, *DAG_CHAR);
            return Ok(());
        }

        println!("Circuits are equivalent");
        Ok(())
    }

    /// Given two circuits U and V the equiv fuction simulates the circuit UV^† and checks whether
    /// the resulting generators are the generators for the all zero state or the all plus state.
    fn equiv(
        &mut self,
        circuit_1: &Circuit,
        circuit_2: &Circuit,
        check_zero_state_generators: bool,
    ) -> Result<bool, Box<dyn Error>> {

        self.generator_set.init_generators(check_zero_state_generators);

        let z_x_char = if check_zero_state_generators {
            'Z'
        } else {
            'X'
        };

        // First we simulate the first circuit with the all zero/plus state generators
        self.sim(
            circuit_1,
            false,
            format!("Determining U{}U^{}... ", z_x_char, *DAG_CHAR),
        )?;

        // Then we simulate the inverse second circuit with the generators produced by the simulation
        // of the first circuit
        self.sim(
            circuit_2, 
            true,
            format!(
                "Determining V^{}(U{}U^{})V... ",
                *DAG_CHAR, z_x_char, *DAG_CHAR
            ),
        )?;

        Ok(self.generator_set
            .is_x_or_z_generators(check_zero_state_generators))
    }

    /// Performs a simulation based on the data currently stored in the 'sim_data' struct. These values should
    /// be initialized meaningfully by other functions, e.g. simulate or equivalence_check
    /// 'inverse' specifies whether to run the inverse of the circuit
    ///
    /// The simulation works by sequentially conjugating all the generators stored in the 'gen_cmpts' field of 'sim_data'
    /// with the gates in the circuit.
    fn sim(
        &mut self,
        circuit: &Circuit,
        inverse: bool,
        sim_msg: String,
    ) -> Result<(), Box<dyn Error>> {
        let mut stdout = stdout();
        let num_gates = circuit.len();

        if self.verbose {
            println!("Initial components:");
            println!("{}", self.generator_set);
        }

        let circ_iter = if inverse {
            circuit.rev()
        } else {
            circuit.iter()
        };

        for (i, gate) in circ_iter.enumerate() {
            if self.verbose {
                println!("Applied {}", gate);
            }


            self.generator_set.conjugate(gate, inverse)?;

            if self.verbose {
                println!("{}", self.generator_set);
            } else {
                print!(
                    "\r{}{}% -- {} components ",
                    sim_msg,
                    (i as f64 / num_gates as f64 * 100.0) as usize,
                    self.generator_set.size(),
                );
                stdout.flush().unwrap();
            }
        }

        if !self.verbose {
            println!(
                "\r{}100% -- {} components",
                sim_msg,
                self.generator_set.size()
            );
        }

        Ok(())
    }
}

#[derive(Debug, Snafu)]
enum SimulationError {
    #[snafu(display(
        "Cannot check equivalence between circuits with different number of qubits: {} and {}",
        n_qubits_c1,
        n_qubits_c2
    ))]
    DifferentSizedCiruicuits { n_qubits_c1: usize, n_qubits_c2: usize },

    #[snafu(display(
        "Invalid generator set type: {}", gst))]
    InvalidGeneratorSetType { gst: String },
}
