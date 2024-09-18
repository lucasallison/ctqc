use log::debug;
use rayon::prelude::*;
use serde_json::json;
use serde_json::map;
use std::borrow::BorrowMut;
use std::time::Instant;
use bitvec::prelude::*;
use fxhash::FxBuildHasher;
use rand::prelude::*;
use std::collections::{hash_map::Entry, HashMap, HashSet};

use crate::generator_sets::pauli_map::PauliMap;
use crate::generator_sets::pauli_string::utils as PauliUtils;
use crate::generator_sets::shared::floating_point_opc::FloatingPointOPC;
use crate::generator_sets::pauli_string::PauliGate;
use crate::generator_sets::pauli_string::PauliString;
use crate::circuit::Circuit;
use crate::generator_sets::measurement_sampler::MeasurementSampler;
use crate::generator_sets::shared::coefficient_list::CoefficientList;
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

    fn fix_measurement(aggr_observable: &mut HashMap<BitVec, CoefficientList, FxBuildHasher>, init_observable: &HashMap<BitVec, CoefficientList, FxBuildHasher>, target_qubit: usize, measurement: bool) {

        let mut new_aggr_observable = HashMap::<BitVec, CoefficientList, FxBuildHasher>::with_capacity_and_hasher(
            aggr_observable.len(),
            FxBuildHasher::default(),
        );

        let summand_indices = Self::get_summand_indices_with_target_z(init_observable, target_qubit);

        for (pstr, mut coef_list) in aggr_observable.drain() {

            for (coef, val) in coef_list.coefficients.iter_mut() {

                if summand_indices.contains(coef) {
                    val.mul(&FloatingPointOPC::new(-1.0));
                } 

            }

            Self::insert_into_map(&mut new_aggr_observable, pstr, coef_list);
        }

        std::mem::swap(aggr_observable, &mut new_aggr_observable);

    }

    fn extend_inital_observable(observable: &mut HashMap<BitVec, CoefficientList, FxBuildHasher>, target_qubit: usize, n_qubits: usize) -> HashMap<BitVec, CoefficientList, FxBuildHasher> {

        let n_summands_init_observable = observable.len();

        let mut unconjugated_observable_summands = HashMap::<BitVec, CoefficientList, FxBuildHasher>::with_capacity_and_hasher(
            2*observable.len(),
            FxBuildHasher::default(),
        );

        if target_qubit == n_qubits {
            return unconjugated_observable_summands;
        }

        let mut new_initial_observable = unconjugated_observable_summands.clone();

        for (i, (pstr, mut coef_list)) in observable.drain().enumerate() {
            coef_list.multiply(&FloatingPointOPC::new(0.5));

            let mut new_pstr = PauliString::from_bitvec(pstr.clone());
            new_pstr.set_pauli_gate(target_qubit, PauliGate::Z);

            let new_coef_list = CoefficientList::new_with_coef(n_summands_init_observable + i, coef_list.get_first_coef().as_f64());

            Self::insert_into_map(&mut unconjugated_observable_summands, new_pstr.as_bitslice().to_bitvec().clone(), new_coef_list.clone());

            Self::insert_into_map(&mut new_initial_observable, new_pstr.as_bitslice().to_bitvec().clone(), new_coef_list.clone());
            Self::insert_into_map(&mut new_initial_observable, pstr, coef_list);
        }
        std::mem::swap(observable, &mut new_initial_observable);
        unconjugated_observable_summands
    }

    // TODO hasher 
    fn get_summand_indices_with_target_z(observable: &HashMap<BitVec, CoefficientList, FxBuildHasher>, target_qubit: usize) -> HashSet<usize> {
        let mut summand_indices = HashSet::<usize>::with_capacity(observable.len());

        for (pstr, coef_list) in observable {
            if PauliUtils::get_pauli_gate_from_bitslice(pstr.as_bitslice(), target_qubit) == PauliGate::Z {
                summand_indices.insert(coef_list.get_first_index());
            }
        }
        summand_indices
    }

    fn half_all_coefficients(map: &mut HashMap<BitVec, CoefficientList, FxBuildHasher>) {
        for (_, coef_list) in map.iter_mut() {
            coef_list.multiply(&FloatingPointOPC::new(0.5));
        }
    }

    fn merge_maps(map1: &mut HashMap<BitVec, CoefficientList, FxBuildHasher>, map2: &mut HashMap<BitVec, CoefficientList, FxBuildHasher>) {
        for (pstr, coef_list) in map2.drain() {
            match map1.entry(pstr) {
                Entry::Occupied(mut entry) => {
                    entry.get_mut().merge(&coef_list);
                }
                Entry::Vacant(entry) => {
                    entry.insert(coef_list);
                }
            }
        }
    }

    fn insert_into_map(map: &mut HashMap<BitVec, CoefficientList, FxBuildHasher>, pstr: BitVec, coef_list: CoefficientList) {
        match map.entry(pstr) {
            Entry::Occupied(mut entry) => {
                entry.get_mut().merge(&coef_list);
            }
            Entry::Vacant(entry) => {
                entry.insert(coef_list);
            }
        }

    }

    fn sum_coef_zi_pstrs(pstrs: &HashMap<BitVec, CoefficientList, FxBuildHasher>) -> f64 {
        let mut sum = 0.0;
        for (pstr, coef_list) in pstrs {
            if PauliUtils::is_zi_pstr(pstr) {
                sum += coef_list.sum();
            }
        }

        sum
    }

    fn select_measurement(probabilities: &[f64]) -> u8 {
        
        let total_weight: f64 = probabilities.iter().sum();
        let p0 = probabilities[0] / total_weight;

        let mut rng = rand::thread_rng();
        let random_weight: f64 = rng.gen();

        if random_weight < p0 {
            return 0;
        }
        1
    }

    /// Simulates the provided circuit by setting the generators to the generators of the all zero state
    /// and calling the 'sim' function.
    pub fn simulate(&mut self, circuit: &Circuit) {
        // let start = Instant::now();

        let mut init_observable: HashMap<BitVec, CoefficientList, FxBuildHasher> = 
            HashMap::with_capacity_and_hasher(1, FxBuildHasher::default());
        
        let only_i_pstr = bitvec![0; 2*circuit.n_qubits()];
        let mut first_z_pstr = bitvec![0; 2*circuit.n_qubits()];
        PauliUtils::set_pauli_gate_in_bitslice(&mut first_z_pstr, PauliGate::Z, 0);

        init_observable.insert(only_i_pstr, CoefficientList::new_with_coef(0, 0.5));
        init_observable.insert(first_z_pstr, CoefficientList::new_with_coef(1, 0.5));


        let mut unconjugated_observable_summands = init_observable.clone();
        
        let mut aggr_target_observable = HashMap::with_capacity_and_hasher(1, FxBuildHasher::default());

        for qubit in 0..circuit.n_qubits() {

            // println!("init_observable_summands \n{}", PauliMap::from_map(init_observable.clone(), circuit.n_qubits()));

            let mut target_observable= PauliMap::from_map(unconjugated_observable_summands, circuit.n_qubits());

            // println!("start: \n{}", target_observable);
            
            let progress_bar = OptionalProgressBar::new(
                self.progress_bar,
                circuit.len() as u64,
                &Self::pb_style(&format!("Qubit {}", qubit), "gates"),
            );

            Self::conjugate_circuit_gates_pmap(&mut target_observable, circuit, true, &progress_bar, self.conjugations_before_clean);

            progress_bar.finish();

            // println!("end: \n{}", target_observable);
            // Update the aggregated observable, simulate a measurement and fix the initial observable depending on the measurement outcome

            target_observable.apply_all_h_s_conjugations();
            Self::merge_maps(&mut aggr_target_observable, &mut target_observable.take_pstr_map());

            let mut aggr_target_observable_measure_one = aggr_target_observable.clone();  
            Self::fix_measurement(&mut aggr_target_observable_measure_one, &init_observable, qubit, true);

            let p0 = Self::sum_coef_zi_pstrs(&aggr_target_observable);
            let p1 = Self::sum_coef_zi_pstrs(&aggr_target_observable_measure_one);

            let measurement = Self::select_measurement(&[p0, p1]);
            if measurement != 0 {
                std::mem::swap(&mut aggr_target_observable, &mut aggr_target_observable_measure_one);
            }
            println!("Qubit {} -> Measurement: {} (p0: {}, p1: {})", qubit, measurement , p0/(p0+p1), p1/(p0+p1));

            unconjugated_observable_summands = Self::extend_inital_observable(&mut init_observable, qubit + 1, circuit.n_qubits());
            Self::half_all_coefficients(&mut aggr_target_observable);
        }
    }

    /// Obtains the sampled measurements and returns the results as a JSON string.
    fn sim_res_json(
        &self,
        circuit: &Circuit,
        start: Instant,
        sampler: &mut MeasurementSampler,
    ) -> String {
        let progress_bar = OptionalProgressBar::new(
            self.progress_bar,
            circuit.measurements().len() as u64,
            &Self::pb_style("Sampling Measurements", "qubits"),
        );

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

        let progress_bar = OptionalProgressBar::new(
            self.progress_bar,
            n_progress_items as u64,
            &Self::pb_style(&prefix, progress_items),
        );

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

    fn conjugate_circuit_gates_pmap(
        generator_set: &mut PauliMap,
        circuit: &Circuit,
        inverse: bool,
        progress_bar: &OptionalProgressBar,
        conjugations_before_clean: usize,
    ) {

        // TODO: refactor this

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

    fn pb_style(prefix: &str, progress_items: &str) -> String {
        prefix.to_owned()
            + " -- [{elapsed_precise}] {bar:40.green/red} {pos}/{len} "
            + progress_items
            + " ({percent}%) -- {msg}"
    }
}
