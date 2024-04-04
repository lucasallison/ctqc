use log::debug;
use serde_json::json;
use snafu::prelude::*;
use std::error::Error;
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

        let progress_bar = OptionalProgressBar::new(self.progress_bar, circuit.len() as u64);

        self.conjugate_circuit_gates(&mut generator_set, circuit, false, &progress_bar);

        progress_bar.finish();

        let mut measurement_sampler = generator_set.get_measurement_sampler();
        println!(
            "{}",
            self.sim_res_json(circuit, start, &mut measurement_sampler)
        );
    }

    fn sim_res_json(
        &self,
        circuit: &Circuit,
        start: Instant,
        sampler: &mut MeasurementSampler,
    ) -> String {
        let mut measurement_samples = Vec::with_capacity(circuit.n_qubits());
        for qubit in circuit.measurements().iter() {
            let qubit_str = format!("qubit {}", qubit);
            let (measurement, p0) = sampler.sample(*qubit);
            measurement_samples.push((qubit_str, measurement, p0));
        }

        json!({
            "simulation_type": "simulation",
            "circuit": circuit.name(),
            "runtime": {
                "nano_seconds": start.elapsed().as_nanos(),
                "seconds": start.elapsed().as_secs(),
                "minutes": start.elapsed().as_secs() / 60
            },
            "measurements": measurement_samples
        })
        .to_string()
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
    ) -> Result<(), Box<dyn Error>> {
        if circuit_1.n_qubits() != circuit_2.n_qubits() {
            return Err(SimulationError::DifferentSizedCiruicuits {
                n_qubits_c1: circuit_1.n_qubits(),
                n_qubits_c2: circuit_2.n_qubits(),
            }
            .into());
        }

        let now = Instant::now();

        let equiv = if all_generators_at_once {
            self.equiv_all_generators_at_once(circuit_1, circuit_2, true)
        } else {
            self.equiv_per_generator(circuit_1, circuit_2, true)
        };
        if !equiv {
            println!("{}", self.equiv_res_json(equiv, circuit_1, circuit_2, now));
            return Ok(());
        }

        let equiv = if all_generators_at_once {
            self.equiv_all_generators_at_once(circuit_1, circuit_2, false)
        } else {
            self.equiv_per_generator(circuit_1, circuit_2, false)
        };

        println!("{}", self.equiv_res_json(equiv, circuit_1, circuit_2, now));
        Ok(())
    }

    fn equiv_res_json(
        &self,
        equiv: bool,
        circuit_1: &Circuit,
        circuit_2: &Circuit,
        start: Instant,
    ) -> String {
        json!({
            "simulation_type": "equivalence",
            "circuits": [circuit_1.name(), circuit_2.name()],
            "equivalent": equiv,
            "runtime": {
                "nano_seconds": start.elapsed().as_nanos(),
                "seconds": start.elapsed().as_secs(),
                "minutes": start.elapsed().as_secs() / 60
            }
        })
        .to_string()
    }

    fn progress_bar_for_equiv_check(
        &self,
        n_gates: usize,
        check_zero_state_generators: bool,
    ) -> OptionalProgressBar {
        let progress_bar =
            OptionalProgressBar::new(self.progress_bar, n_gates as u64);

        let pg_prepend = format!(
            "Simulating V^{}(U{}U^{})V -- ",
            *DAG_CHAR,
            z_x_print_char(check_zero_state_generators),
            *DAG_CHAR
        );

        progress_bar.prepend_to_style(&pg_prepend);
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
        
        let progress_bar =
            self.progress_bar_for_equiv_check(circuit_1.len()+circuit_2.len(), check_zero_state_generators);

        // First we simulate the first circuit with the all zero/plus state generators
        self.conjugate_circuit_gates(&mut generator_set, circuit_1, false, &progress_bar);

        // Then we simulate the inverse second circuit with the generators produced by the simulation
        // of the first circuit
        self.conjugate_circuit_gates(&mut generator_set, circuit_2, true, &progress_bar);

        progress_bar.finish();

        generator_set.is_x_or_z_generators(check_zero_state_generators)
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
        let mut generator_set =
            get_generator_set(&self.generator_set, circuit_1.n_qubits(), self.threads);

        let progress_bar =
            self.progress_bar_for_equiv_check(circuit_1.n_qubits()*(circuit_1.len()+circuit_2.len()), check_zero_state_generators);

        for i in 0..circuit_1.n_qubits() {
            generator_set.init_single_generator(i, check_zero_state_generators);

            // Conjugate gates of U
            self.conjugate_circuit_gates(&mut generator_set, circuit_1, false, &progress_bar);

            // Conjugate gates of V^†
            self.conjugate_circuit_gates(&mut generator_set, circuit_2, true, &progress_bar);

            if !generator_set.is_single_x_or_z_generator(check_zero_state_generators, i) {
                return false;
            }
        }

        progress_bar.finish();
        true
    }

    /// Sequentially conjugates the generator set with each gate in the provided circuit.
    fn conjugate_circuit_gates(
        &mut self,
        generator_set: &mut Box<dyn GeneratorSet>,
        circuit: &Circuit,
        inverse: bool,
        progress_bar: &OptionalProgressBar,
    ) {
        debug!("Initial generator set:");
        debug!("{}", generator_set);

        for (i, gate) in circuit.iter(inverse).enumerate() {
            // Clean the generator set every `self.conjugations_before_clean` gates, if the value is not 0
            if self.conjugations_before_clean != 0
                && i != 0
                && i % self.conjugations_before_clean == 0
            {
                generator_set.clean();
            }

            generator_set.conjugate(gate, inverse);

            progress_bar.set_message(format!("{} pauli string(s)", generator_set.size()));
            progress_bar.inc(1);

            debug!("\nApplied [{}]. Generator set:", gate);
            debug!("{}", generator_set);
        }

        generator_set.clean();

        progress_bar.set_message(format!("{} pauli string(s)", generator_set.size()));

        debug!("\nFinal generator set:");
        debug!("{}", generator_set);
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
