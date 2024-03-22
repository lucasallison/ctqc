use indicatif::ProgressBar;
use indicatif::ProgressStyle;
use lazy_static::lazy_static;
use snafu::prelude::*;
use std::error::Error;

use crate::circuit::Circuit;
use crate::generator_sets::GeneratorSet;

lazy_static! {
    static ref DAG_CHAR: char = std::char::from_u32(8224).unwrap();
}

/// Executes the simulation/equivalence check
pub struct Simulator<'a> {
    generator_set: &'a mut dyn GeneratorSet,
    clean_cycles: usize,
    verbose: bool,
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
        }
    }

    /// Simulates the provided ciricuit by setting the generators to the generators of the all zero state
    /// and calling the 'sim' function.
    pub fn simulate(&mut self, circuit: &Circuit) {
        self.generator_set.init_generators(true);

        let progress_bar = ProgressBar::new(circuit.len() as u64);

        let progress_style_str =
            "[{elapsed_precise}] {bar:40.green/red} {pos:>4}/{len} gates ({percent}%) -- {msg}";
        progress_bar.set_style(ProgressStyle::with_template(&progress_style_str).unwrap());

        self.sim(circuit, false, &progress_bar);

        progress_bar.finish();

        if circuit.measurements().is_empty() {
            return;
        }

        println!("Sampling measurements...");

        let mut measurement_sampler = self.generator_set.get_measurement_sampler();

        for qubit in circuit.measurements().iter() {
            let (measurement, p0) = measurement_sampler.sample(*qubit);
            println!(
                "* Qubit {} -> {} (p0: {}, p1: {})",
                qubit,
                measurement as u8,
                p0,
                1.0 - p0
            );
        }
    }

    /// Returns true if the two circuits, U and V, are equivalent, false otherwise. It does so by
    /// simulating the circuit UV^† twice, once for the all zero state generators, once for the all plus stat generators.
    /// If, in both cases, the generators produced by the simulation are the generators we started with, we know
    /// the circuits are equivalent.
    pub fn equivalence_check(
        &mut self,
        circuit_1: &Circuit,
        circuit_2: &Circuit,
        all_generators_at_once: bool,
    ) -> Result<(), Box<dyn Error>> {
        if circuit_1.n_qubits() != circuit_2.n_qubits() {
            return Err(SimulationError::DifferentSizedCiruicuits {
                n_qubits_c1: circuit_1.n_qubits(),
                n_qubits_c2: circuit_2.n_qubits(),
            }
            .into());
        }

        println!(
            "Checking equivalence for circuits U = {} and V = {}",
            circuit_1.name(),
            circuit_2.name()
        );

        let equiv = if all_generators_at_once {
            self.equiv_all_generators_at_once(circuit_1, circuit_2, true)
        } else {
            self.equiv_per_generator(circuit_1, circuit_2, true)
        };
        if !equiv {
            println!("Circuits are not equivalent: V^{}(UZU^{})V does not yield the generators for the all zero state", *DAG_CHAR, *DAG_CHAR);
            return Ok(());
        }

        let equiv = if all_generators_at_once {
            self.equiv_all_generators_at_once(circuit_1, circuit_2, false)
        } else {
            self.equiv_per_generator(circuit_1, circuit_2, false)
        };
        if !equiv {
            println!("Circuits are not equivalent: V^{}(UXU^{})V does not yield the generators for the all plus state", *DAG_CHAR, *DAG_CHAR);
            return Ok(());
        }

        println!("\nCircuits are equivalent");
        Ok(())
    }

    /// Given two circuits U and V the equiv fuction simulates the circuit UV^† and checks whether
    /// the resulting generators are the generators for the all zero state or the all plus state.
    fn equiv_all_generators_at_once(
        &mut self,
        circuit_1: &Circuit,
        circuit_2: &Circuit,
        check_zero_state_generators: bool,
    ) -> bool {
        self.generator_set
            .init_generators(check_zero_state_generators);

        let z_x_char = if check_zero_state_generators {
            'Z'
        } else {
            'X'
        };

        let progress_bar = ProgressBar::new(2 * circuit_1.len() as u64);

        let mut progress_style_str = format!(
            "Simulating V^{}(U{}U^{})V -- ",
            *DAG_CHAR, z_x_char, *DAG_CHAR
        );

        progress_style_str.push_str(
            "[{elapsed_precise}] {bar:40.green/red} {pos:>4}/{len} gates ({percent}%) -- {msg}",
        );

        progress_bar.set_style(ProgressStyle::with_template(&progress_style_str).unwrap());

        // First we simulate the first circuit with the all zero/plus state generators
        self.sim(circuit_1, false, &progress_bar);

        // Then we simulate the inverse second circuit with the generators produced by the simulation
        // of the first circuit
        self.sim(circuit_2, true, &progress_bar);

        progress_bar.finish();

        self.generator_set
            .is_x_or_z_generators(check_zero_state_generators)
    }

    /// Conjugates the gates of the circuit UV^† iteratively to all the generators of the all
    /// zero and all plus state. After having conjugated all the gates it checks wheter the generator
    /// it started with has remained unchanged.
    pub fn equiv_per_generator(
        &mut self,
        circuit_1: &Circuit,
        circuit_2: &Circuit,
        check_zero_state_generators: bool,
    ) -> bool {
        let z_x_char = if check_zero_state_generators {
            'Z'
        } else {
            'X'
        };

        let progress_bar = ProgressBar::new((2 * circuit_1.len() * circuit_1.n_qubits()) as u64);

        let mut progress_style_str = format!(
            "Simulating V^{}(U{}U^{})V -- ",
            *DAG_CHAR, z_x_char, *DAG_CHAR
        );

        progress_style_str.push_str(
            "[{elapsed_precise}] {bar:40.green/red} {pos:>4}/{len} gates ({percent}%) -- {msg}",
        );

        progress_bar.set_style(ProgressStyle::with_template(&progress_style_str).unwrap());

        for i in 0..circuit_1.n_qubits() {
            self.generator_set
                .init_single_generator(i, check_zero_state_generators);

            // First simulate U
            self.sim(circuit_1, false, &progress_bar);

            // Then simulate V^†
            self.sim(circuit_2, true, &progress_bar);

            if !self
                .generator_set
                .is_single_x_or_z_generator(check_zero_state_generators, i)
            {
                return false;
            }
        }

        progress_bar.finish();
        true
    }

    /// Performs a simulation based on the data currently stored in the 'sim_data' struct. These values should
    /// be initialized meaningfully by other functions, e.g. simulate or equivalence_check
    /// 'inverse' specifies whether to run the inverse of the circuit
    ///
    /// The simulation works by sequentially conjugating all the generators stored in the 'gen_cmpts' field of 'sim_data'
    /// with the gates in the circuit.
    fn sim(&mut self, circuit: &Circuit, inverse: bool, progress_bar: &ProgressBar) {
        if self.verbose {
            println!("Initial generator set:");
            println!("{}", self.generator_set);
        }

        let circ_iter = if inverse {
            circuit.rev()
        } else {
            circuit.iter()
        };

        for (i, gate) in circ_iter.enumerate() {
            let progress_bar_msg = format!("{} pauli string(s)", self.generator_set.size());
            progress_bar.set_message(progress_bar_msg);

            if i != 0 && i % self.clean_cycles == 0 {
                self.generator_set.clean();
            }

            self.generator_set.conjugate(gate, inverse);

            progress_bar.inc(1);

            if self.verbose {
                println!("\nApplied [{}]. Generator set:", gate);
                println!("{}", self.generator_set);
            }
        }

        self.generator_set.clean();

        let progress_bar_msg = format!("{} pauli string(s)", self.generator_set.size());
        progress_bar.set_message(progress_bar_msg);

        if self.verbose {
            println!("\nFinal generator set:");
            println!("{}", self.generator_set);
        }
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
}
