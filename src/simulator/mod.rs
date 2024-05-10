use log::debug;
use rayon::prelude::*;
use serde_json::json;
use std::time::Instant;

use crate::circuit::Circuit;
use crate::generator_sets::measurement_sampler::MeasurementSampler;
use crate::generator_sets::{get_generator_set, GeneratorSet, GeneratorSetImplementation};

mod utils;
use utils::optional_progress_bar::OptionalProgressBar;
use utils::{z_x_print_char, DAG_CHAR};

/// Executes the simulation/equivalence check
pub struct Simulator {
    generator_set: GeneratorSetImplementation,
    /// Number of gates are we going to conjugate before cleaning
    /// the generator set
    conjugations_before_clean: usize,
    /// Number of threads that the generator set will use
    threads: usize,
    /// Print progress bar to the terminal
    progress_bar: bool,
}

impl Simulator {
    pub fn new(
        generator_set: String,
        conjugations_before_clean: usize,
        threads: usize,
        progress_bar: bool,
    ) -> Self {
        let gs = GeneratorSetImplementation::from_string(&generator_set);
        Simulator {
            generator_set: gs,
            conjugations_before_clean,
            threads,
            progress_bar,
        }
    }

    /// Simulates the provided ciricuit by setting the generators to the generators of the all zero state
    /// and calling the 'sim' function.
    pub fn simulate(&mut self, circuit: &Circuit) {
        let start = Instant::now();

        let mut generator_set =
            get_generator_set(&self.generator_set, circuit.n_qubits(), self.threads);
        generator_set.init_generators(true);

        let progress_bar = OptionalProgressBar::new(self.progress_bar, circuit.len() as u64, &Self::pb_style("Conjugating gates", "gates"));

        Self::conjugate_circuit_gates(
            &mut generator_set,
            circuit,
            false,
            &progress_bar,
            self.conjugations_before_clean,
        );

        progress_bar.finish();

        let mut measurement_sampler = generator_set.get_measurement_sampler();
        println!(
            "{}",
            self.sim_res_json(circuit, start, &mut measurement_sampler)
        );
    }

    /// Obtains the sampled measurements and returns the results as a JSON string.
    fn sim_res_json(
        &self,
        circuit: &Circuit,
        start: Instant,
        sampler: &mut MeasurementSampler,
    ) -> String {

        let progress_bar =
            OptionalProgressBar::new(self.progress_bar, circuit.measurements().len() as u64, &Self::pb_style("Sampling Measurements", "qubits"));

        let mut measurement_samples = Vec::with_capacity(circuit.n_qubits());
        for qubit in circuit.measurements().iter() {
            progress_bar.set_message(format!("{} pauli string(s)", sampler.size()));

            let (measurement, p0) = sampler.sample(*qubit);
            let sample = json!({
                "qubit": qubit,
                "measurement": measurement as i32,
                "p0": p0
            });
            measurement_samples.push(sample);

            progress_bar.inc(1);
        }

        progress_bar.finish();

        let res = json!({
            "simulation_type": "simulation",
            "circuit": circuit.name(),
            "runtime": {
                "nano_seconds": start.elapsed().as_nanos(),
                "mili_seconds": start.elapsed().as_millis(),
                "seconds": start.elapsed().as_secs(),
                "minutes": start.elapsed().as_secs() / 60
            },
            "measurements": measurement_samples
        });
        serde_json::to_string_pretty(&res).unwrap()
    }

    /// Returns true if the two circuits, U and V, are equivalent, false otherwise. It does so by
    /// conjugating the circuit with UV^† twice, once for the all zero state generators, once for the all plus state generators.
    /// If, in both cases, the generators produced by the conjugations are the generators we started with, we know
    /// the circuits are equivalent.
    pub fn equivalence_check(
        &mut self,
        circuit_1: &Circuit,
        circuit_2: &Circuit,
        all_generators_at_once: bool,
    ) {
        if circuit_1.n_qubits() != circuit_2.n_qubits() {
            eprintln!("Cannot check equivalence between circuits with different number of qubits: {} and {}", circuit_1.n_qubits(), circuit_2.n_qubits());
            std::process::exit(1);
        }

        let now = Instant::now();

        let equiv = if all_generators_at_once {
            self.equiv_all_generators_at_once(circuit_1, circuit_2, true)
        } else {
            self.equiv_per_generator(circuit_1, circuit_2, true)
        };

        // We already know they are not equivalent, return
        if !equiv {
            println!("{}", self.equiv_res_json(equiv, circuit_1, circuit_2, now));
            return;
        }

        let equiv = if all_generators_at_once {
            self.equiv_all_generators_at_once(circuit_1, circuit_2, false)
        } else {
            self.equiv_per_generator(circuit_1, circuit_2, false)
        };

        println!("{}", self.equiv_res_json(equiv, circuit_1, circuit_2, now));
    }

    /// Returns the result of the equivalence check as a JSON string.
    fn equiv_res_json(
        &self,
        equiv: bool,
        circuit_1: &Circuit,
        circuit_2: &Circuit,
        start: Instant,
    ) -> String {
        let res = json!({
            "simulation_type": "equivalence",
            "circuits": [circuit_1.name(), circuit_2.name()],
            "equivalent": equiv,
            "runtime": {
                "nano_seconds": start.elapsed().as_nanos(),
                "mili_seconds": start.elapsed().as_millis(),
                "seconds": start.elapsed().as_secs(),
                "minutes": start.elapsed().as_secs() / 60
            }
        });
        serde_json::to_string_pretty(&res).unwrap()
    }

    fn progress_bar_for_equiv_check(
        &self,
        n_progress_items: usize,
        progress_items: &str,
        check_zero_state_generators: bool,
    ) -> OptionalProgressBar {

        let prefix = format!(
            "Simulating V^{}(U{}U^{})V",
            *DAG_CHAR,
            z_x_print_char(check_zero_state_generators),
            *DAG_CHAR
        );

        let progress_bar = OptionalProgressBar::new(self.progress_bar, n_progress_items as u64, &Self::pb_style(&prefix, progress_items));

        progress_bar
    }

    /// Given two circuits U and V the equiv fuction simulates the circuit UV^† and checks whether
    /// the resulting generators are the generators for the all zero state or the all plus state.
    fn equiv_all_generators_at_once(
        &mut self,
        circuit_1: &Circuit,
        circuit_2: &Circuit,
        check_zero_state_generators: bool,
    ) -> bool {
        let mut generator_set =
            get_generator_set(&self.generator_set, circuit_1.n_qubits(), self.threads);
        generator_set.init_generators(check_zero_state_generators);

        let progress_bar = self.progress_bar_for_equiv_check(
            circuit_1.len() + circuit_2.len(),
            "gates",
            check_zero_state_generators,
        );

        // Self::alternate_conjugations(&mut generator_set, circuit_1, circuit_2, &progress_bar, self.conjugations_before_clean);

        // First we simulate the first circuit with the all zero/plus state generators
        Self::conjugate_circuit_gates(
            &mut generator_set,
            circuit_1,
            false,
            &progress_bar,
            self.conjugations_before_clean,
        );

        // Then we simulate the inverse second circuit with the generators produced by the simulation
        // of the first circuit
        Self::conjugate_circuit_gates(
            &mut generator_set,
            circuit_2,
            true,
            &progress_bar,
            self.conjugations_before_clean,
        );

        progress_bar.finish();

        generator_set.is_x_or_z_generators(check_zero_state_generators)
    }

    /// Conjugates the gates of the circuit UV^† iteratively to all the generators of the all
    /// zero and all plus state. After having conjugated all the gates it checks whether the generator
    /// it started with has remained unchanged.
    pub fn equiv_per_generator(
        &mut self,
        circuit_1: &Circuit,
        circuit_2: &Circuit,
        check_zero_state_generators: bool,
    ) -> bool {

        let progress_bar = self.progress_bar_for_equiv_check(circuit_1.n_qubits() * (circuit_1.len() + circuit_2.len()), "gates", check_zero_state_generators);

        let res = (0..circuit_1.n_qubits()).into_par_iter().all(|i| {

            let mut generator_set =
                get_generator_set(&self.generator_set, circuit_1.n_qubits(), 1);

            generator_set.init_single_generator(i, check_zero_state_generators);


            // Self::alternate_conjugations(&mut generator_set, circuit_1, circuit_2, &progress_bar, self.conjugations_before_clean);

            // Conjugate gates of U
            Self::conjugate_circuit_gates(
                &mut generator_set,
                circuit_1,
                false,
                &progress_bar,
                self.conjugations_before_clean,
            );

            // Conjugate gates of V^†
            Self::conjugate_circuit_gates(
                &mut generator_set,
                circuit_2,
                true,
                &progress_bar,
                self.conjugations_before_clean,
            );

            // We want to check if any of the simulations does NOT yield the generator we started with
            generator_set.is_single_x_or_z_generator(check_zero_state_generators, i)
        });

        progress_bar.finish();

        res
    }

    /// Sequentially conjugates the generator set with each gate in the provided circuit.
    fn conjugate_circuit_gates(
        generator_set: &mut Box<dyn GeneratorSet>,
        circuit: &Circuit,
        inverse: bool,
        progress_bar: &OptionalProgressBar,
        conjugations_before_clean: usize,
    ) {
        debug!("Initial generator set:\n{}", generator_set);

        for (i, gate) in circuit.iter(inverse).enumerate() {
            // Clean the generator set every `self.conjugations_before_clean` gates, if the value is not 0
            if conjugations_before_clean != 0 && i != 0 && i % conjugations_before_clean == 0 {
                generator_set.clean();
            }

            generator_set.conjugate(gate, inverse);

            progress_bar.set_message(format!("{} pauli string(s)", generator_set.size()));
            progress_bar.inc(1);

            debug!("\nApplied [{}]. Generator set:\n{}", gate, generator_set);
        }

        generator_set.clean();

        progress_bar.set_message(format!("{} pauli string(s)", generator_set.size()));

        debug!("\nFinal generator set:\n{}", generator_set);
    }

    /// Sequentially conjugates the generator set with each gate in the provided circuit.
    fn alternate_conjugations(
        generator_set: &mut Box<dyn GeneratorSet>,
        circuit_1: &Circuit,
        circuit_2: &Circuit,
        progress_bar: &OptionalProgressBar,
        conjugations_before_clean: usize,
    ) {
        debug!("Initial generator set:\n{}", generator_set);

        let mut circ_1_iter = circuit_1.iter(false).peekable();
        let mut circ_2_iter = circuit_2.iter(true).peekable();

        let mut i = 0;
        while circ_1_iter.peek().is_some() && circ_2_iter.peek().is_some() {
            let (gate_1, gate_2) = (circ_1_iter.next().unwrap(), circ_2_iter.next().unwrap());

            if conjugations_before_clean != 0 && i != 0 && i % conjugations_before_clean == 0 {
                generator_set.clean();
            }

            generator_set.conjugate(gate_1, false);
            generator_set.conjugate(gate_2, true);

            progress_bar.set_message(format!("{} pauli string(s)", generator_set.size()));
            progress_bar.inc(1);

            debug!("\nApplied [{}]. Generator set:\n{}", gate_1, generator_set);
            debug!("\nApplied [{}]. Generator set:\n{}", gate_2, generator_set);
            i += 1;
        }

        // TODO refactor
        for gate in circ_1_iter {
            if conjugations_before_clean != 0 && i != 0 && i % conjugations_before_clean == 0 {
                generator_set.clean();
            }

            generator_set.conjugate(gate, false);

            progress_bar.set_message(format!("{} pauli string(s)", generator_set.size()));
            progress_bar.inc(1);

            debug!("\nApplied [{}]. Generator set:\n{}", gate, generator_set);
            i += 1;
        }

        for gate in circ_2_iter {
            if conjugations_before_clean != 0 && i != 0 && i % conjugations_before_clean == 0 {
                generator_set.clean();
            }

            generator_set.conjugate(gate, false);

            progress_bar.set_message(format!("{} pauli string(s)", generator_set.size()));
            progress_bar.inc(1);

            debug!("\nApplied [{}]. Generator set:\n{}", gate, generator_set);
            i += 1;
        }

        generator_set.clean();

        progress_bar.set_message(format!("{} pauli string(s)", generator_set.size()));

        debug!("\nFinal generator set B:\n{}", generator_set);
    }

    fn pb_style(prefix: &str, progress_items: &str) -> String {
      prefix.to_owned() + " -- [{elapsed_precise}] {bar:40.green/red} {pos}/{len} " + progress_items + " ({percent}%) -- {msg}"
    }

    
}
