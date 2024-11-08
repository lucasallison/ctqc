use bitvec::prelude::*;
use fxhash::FxBuildHasher;
use log::debug;
use rand::prelude::*;
use rayon::prelude::*;
use serde_json::json;
use std::collections::{HashMap, HashSet};
use std::time::Instant;

use crate::circuit::Circuit;
use crate::generator_sets::pauli_map::PauliMap;
use crate::generator_sets::pauli_string::utils as PauliUtils;
use crate::generator_sets::pauli_string::PauliGate;
use crate::generator_sets::pauli_string::PauliString;
use crate::generator_sets::shared::coefficient_list::CoefficientList;
use crate::generator_sets::shared::floating_point_opc::FloatingPointOPC;
use crate::generator_sets::{get_generator_set, GeneratorSet, GeneratorSetImplementation};

mod utils;
use utils::optional_progress_bar::OptionalProgressBar;
use utils::{
    half_all_coefficients, insert_into_map, merge_maps, sum_coef_zi_pstrs, z_x_print_char, DAG_CHAR,
};

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

    /// Applicable if we are simulating using
    /// the Pauli trees datastructure
    node_body_bits: Option<usize>,
    pgates_per_leaf: Option<usize>,
}

impl Simulator {
    pub fn new(
        generator_set: String,
        conjugations_before_clean: usize,
        threads: usize,
        progress_bar: bool,
        node_body_bits: Option<usize>,
        pgates_per_leaf: Option<usize>,
    ) -> Self {
        let gs = GeneratorSetImplementation::from_string(&generator_set);
        Simulator {
            generator_set: gs,
            conjugations_before_clean,
            threads,
            progress_bar,
            node_body_bits,
            pgates_per_leaf,
        }
    }

    //*********** Circuit Equivalence Verification ************//

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

    /// Given two circuits U and V the equiv fuction simulates the circuit UV^† and checks whether
    /// the resulting generators are the generators for the all zero state or the all plus state.
    fn equiv_all_generators_at_once(
        &mut self,
        circuit_1: &Circuit,
        circuit_2: &Circuit,
        check_zero_state_generators: bool,
    ) -> bool {
        let mut generator_set = get_generator_set(
            &self.generator_set,
            circuit_1.n_qubits(),
            self.threads,
            self.node_body_bits,
            self.pgates_per_leaf,
        );
        generator_set.init_generators(check_zero_state_generators);

        let progress_bar = self.progress_bar_for_equiv_check(
            circuit_1.len() + circuit_2.len(),
            "gates",
            check_zero_state_generators,
        );

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
        let progress_bar = self.progress_bar_for_equiv_check(
            circuit_1.n_qubits() * (circuit_1.len() + circuit_2.len()),
            "gates",
            check_zero_state_generators,
        );

        let res = (0..circuit_1.n_qubits()).into_par_iter().all(|i| {
            let mut generator_set = get_generator_set(
                &self.generator_set,
                circuit_1.n_qubits(),
                1,
                self.node_body_bits,
                self.pgates_per_leaf,
            );

            generator_set.init_single_generator(i, check_zero_state_generators);

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
            "runtime_as_secs": start.elapsed().as_secs_f64(),
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

        let progress_bar = OptionalProgressBar::new(
            self.progress_bar,
            n_progress_items as u64,
            &Self::pb_style(&prefix, progress_items),
        );

        progress_bar
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
            if !circuit.clifford() && conjugations_before_clean != 0 && i != 0 && i % conjugations_before_clean == 0 {
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

    fn pb_style(prefix: &str, progress_items: &str) -> String {
        prefix.to_owned()
            + " -- [{elapsed_precise}] {bar:40.green/red} {pos}/{len} "
            + progress_items
            + " ({percent}%) -- {msg}"
    }
    //*********** Circuit Simulation ************//

    /// Simulates the provided circuit by conjugating the Pauli stabilizer generators of the
    /// all-zero state with the gates of the circuit and subsequently sampling the measurements
    pub fn simulate_with_sampler(&mut self, circuit: &Circuit) {
        let start = Instant::now();

        // Initialize the generator set with the generators of the all zero state
        let mut generator_set = get_generator_set(
            &self.generator_set,
            circuit.n_qubits(),
            self.threads,
            self.node_body_bits,
            self.pgates_per_leaf,
        );
        generator_set.init_generators(true);

        let progress_bar = OptionalProgressBar::new(
            self.progress_bar,
            circuit.len() as u64,
            &Self::pb_style("Conjugating gates", "gates"),
        );

        // Conjugate the generators with the gates of the circuit
        Self::conjugate_circuit_gates(
            &mut generator_set,
            circuit,
            false,
            &progress_bar,
            self.conjugations_before_clean,
        );

        progress_bar.finish();

        // Obtain the measurement sampler
        let mut measurement_sampler = generator_set.get_measurement_sampler();

        let progress_bar = OptionalProgressBar::new(
            self.progress_bar,
            circuit.measurements().len() as u64,
            &Self::pb_style("Sampling Measurements", "qubits"),
        );

        let mut measurement_samples = Vec::with_capacity(circuit.n_qubits());
        for qubit in circuit.measurements().iter() {
            progress_bar.set_message(format!("{} pauli string(s)", measurement_sampler.size()));

            let (measurement, p0) = measurement_sampler.sample(*qubit);
            let sample = json!({
                "qubit": qubit,
                "measurement": measurement as i32,
                "p0": p0
            });
            measurement_samples.push(sample);

            progress_bar.inc(1);
        }

        progress_bar.finish();

        Self::print_sim_result_json(start, circuit, measurement_samples);
    }

    /// Obtains a start-of-time observable that will give the probability of measuring |0> for the qubit by
    /// conjugating the current-time observable with the inverse of the circuit.
    pub fn simulate_backwards(&mut self, circuit: &Circuit) {
        let start = Instant::now();

        let qubits_to_measure = circuit.measurements();

        // We will keep track of multiple maps to efficiently store the observable used to simulate measurements:
        // 1. Represents the observable used for a measurement at the end of the circuit, or "current-time" observable.
        //    The observable will be constructed in such a way that it captures the previous measurements results.
        //    In each iteration we tensor the observable with 0.5(I + Z_i) and with 0.5(I - Z_i) to obtain two observables which will gives us the
        //    unnormalized probability of measuring |0> and |1> for the ith qubit. We keep the observable that corresponds to the measurement result,
        //    so the result of the measurement is fixed in the observable.
        // 2. As we expand the current observable to capture previous measurement results we do not want to conjugate the summands we have already conjugated.
        //    Therefore, we keep use a map to conjugated the unconjugated summand of the observable.
        // 3. The start-of-time observable contains the current-time observable conjugated with the inverse of circuit. From this observable we can easily obtain the
        //    probability of measuring |0> and |1> for the ith qubit by summing the coefficients of the summands that consist of exclusively I and Z matrices.

        // The first measurement is simulated with the observable 0.5(I + Z_0)
        let mut current_time_observable =
            Self::get_single_qubit_observable(circuit.n_qubits(), qubits_to_measure[0]);

        // None of the summands are conjugated
        let mut unconjugated_observable_summands = current_time_observable.clone();

        let mut start_of_time_observable =
            HashMap::with_capacity_and_hasher(circuit.len(), FxBuildHasher::default());

        // Save measurement results
        let mut measurement_results = Vec::with_capacity(circuit.n_qubits());

        for qubit in qubits_to_measure {
            // Convert the unconjugated summands to a PauliMap to perform conjugations
            let mut unconjugated_observable_summands_pmap =
                PauliMap::from_map(unconjugated_observable_summands, circuit.n_qubits());

            let progress_bar = OptionalProgressBar::new(
                self.progress_bar,
                circuit.len() as u64,
                &Self::pb_style(&format!("Qubit {}", qubit), "gates"),
            );

            Self::conjugate_rev_circuit(
                &mut unconjugated_observable_summands_pmap,
                circuit,
                &progress_bar,
                self.conjugations_before_clean,
            );

            unconjugated_observable_summands_pmap.apply_all_h_s_conjugations();

            progress_bar.finish();

            // Merge the newly conjugated summands with the already conjugated summands, thereby obtaining the complete start-of-time observable
            // for measuring |0> for the qubit
            merge_maps(
                &mut start_of_time_observable,
                &mut unconjugated_observable_summands_pmap.take_pstr_map(),
            );

            // From the start-of-time observable and the current-time observable, which are inteded to measure |0>, we can obtain the observable that will
            // give us the probability of measuring |1> for the qubit. This is because the observable only differs a minus sign in the Z_qubit term.
            // Where this minus sign needs to appear in the start-of-time observable can be derived from the current-time observable.
            let mut start_of_time_observable_p1 = start_of_time_observable.clone();
            Self::get_plus_one_observable(
                &mut start_of_time_observable_p1,
                &current_time_observable,
                qubit,
            );

            // Determine the unnormalized probability of measuring |0> and |1> for the qubit
            let p0 = sum_coef_zi_pstrs(&start_of_time_observable);
            let p1 = sum_coef_zi_pstrs(&start_of_time_observable_p1);

            let measurement = Self::select_measurement(&[p0, p1]);

            measurement_results.push(json!({
                "qubit": qubit,
                "measurement": measurement,
                "p0": p0 / (p0 + p1)
            }));

            // Keep the start-of-time observable that corresponds to the measurement result and update the current-time observable
            if measurement == 1 {
                std::mem::swap(
                    &mut start_of_time_observable,
                    &mut start_of_time_observable_p1,
                );

                let mut updated_current_time_observable = current_time_observable.clone();
                Self::get_plus_one_observable(
                    &mut updated_current_time_observable,
                    &current_time_observable,
                    qubit,
                );
                std::mem::swap(
                    &mut current_time_observable,
                    &mut updated_current_time_observable,
                );
            }

            if qubit + 1 >= circuit.n_qubits() {
                break;
            }

            unconjugated_observable_summands =
                Self::expand_observable(&mut current_time_observable, qubit + 1);

            // We have tensored the current-time observable with 0.5(I +/- Z_i), so we should adjust the coefficients in the start-of-time observable
            // accordingly
            half_all_coefficients(&mut start_of_time_observable);
        }

        Self::print_sim_result_json(start, circuit, measurement_results);
    }

    /// Return the observable to measure |1> for the target qubit
    /// For each qubit we expand the current-time observable by tensoring it with 0.5(I + Z_i). However, if we want an observable that will give us the probability of measuring
    /// |0> we should have tensored the current-time observable with 0.5(I + Z_i). However, if we know which summands are tensored with Z_i in the current-time
    /// observable (which we can easily determine from the current-time observable, as this will be exaclty the summands whose ith matrix with are a Z matrix), we can simply
    /// multiply those conjugated summands with -1 in the start-of-time observable to obtain the start-of-time observable that will give us the probability of measuring |1>.
    fn get_plus_one_observable(
        start_of_time_observable: &mut HashMap<BitVec, CoefficientList, FxBuildHasher>,
        current_time_observable: &HashMap<BitVec, CoefficientList, FxBuildHasher>,
        target_qubit: usize,
    ) {
        let mut new_start_of_time_observable =
            HashMap::<BitVec, CoefficientList, FxBuildHasher>::with_capacity_and_hasher(
                start_of_time_observable.len(),
                FxBuildHasher::default(),
            );

        // Get the indices of the summands that contain that are tnesored with Z_i
        let summand_indices =
            Self::get_summand_indices_with_target_z(current_time_observable, target_qubit);

        for (pstr, mut coef_list) in start_of_time_observable.drain() {
            for (coef, val) in coef_list.coefficients.iter_mut() {
                if summand_indices.contains(coef) {
                    val.mul(&FloatingPointOPC::new(-1.0));
                }
            }

            insert_into_map(&mut new_start_of_time_observable, pstr, coef_list);
        }

        std::mem::swap(start_of_time_observable, &mut new_start_of_time_observable);
    }

    /// Expands the observable by "tensoring" the observable with 0.5(I + Z_i) for the ith qubit.
    /// The reason it is not a true tensor product is because if we know that if the observable is a tensor product of exclusively matrices of the form 0.5(I + Z_j)
    /// and we know we have not tensored the observable with the 0.5(I + Z_i) matrix before,
    /// we can simply copy all the summands of the provided observable, multiply them with Z_i, add them to the observable and adjust their coefficients.
    /// Since we will call this function once for each qubit and we know our observable is of the required form, we can "expand" the observable to mimic the tensor product.
    fn expand_observable(
        observable: &mut HashMap<BitVec, CoefficientList, FxBuildHasher>,
        target_qubit: usize,
    ) -> HashMap<BitVec, CoefficientList, FxBuildHasher> {
        let num_summands_observable = observable.len();

        // Create a map that will store the tensored observable
        let mut new_observable =
            HashMap::<BitVec, CoefficientList, FxBuildHasher>::with_capacity_and_hasher(
                2 * observable.len(),
                FxBuildHasher::default(),
            );

        // And a map that will store the summands that were added
        let mut added_summands = new_observable.clone();

        for (i, (pstr, mut coef_list)) in observable.drain().enumerate() {
            coef_list.multiply(&FloatingPointOPC::new(0.5));

            // Mimic the multiplication of the summand with Z_i
            let mut new_pstr = PauliString::from_bitvec(pstr.clone());
            new_pstr.set_pauli_gate(target_qubit, PauliGate::Z);

            let new_coef_list = CoefficientList::new_with_coef(
                num_summands_observable + i,
                coef_list.coefficients[0].1.as_f64(),
            );

            insert_into_map(
                &mut added_summands,
                new_pstr.as_bitslice().to_bitvec().clone(),
                new_coef_list.clone(),
            );

            // Added the summand and the summand multiplied with Z_i to the observable
            insert_into_map(
                &mut new_observable,
                new_pstr.as_bitslice().to_bitvec().clone(),
                new_coef_list.clone(),
            );
            insert_into_map(&mut new_observable, pstr, coef_list);
        }
        std::mem::swap(observable, &mut new_observable);
        added_summands
    }

    // Return the indices of each Pauli string summand that contains a Z matrix at the target_qubit
    fn get_summand_indices_with_target_z(
        observable: &HashMap<BitVec, CoefficientList, FxBuildHasher>,
        target_qubit: usize,
    ) -> HashSet<usize> {
        let mut summand_indices = HashSet::<usize>::with_capacity(observable.len());

        for (pstr, coef_list) in observable {
            if PauliUtils::get_pauli_gate_from_bitslice(pstr.as_bitslice(), target_qubit)
                == PauliGate::Z
            {
                for (i, _) in coef_list.coefficients.iter() {
                    summand_indices.insert(*i);
                }
            }
        }
        summand_indices
    }

    // Pick a measurement result based on the probabilities of measuring |0> and |1>
    fn select_measurement(probabilities: &[f64]) -> u8 {
        // Due to numerical instability we might get negative probabilities, we set them to 0
        // This should be fixed in the future, but as this approach is experimental it will suffice for now
        let probabilities: Vec<f64> = probabilities
            .iter()
            .map(|&p| if p < 0.0 { 0.0 } else { p })
            .collect();

        let total_weight: f64 = probabilities.iter().sum();

        // Can occur if we round the probabilities to 0
        if total_weight == 0.0 {
            return 0;
        }

        let p0 = probabilities[0] / total_weight;
        let mut rng = rand::thread_rng();
        let random_weight: f64 = rng.gen();

        if random_weight < p0 {
            return 0;
        }
        1
    }

    /// Return the observable for single qubit, i.e., 0.5(I + Z_{target_qubit})
    fn get_single_qubit_observable(
        n_qubits: usize,
        target_qubit: usize,
    ) -> HashMap<BitVec, CoefficientList, FxBuildHasher> {
        let mut observable: HashMap<BitVec, CoefficientList, FxBuildHasher> =
            HashMap::with_capacity_and_hasher(1, FxBuildHasher::default());

        let only_i_pstr = bitvec![0; 2*n_qubits];
        let mut single_z_pstr = bitvec![0; 2*n_qubits];
        PauliUtils::set_pauli_gate_in_bitslice(&mut single_z_pstr, PauliGate::Z, target_qubit);

        observable.insert(only_i_pstr, CoefficientList::new_with_coef(0, 0.5));
        observable.insert(single_z_pstr, CoefficientList::new_with_coef(1, 0.5));

        observable
    }

    /// Conjugate generators stored in the Pauli map with the reverse circuit
    fn conjugate_rev_circuit(
        generator_set: &mut PauliMap,
        circuit: &Circuit,
        progress_bar: &OptionalProgressBar,
        conjugations_before_clean: usize,
    ) {
        for (i, gate) in circuit.iter(true).enumerate() {
            // Clean the generator set every `self.conjugations_before_clean` gates, if the value is not 0
            if conjugations_before_clean != 0 && i != 0 && i % conjugations_before_clean == 0 {
                generator_set.clean();
            }

            generator_set.conjugate(gate, true);

            progress_bar.set_message(format!("{} pauli string(s)", generator_set.size()));
            progress_bar.inc(1);
        }

        generator_set.clean();
        progress_bar.set_message(format!("{} pauli string(s)", generator_set.size()));
    }

    fn print_sim_result_json(
        start: Instant,
        circuit: &Circuit,
        measurement_results: Vec<serde_json::Value>,
    ) {
        let res = json!({
            "simulation_type": "simulation",
            "circuit": circuit.name(),
            "runtime_as_secs": start.elapsed().as_secs_f64(),
            "measurements": measurement_results
        });

        println!("{}", serde_json::to_string_pretty(&res).unwrap())
    }
}
