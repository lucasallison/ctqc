use lazy_static::lazy_static;
use snafu::prelude::*;
use std::error::Error;
use std::io::{stdout, Write};

mod component;
mod conjugation_look_up_tables;
mod generators;
mod pauli_string;

use crate::circuit::Circuit;
use generators::GeneratorComponents;
use generators::Stats;

lazy_static! {
    static ref DAG_CHAR: char = std::char::from_u32(8224).unwrap();
}

/// Holds all the data for simulations/equivalence checks. Initialized and
/// used by the Simulator struct.
/// circuit: contains the circuit to simulate.
/// gen_cmpts: keeps track of the generators of the stabilizers of the state and provides an interface for conjugating them.
/// stats: keeps track of various statistics during the simulation.
/// verbose: print verbose output.
struct SimData<'a> {
    circuit: &'a Circuit,
    gen_cmpts: GeneratorComponents,
    stats: Stats,
    verbose: bool,
}

/// Executes the simulation/equivalence check
pub struct Simulator {}

impl Simulator {
    pub fn new() -> Simulator {
        Simulator {}
    }

    /// Simulates the provided ciricuit by setting the generators to the generators of the all zero state
    /// and calling the 'sim' function.
    pub fn simulate(&self, circuit: &Circuit, verbose: bool) -> Result<(), Box<dyn Error>> {
        let mut sim_data = SimData {
            circuit: circuit,
            gen_cmpts: GeneratorComponents::new(circuit.num_qubits(), false),
            stats: Stats::new(),
            verbose: verbose,
        };

        self.sim(&mut sim_data, false, String::from("Simulating... "))
    }

    /// Returns true if the two circuits, U and V, are equivalent, false otherwise. It does so by
    /// simulating the circuit UV^† twice, once for the all zero state generators, once for the all plus stat generators.
    /// If, in both cases, the generators produced by the simulation are the generators we started with, we know
    /// the circuits are equivalent.
    pub fn equivalence_check(
        &self,
        circuit_1: &Circuit,
        circuit_2: &Circuit,
        verbose: bool,
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

        let equiv = self.equiv(circuit_1, circuit_2, true, verbose)?;
        if !equiv {
            println!("Circuits are not equivalent: V(UZU^{})^{} does not yield the generators for the all zero state", *DAG_CHAR, *DAG_CHAR);
            return Ok(());
        }

        let equiv = self.equiv(circuit_1, circuit_2, false, verbose)?;
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
        &self,
        circuit_1: &Circuit,
        circuit_2: &Circuit,
        check_zero_state_generators: bool,
        verbose: bool,
    ) -> Result<bool, Box<dyn Error>> {
        let mut sim_data = SimData {
            circuit: circuit_1,
            gen_cmpts: GeneratorComponents::new(
                circuit_1.num_qubits(),
                check_zero_state_generators,
            ),
            stats: Stats::new(),
            verbose: verbose,
        };

        let z_x_char = if check_zero_state_generators {
            'Z'
        } else {
            'X'
        };

        // First we simulate the first circuit with the all zero/plus state generators
        self.sim(
            &mut sim_data,
            false,
            format!("Determining U{}U^{}... ", z_x_char, *DAG_CHAR),
        )?;

        // Then we simulate the inverse second circuit with the generators produced by the simulation
        // of the first circuit
        sim_data.circuit = circuit_2;
        self.sim(
            &mut sim_data,
            true,
            format!(
                "Determining V(U{}U^{})^{}... ",
                z_x_char, *DAG_CHAR, *DAG_CHAR
            ),
        )?;

        Ok(sim_data
            .gen_cmpts
            .is_x_or_z_generators(check_zero_state_generators))
    }

    /// Performs a simulation based on the data currently stored in the 'sim_data' struct. These values should
    /// be initialized meaningfully by other functions, e.g. simulate or equivalence_check
    /// 'inverse' specifies whether to run the inverse of the circuit
    ///
    /// The simulation works by sequentially conjugating all the generators stored in the 'gen_cmpts' field of 'sim_data'
    /// with the gates in the circuit.
    fn sim(
        &self,
        sim_data: &mut SimData,
        inverse: bool,
        sim_msg: String,
    ) -> Result<(), Box<dyn Error>> {
        let mut stdout = stdout();
        let num_gates = sim_data.circuit.len();

        if sim_data.verbose {
            println!("Initial components:");
            println!("{}", sim_data.gen_cmpts);
        }

        let circ_iter = if inverse {
            sim_data.circuit.rev()
        } else {
            sim_data.circuit.iter()
        };

        for (i, gate) in circ_iter.enumerate() {
            if sim_data.verbose {
                println!("Applied {}", gate);
            }

            sim_data
                .gen_cmpts
                .conjugate(gate, &mut sim_data.stats, inverse)?;

            if sim_data.verbose {
                println!("{}", sim_data.gen_cmpts);
            } else {
                print!(
                    "\r{}{}% -- {} components {} merges",
                    sim_msg,
                    (i as f64 / num_gates as f64 * 100.0) as u32,
                    sim_data.gen_cmpts.len(),
                    sim_data.stats.num_merges
                );
                stdout.flush().unwrap();
            }
        }

        if !sim_data.verbose {
            println!(
                "\r{}100% -- {} components {} merges",
                sim_msg,
                sim_data.gen_cmpts.len(),
                sim_data.stats.num_merges
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
    DifferentSizedCiruicuits { n_qubits_c1: u32, n_qubits_c2: u32 },
}
