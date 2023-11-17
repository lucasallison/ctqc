use lazy_static::lazy_static;
use snafu::prelude::*;
use std::error::Error;
use std::io::{stdout, Write};

use crate::circuit::Circuit;
use crate::circuit::GateType;
use crate::generator_set::GeneratorSet;

lazy_static! {
    static ref DAG_CHAR: char = std::char::from_u32(8224).unwrap();
}

/// Executes the simulation/equivalence check
pub struct Simulator<'a> {
    generator_set: &'a mut dyn GeneratorSet,
    clean_cycles: usize,
    verbose: bool,
    stdout: std::io::Stdout,
}

impl<'a> Simulator<'a> {
    pub fn new(
        generator_set: &'a mut dyn GeneratorSet,
        clean_cycles: usize,
        verbose: bool,
    ) -> Self {
        Simulator {
            generator_set,
            clean_cycles,
            verbose,
            stdout: stdout(),
        }
    }

    // Ensures the last wirtten line will not be overwritten
    fn end_overwrite(&mut self) {
        if !self.verbose {
            println!("");
        }
    }

    /// Simulates the provided ciricuit by setting the generators to the generators of the all zero state
    /// and calling the 'sim' function.
    pub fn simulate(&mut self, circuit: &Circuit) -> Result<(), Box<dyn Error>> {
        self.generator_set.init_generators(true);

        self.sim(circuit, false, &String::from("Simulating... "))?;

        self.end_overwrite();
        Ok(())
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
    // TODO see if we still use this
    fn _equiv_all_generators_at_once(
        &mut self,
        circuit_1: &Circuit,
        circuit_2: &Circuit,
        check_zero_state_generators: bool,
    ) -> Result<bool, Box<dyn Error>> {
        self.generator_set
            .init_generators(check_zero_state_generators);

        let z_x_char = if check_zero_state_generators {
            'Z'
        } else {
            'X'
        };

        // First we simulate the first circuit with the all zero/plus state generators
        self.sim(
            circuit_1,
            false,
            &format!("Determining U{}U^{}... ", z_x_char, *DAG_CHAR).to_string(),
        )?;

        // Then we simulate the inverse second circuit with the generators produced by the simulation
        // of the first circuit
        self.sim(
            circuit_2,
            true,
            &format!(
                "Determining V^{}(U{}U^{})V... ",
                *DAG_CHAR, z_x_char, *DAG_CHAR
            )
            .to_string(),
        )?;

        Ok(self
            .generator_set
            .is_x_or_z_generators(check_zero_state_generators))
    }

    /// Conjugates the gates of the circuit UV^† iteratively to all the generators of the all
    /// zero and all plus state. After having conjugated all the gates it checks wheter the generator
    /// it started with has remained unchanged.
    pub fn equiv(
        &mut self,
        circuit_1: &Circuit,
        circuit_2: &Circuit,
        check_zero_state_generators: bool,
    ) -> Result<bool, Box<dyn Error>> {
        let z_x_char = if check_zero_state_generators {
            'Z'
        } else {
            'X'
        };

        println!(
            "Simulating V^{}(U{}U^{})V...",
            *DAG_CHAR, z_x_char, *DAG_CHAR
        );

        for i in 0..circuit_1.num_qubits() {
            self.generator_set
                .init_single_generator(i, check_zero_state_generators);

            let progress_info = format!(
                "Generator {}/{} ({}%). ",
                i + 1,
                circuit_1.num_qubits(),
                ((i + 1) as f64 / circuit_1.num_qubits() as f64 * 100.0) as usize
            );

            // First simulate U
            self.sim(
                circuit_1,
                false,
                &format!("{progress_info}Conjugating U  -> ").to_string(),
            )?;

            // Then simulate V^†
            self.sim(
                circuit_2,
                true,
                &format!("{progress_info}Conjugating V{} -> ", *DAG_CHAR).to_string(),
            )?;

            if !self
                .generator_set
                .is_single_x_or_z_generator(check_zero_state_generators, i)
            {
                self.end_overwrite();
                return Ok(false);
            }
        }

        self.end_overwrite();
        Ok(true)
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
        sim_msg: &String,
    ) -> Result<(), Box<dyn Error>> {
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
            if i != 0 && i % self.clean_cycles == 0 {
                self.generator_set.clean();
            }

            if self.verbose {
                println!("Applied {}", gate);
            }

            match gate.gate_type {
                GateType::M => {
                    let (measurement, p0) = self.generator_set.measure(gate.qubit_1);
                    print!(
                        "\rMeasurment of qubit {} -> {} (p0: {}, p1: {})                      \n",
                        gate.qubit_1,
                        measurement as u8,
                        p0,
                        1.0 - p0
                    );
                }
                _ => {
                    self.generator_set.conjugate(gate, inverse)?;
                }
            }

            if self.verbose {
                println!("{}", self.generator_set);
            } else {
                print!(
                    "\r{}{}% ({}/{}) -- {} Pauli strings",
                    sim_msg,
                    (i as f64 / num_gates as f64 * 100.0) as usize,
                    i,
                    num_gates,
                    self.generator_set.size(),
                );
            }
            self.stdout.flush().unwrap();
        }

        self.generator_set.clean();

        if self.verbose {
            println!("Final components:");
            println!("{}", self.generator_set);
        } else {
            print!(
                "\r{}100% ({}/{}) -- {} Pauli strings              ",
                sim_msg,
                num_gates,
                num_gates,
                self.generator_set.size()
            );
        }
        self.stdout.flush().unwrap();

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
    DifferentSizedCiruicuits {
        n_qubits_c1: usize,
        n_qubits_c2: usize,
    },

    #[snafu(display("Invalid generator set type: {}", gst))]
    InvalidGeneratorSetType { gst: String },
}
