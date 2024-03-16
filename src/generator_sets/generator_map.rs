use std::collections::{hash_map::Entry, HashMap};
use std::error::Error;
use std::fmt;

use bitvec::prelude::*;
use fxhash::FxBuildHasher;
use ordered_float::OrderedFloat;
use rayon::iter::Map;
use snafu::prelude::*;

use super::shared::coefficient_list::CoefficientList;
use super::shared::conjugation_look_up_tables::CNOT_CONJ_UPD_RULES;
use super::shared::h_s_conjugations_map::HSConjugationsMap;
use super::shared::FP_ERROR_MARGIN;
use super::GeneratorSet;

use crate::circuit::{Gate, GateType};
use crate::pauli_string::{PauliGate, PauliString};

// #[derive(Clone)]
// // TODO rename
// pub struct MapEntry {
//     pub pstr: PauliString,
//     pub coef_list: CoefficientList,
// }

// impl MapEntry {
//     pub fn new(pstr: PauliString, coef_list: CoefficientList) -> MapEntry {
//         MapEntry {
//             pstr,
//             coef_list,
//         }
//     }
// }

pub struct GeneratorMap {
    pauli_strings_src: HashMap<PauliString, CoefficientList, FxBuildHasher>,
    pauli_strings_dst: HashMap<PauliString, CoefficientList, FxBuildHasher>,
    h_s_conjugations_map: HSConjugationsMap,
    n_qubits: usize,
}

impl GeneratorMap {
    pub fn new(n_qubits: usize, n_threads: usize) -> GeneratorMap {
        if n_threads > 1 {
            eprintln!("WARNING: GeneratorMap does not support parallelism. Ignoring n_threads.");
        }

        GeneratorMap {
            pauli_strings_src: Self::empty_map(n_qubits),
            pauli_strings_dst: Self::empty_map(n_qubits),
            h_s_conjugations_map: HSConjugationsMap::new(n_qubits),
            n_qubits,
        }
    }

    fn insert_or_merge_into_dst(&mut self, pstr: PauliString, coef_list: CoefficientList) {
        match self.pauli_strings_dst.entry(pstr) {
            Entry::Occupied(mut e) => {
                let existing_coef_list = e.get_mut();

                existing_coef_list.merge(&coef_list);

                if existing_coef_list.is_empty() {
                    e.remove_entry();
                }
            }
            Entry::Vacant(e) => {
                e.insert(coef_list);
            }
        }
    } 

    fn set_default(&mut self) {
        self.pauli_strings_src = Self::empty_map(self.n_qubits);
        self.pauli_strings_dst = Self::empty_map(self.n_qubits);
        self.h_s_conjugations_map = HSConjugationsMap::new(self.n_qubits);
    }

    fn empty_map(size: usize) -> HashMap<PauliString, CoefficientList, FxBuildHasher> {
        HashMap::<PauliString, CoefficientList, FxBuildHasher>::with_capacity_and_hasher(
            size,
            FxBuildHasher::default(),
        )
    }

    fn apply_h_s_conjugations(
        &self,
        pstr: &mut PauliString,
        coef_list: &mut CoefficientList,
        q_index: usize,
    ) {
        let current_p_gate = pstr.get_pauli_gate(q_index);
        let actual_p_gate = self
            .h_s_conjugations_map
            .get_actual_p_gate(q_index, current_p_gate);
        pstr.set_pauli_gate(q_index, actual_p_gate);
        coef_list.multiply(
            self.h_s_conjugations_map
                .get_coefficient_multiplier(q_index, current_p_gate),
        );
    }

    fn conjugate_cnot(&mut self, gate: &Gate) {
        let qubit_2 = gate.qubit_2.unwrap();

        let mut pstrs_src = std::mem::take(&mut self.pauli_strings_src);

        for (mut pstr, mut coef_list) in pstrs_src.drain() {
            self.apply_h_s_conjugations(&mut pstr, &mut coef_list, gate.qubit_1);
            self.apply_h_s_conjugations(&mut pstr, &mut coef_list, qubit_2);

            let q1_target_p_gate = pstr.get_pauli_gate(gate.qubit_1);
            let q2_target_p_gate = pstr.get_pauli_gate(qubit_2);

            let look_up_output = CNOT_CONJ_UPD_RULES
                .get(&(q1_target_p_gate, q2_target_p_gate))
                .unwrap();

            coef_list.multiply(look_up_output.coefficient);

            pstr.set_pauli_gate(gate.qubit_1, look_up_output.q1_p_gate);
            pstr.set_pauli_gate(qubit_2, look_up_output.q2_p_gate);

            self.insert_or_merge_into_dst(pstr, coef_list);
        }

        self.pauli_strings_src = std::mem::take(&mut pstrs_src);
        std::mem::swap(&mut self.pauli_strings_src, &mut self.pauli_strings_dst);

        self.h_s_conjugations_map.reset(gate.qubit_1);
        self.h_s_conjugations_map.reset(qubit_2);
    }

    fn conjugate_rz(&mut self, gate: &Gate, conjugate_dagger: bool) {

        let mut pstrs_src = std::mem::take(&mut self.pauli_strings_src);

        // Reserve addtional memory for potential new Pauli strings
        self.pauli_strings_dst.reserve(pstrs_src.len()/2);

        for (mut pstr, mut coef_list) in pstrs_src.drain() {
            self.apply_h_s_conjugations(&mut pstr, &mut coef_list, gate.qubit_1);

            let target_pgate = pstr.get_pauli_gate(gate.qubit_1);

            if target_pgate == PauliGate::Z || target_pgate == PauliGate::I {
                self.pauli_strings_dst.insert(pstr, coef_list);
                continue;
            }

            let mut new_pstr = pstr.clone();
            let mut new_coef_list = coef_list.clone();

            pstr.set_pauli_gate(gate.qubit_1, PauliGate::X);
            new_pstr.set_pauli_gate(gate.qubit_1, PauliGate::Y);

            match (target_pgate, conjugate_dagger) {
                (PauliGate::X, false) => {
                    coef_list.multiply(gate.angle.unwrap().cos());
                    new_coef_list.multiply(gate.angle.unwrap().sin());
                }
                (PauliGate::Y, false) => {
                    coef_list.multiply(-1.0 * gate.angle.unwrap().sin());
                    new_coef_list.multiply(gate.angle.unwrap().cos());
                }
                (PauliGate::X, true) => {
                    coef_list.multiply(gate.angle.unwrap().cos());
                    new_coef_list.multiply(-1.0 * gate.angle.unwrap().sin());
                }
                (PauliGate::Y, true) => {
                    coef_list.multiply(gate.angle.unwrap().sin());
                    new_coef_list.multiply(gate.angle.unwrap().cos());
                }
                _ => {
                    unreachable!()
                }
            }

            self.insert_or_merge_into_dst(pstr, coef_list);
            self.insert_or_merge_into_dst(new_pstr, new_coef_list);
        }

        // Take back ownership of the source map, which is now empty
        self.pauli_strings_src = std::mem::take(&mut pstrs_src);
        // Swap src and dest map, so the src map contains the updated Pauli strings
        std::mem::swap(&mut self.pauli_strings_src, &mut self.pauli_strings_dst);

        self.h_s_conjugations_map.reset(gate.qubit_1);
    }
}

impl GeneratorSet for GeneratorMap {
    fn init_generators(&mut self, zero_state_generators: bool) {
        self.set_default();

        let p_gate = if zero_state_generators {
            PauliGate::Z
        } else {
            PauliGate::X
        };

        for generator_index in 0..self.n_qubits {
            let mut pstr = PauliString::new(self.n_qubits);
            pstr.set_pauli_gate(generator_index, p_gate);
            let coef_list = CoefficientList::new(generator_index);
            self.pauli_strings_src.insert(pstr, coef_list);
        }
    }

    /// Initialize the map with the ith generator of the all zero state or all plus state.
    fn init_single_generator(&mut self, i: usize, zero_state_generator: bool) {
        unimplemented!()
        // self.set_default();
        // let comp = Component::ith_generator(self.n_qubits, i, zero_state_generator).unwrap();
        // self.generator_components.insert(comp.pstr.clone(), comp);
    }

    fn is_x_or_z_generators(&mut self, check_zero_state: bool) -> bool {
        unimplemented!()
        // self.clean();

        // let mut generator_present = bitvec![0; self.n_qubits as usize];

        // for component in self.generator_components.values() {
        //     let ind = component.is_generator(check_zero_state);

        //     if ind == -1 {
        //         return false;
        //     } else {
        //         generator_present.set(ind as usize, true);
        //     }
        // }

        // for gen in generator_present {
        //     if !gen {
        //         return false;
        //     }
        // }
        // true
    }

    fn is_single_x_or_z_generator(&mut self, check_zero_state: bool, i: usize) -> bool {
        unimplemented!()
        // self.clean();

        // if self.generator_components.len() != 1 {
        //     return false;
        // }

        // self.generator_components
        //     .values()
        //     .next()
        //     .unwrap()
        //     .is_ith_generator(i, check_zero_state)
    }

    fn conjugate(&mut self, gate: &Gate, conjugate_dagger: bool) {
        match gate.gate_type {
            GateType::H | GateType::S => {
                self.h_s_conjugations_map.update(gate, conjugate_dagger).unwrap();
            }
            GateType::CNOT => self.conjugate_cnot(gate),
            GateType::Rz => self.conjugate_rz(gate, conjugate_dagger),
            _ => {
                // TODO return error?
                panic!("Can only conjugate a H, S, CNOT, or Rz gate")
            }
        }

        // for component in self.generator_components.values_mut() {
        //     match gate.gate_type {
        //         GateType::H | GateType::S | GateType::CNOT => {
        //             if let Err(err) = component.conjugate_clifford(gate, conjugate_dagger) {
        //                 // Handle the error here
        //                 panic!("Error while conjugating a Clifford gate: {}", err);
        //             }
        //         }
        //         GateType::Rz => {
        //             let new_component = component.conjugate_rz(gate, conjugate_dagger);

        //             match new_component {
        //                 Ok(None) => {
        //                     // No change
        //                 }
        //                 Ok(Some(new_component)) => {
        //                     Self::insert_or_merge(&mut gcs_after_conjugation, new_component)
        //                         .unwrap();
        //                 }
        //                 Err(e) => {
        //                     panic!("Error while conjugating T gate: {}", e);
        //                 }
        //             }
        //         }
        //         _ => {
        //             panic!("Can only conjugate a H, S, CNOT, or Rz gate")
        //         }
        //     }

        //     Self::insert_or_merge(&mut gcs_after_conjugation, component.clone()).unwrap();
        // }

        // self.generator_components = gcs_after_conjugation;
    }

    fn measure(&mut self, _i: usize) -> (bool, f64) {
        unimplemented!()
    }

    // Removes all invalid components
    fn clean(&mut self) {
        // self.generator_components.retain(|_, c| {
        //     c.remove_zero_coefficient_generators();
        //     c.valid()
        // });
    }

    fn size(&self) -> usize {
        // self.generator_components.len()
        0
    }
}

impl fmt::Display for GeneratorMap {
    // fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
    //     for (pstr, coef_list) in &self.pauli_strings_src {

    //         let mut coef_multiplier = 1.0;

    //         write!(f, "{}: (", pstr)?;

    //         for c in coef_list.coefficients.iter() {
    //             write!(&format!("{}: {}, ", c.0, c.1 * coef_multiplier));
    //         }
    //         write!(")\n")?;
    //     }

    //     Ok(())
    // }
}

// ------------------ Components and Generator Info --------------------------------------

// #[derive(Clone)]
// // TODO rename?
// pub struct Component {
//     pub pstr: PauliString,
//     pub coef_list: CoefficientList,
// }

// impl Component {
//     pub fn new(pstr: PauliString, coef_list: CoefficientList) -> Component {
//         Component {
//             pstr,
//             coef_list,
//         }
//     }

//     // By default returns a component representing the ith generator of the all zero state.
//     // I.e., II..IZI..II -> Pauli string with Z on ith place
//     // If plus_state_generator is true we return the ith generator of the all plus state.
//     // I.e., II..IXI..II -> Pauli string with Z on ith place
//     pub fn ith_generator(
//         n_qubits: usize,
//         i: usize,
//         zero_state_generator: bool,
//     ) -> Result<Component, ComponentError> {
//         // if i >= n_qubits {
//         //     return Err(ComponentError::InvalidGenerator {
//         //         n_qubits: n_qubits,
//         //     });
//         // }

//         // let non_i_gate: PauliGate = if zero_state_generator {
//         //     PauliGate::Z
//         // } else {
//         //     PauliGate::X
//         // };

//         // let mut generator = PauliString::new(n_qubits as usize);
//         // generator.set_pauli_gate(i as usize, non_i_gate);

//         // let mut comp = MapEntry::new(generator);
//         // comp.generator_info.push(GeneratorInfo::new(i));

//         // Ok(comp)
//     }

//     // Returns wheter the component is a generator of the all zero state state or
//     // all plus state (specified by the check_zero_state bool).
//     // If so it returns the index of the generator, otherwise -1.
//     // It does not check if the component is valid or removes zero coefficient generators.
//     pub fn is_generator(&self, check_zero_state: bool) -> i32 {
//         // // TODO explain
//         // if !self.generator_info.len() == 1 {
//         //     return -1;
//         // }

//         // let gen_coefficient = self.generator_info[0].get_coefficient();

//         // if gen_coefficient + FP_ERROR_MARGIN < OrderedFloat(1.0) {
//         //     return -1;
//         // }

//         // let gen_ind = self.generator_info[0].get_index();
//         // let target_pauli = if check_zero_state {
//         //     PauliGate::Z
//         // } else {
//         //     PauliGate::X
//         // };

//         // for (i, pgate) in self.pstr.iter().enumerate() {
//         //     if i == (gen_ind as usize) && pgate != target_pauli {
//         //         return -1;
//         //     }
//         //     if i != (gen_ind as usize) && pgate != PauliGate::I {
//         //         return -1;
//         //     }
//         // }

//         // gen_ind as i32
//     }

//     pub fn is_ith_generator(&self, i: usize, check_zero_state: bool) -> bool {
//         // self.is_generator(check_zero_state) == (i as i32)
//     }

//     fn multiply_generator_coefficients(&mut self, coefficient: f64) {
//         for generator_info in self.generator_info.iter_mut() {
//             generator_info.coefficient *= coefficient;
//         }
//     }

//     // The bool indicates whether the pauli string in the
//     // component has changed
//     pub fn conjugate_clifford(
//         &mut self,
//         gate: &Gate,
//         conjugate_dagger: bool,
//     ) -> Result<bool, Box<dyn Error>> {
//         match gate.gate_type {
//             GateType::H => {
//                 return self.h_s_conjugation(gate, conjugate_dagger);
//             }
//             GateType::CNOT => {
//                 return self.conjugate_cnot(gate);
//             }
//             GateType::S => {
//                 return self.h_s_conjugation(gate, conjugate_dagger);
//             }
//             _ => Err(Box::from(ConjugationError::InvalidCliffordConjugation {})),
//         }
//     }

//     // Return true if the pauli string changed
//     // If conjugate_dagger is true we conjugate with the complex conjugate
//     // of the gate
//     fn h_s_conjugation(
//         &mut self,
//         gate: &Gate,
//         conjugate_dagger: bool,
//     ) -> Result<bool, Box<dyn Error>> {
//         let target_pauli_gate = self.pstr.get_pauli_gate(gate.qubit_1 as usize);

//         // Identity gate does not change from conjugation
//         if target_pauli_gate == PauliGate::I {
//             return Ok(false);
//         }

//         // Look up how the Pauli string changes as a result of the conjugation
//         let look_up_output = match gate.gate_type {
//             GateType::H => H_CONJ_UPD_RULES.get(&target_pauli_gate).unwrap(),
//             GateType::S => {
//                 if conjugate_dagger {
//                     S_DAGGER_CONJ_UPD_RULES.get(&target_pauli_gate).unwrap()
//                 } else {
//                     S_CONJ_UPD_RULES.get(&target_pauli_gate).unwrap()
//                 }
//             }
//             _ => return Err(Box::from(ConjugationError::InvalidHSConjugation {})),
//         };

//         self.multiply_generator_coefficients(look_up_output.coefficient as f64);

//         // No change; return immediately
//         if !look_up_output.pstr_changed {
//             return Ok(false);
//         }

//         // We update the pauli string with the gate resulting from the conjugation
//         self.pstr
//             .set_pauli_gate(gate.qubit_1 as usize, look_up_output.p_gate);

//         Ok(true)
//     }

//     fn conjugate_cnot(&mut self, gate: &Gate) -> Result<bool, Box<dyn Error>> {
//         let qubit_2 = gate.qubit_2.unwrap();

//         let q1_target_pauli_gate = self.pstr.get_pauli_gate(gate.qubit_1 as usize);
//         let q2_target_pauli_gate = self.pstr.get_pauli_gate(qubit_2 as usize);

//         // The pauli string does not change from conjugation
//         if !CNOT_CONJ_UPD_RULES.contains_key(&(q1_target_pauli_gate, q2_target_pauli_gate)) {
//             return Ok(false);
//         }

//         let look_up_output = CNOT_CONJ_UPD_RULES
//             .get(&(q1_target_pauli_gate, q2_target_pauli_gate))
//             .unwrap();

//         self.multiply_generator_coefficients(look_up_output.coefficient as f64);

//         // The pauli string does not change from conjugation
//         // TODO maybe just remove them from the map?
//         if !look_up_output.pstr_changed {
//             return Ok(false);
//         }

//         // We update the pauli string with the gate resulting from the conjugation
//         self.pstr
//             .set_pauli_gate(gate.qubit_1 as usize, look_up_output.q1_p_gate);
//         self.pstr
//             .set_pauli_gate(qubit_2 as usize, look_up_output.q2_p_gate);

//         Ok(true)
//     }

//     // When X, Y are conjugated by an Rz gate we obtain two compontents. The first component represents
//     // the Pauli string with updated coeffients. We do not need to create a new component for this
//     // but just update self. The second component does represent a different Pauli string, for which
//     // we create a new component. Since the component does not change when we conjugate an
//     // I, Z we return None in that case and leave self unchanged.
//     pub fn conjugate_rz(
//         &mut self,
//         gate: &Gate,
//         conjugate_dagger: bool,
//     ) -> Result<Option<Component>, Box<dyn Error>> {
//         let target_gate = self.pstr.get_pauli_gate(gate.qubit_1 as usize);

//         if target_gate == PauliGate::Z || target_gate == PauliGate::I {
//             return Ok(None);
//         }

//         let mut new_component: Component;

//         match target_gate {
//             PauliGate::X => {
//                 // Rz(θ)^†XRz(θ) = cos(θ)X  - sin(θ)Y
//                 // Rz(θ)XRz(θ)^† = cos(θ)X  + sin(θ)Y
//                 new_component = self.clone();
//                 self.multiply_generator_coefficients(gate.angle.unwrap().cos());
//                 new_component.multiply_generator_coefficients(gate.angle.unwrap().sin());

//                 if conjugate_dagger {
//                     new_component.multiply_generator_coefficients(-1.0);
//                 }

//                 new_component
//                     .pstr
//                     .set_pauli_gate(gate.qubit_1 as usize, PauliGate::Y);

//                 return Ok(Some(new_component));
//             }

//             PauliGate::Y => {
//                 // Rz(θ)YRz(θ)^† = -sin(θ)X + cos(θ)Y
//                 // Rz(θ)^†YRz(θ) = sin(θ)X  + cos(θ)Y
//                 new_component = self.clone();
//                 self.multiply_generator_coefficients(gate.angle.unwrap().sin());
//                 new_component.multiply_generator_coefficients(gate.angle.unwrap().cos());

//                 if !conjugate_dagger {
//                     new_component.multiply_generator_coefficients(-1.0);
//                 }

//                 new_component
//                     .pstr
//                     .set_pauli_gate(gate.qubit_1 as usize, PauliGate::X);

//                 return Ok(Some(new_component));
//             }

//             _ => {
//                 return Ok(None);
//             }
//         }
//     }

//     // Removes all generators with coefficient 0 and returns if the compont is still valid,
//     // that is, it is part of at least one generator.
//     pub fn remove_zero_coefficient_generators(&mut self) -> bool {
//         self.generator_info.retain(|generator_info| {
//             generator_info.coefficient > OrderedFloat(0.0 + FP_ERROR_MARGIN)
//                 || generator_info.coefficient + FP_ERROR_MARGIN
//                     < OrderedFloat(0.0 - FP_ERROR_MARGIN)
//         });
//         return self.valid();
//     }

//     pub fn valid(&self) -> bool {
//         self.generator_info.len() > 0
//     }

//     // Merges two components, returns 'true' this Pauli string is a component
//     // of any generator, i.e., there exists a non zero coefficient of this Pauli
//     // string for a generator.
//     // TODO refactor?
//     pub fn merge(&mut self, other: &Component) -> Result<bool, ComponentError> {
//         if self.pstr != other.pstr {
//             return Err(ComponentError::MergeUnequalPStr {
//                 pstr_1: self.pstr.clone(),
//                 pstr_2: other.pstr.clone(),
//             });
//         }

//         if self.generator_info.len() == 0 || other.generator_info.len() == 0 {
//             return Err(ComponentError::MergeComponentWithoutGen {});
//         }

//         let mut merged_generator_info = Vec::<GeneratorInfo>::new();
//         let mut ind_self: usize = 0;
//         let mut ind_other: usize = 0;

//         while ind_self < self.generator_info.len() && ind_other < other.generator_info.len() {
//             let self_generator_info = self.generator_info[ind_self];
//             let other_generator_info = other.generator_info[ind_other];

//             if self_generator_info.generator_index == other_generator_info.generator_index {
//                 let new_coefficient =
//                     self_generator_info.coefficient + other_generator_info.coefficient;
//                 if new_coefficient == OrderedFloat(0.0) {
//                     ind_self += 1;
//                     ind_other += 1;
//                     continue;
//                 }
//                 let mut new_generator_info = self_generator_info;
//                 new_generator_info.coefficient += other_generator_info.coefficient;
//                 merged_generator_info.push(new_generator_info);
//                 ind_self += 1;
//                 ind_other += 1;
//             } else if self_generator_info.generator_index < other_generator_info.generator_index {
//                 merged_generator_info.push(self_generator_info);
//                 ind_self += 1;
//             } else {
//                 merged_generator_info.push(other_generator_info);
//                 ind_other += 1;
//             }
//         }

//         while ind_self < self.generator_info.len() {
//             merged_generator_info.push(self.generator_info[ind_self]);
//             ind_self += 1;
//         }

//         while ind_other < other.generator_info.len() {
//             merged_generator_info.push(other.generator_info[ind_other]);
//             ind_other += 1;
//         }

//         self.generator_info = merged_generator_info;
//         Ok(self.generator_info.len() > 0)
//     }
// }

// impl fmt::Display for Component {
//     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
//         write!(f, "{}: ", self.pstr)?;
//         for generator_info in &self.generator_info {
//             write!(
//                 f,
//                 "({}: {}), ",
//                 generator_info.generator_index, generator_info.coefficient
//             )?;
//         }
//         Ok(())
//     }
// }

// // ------------------ Errors --------------------------------------

// #[derive(Debug, Snafu)]
// pub enum ComponentError {
//     #[snafu(display(
//         "Pauli strings must be equal to merge, tried merging: {} and {}",
//         pstr_1,
//         pstr_2
//     ))]
//     MergeUnequalPStr {
//         pstr_1: PauliString,
//         pstr_2: PauliString,
//     },

//     #[snafu(display("Cannot merge components that belong to no generators"))]
//     MergeComponentWithoutGen {},

//     #[snafu(display("Tried creating the ith generator, but in a circuit of {} qubits there are only {} generators.", n_qubits, n_qubits))]
//     InvalidGenerator { n_qubits: usize },
// }

// #[derive(Debug, Snafu)]
// pub enum ConjugationError {
//     #[snafu(display("Cannot use 'h_s_conjugation' function for a non H or S gate"))]
//     InvalidHSConjugation {},

//     #[snafu(display("Cannot use 'conjugate_t_gate' function for a non Clifford gate"))]
//     InvalidCliffordConjugation {},
// }

// // ------------------ Tests ---------------------------------------

// #[cfg(test)]
// mod tests {

//     use super::*;

//     fn pauli_from_str(string: &str) -> PauliString {
//         let mut pstr = PauliString::new(string.len());
//         println!("String: {}", string);

//         for (index, char) in string.chars().enumerate() {
//             match char {
//                 'I' => {
//                     pstr.set_pauli_gate(index, PauliGate::I);
//                 }
//                 'X' => {
//                     pstr.set_pauli_gate(index, PauliGate::X);
//                 }
//                 'Y' => {
//                     pstr.set_pauli_gate(index, PauliGate::Y);
//                 }
//                 'Z' => {
//                     pstr.set_pauli_gate(index, PauliGate::Z);
//                 }
//                 _ => panic!("Invalid character in Pauli string"),
//             }
//         }
//         pstr
//     }

//     #[test]
//     fn conjugate_with_h_xizii() {
//         let input = pauli_from_str("XIZII");
//         let output = pauli_from_str("XIXII");

//         let hadamard = Gate::new(&"H".to_string(), 2, None, None).unwrap();

//         let mut c = Component::new(input);

//         let res = c.conjugate_clifford(&hadamard, false);

//         assert!(c.pstr == output, "Expected: {}, got: {}", output, c.pstr);
//         assert!(res.unwrap() == true);
//     }

//     #[test]
//     fn conjugate_with_h_yizii() {
//         let input = pauli_from_str("YIZII");
//         let output = pauli_from_str("YIZII");

//         let hadamard = Gate::new(&"H".to_string(), 0, None, None).unwrap();

//         let mut c = Component::new(input);
//         c.generator_info.push(GeneratorInfo::new(0));
//         c.generator_info.push(GeneratorInfo::new(1));
//         c.generator_info.push(GeneratorInfo::new(3));

//         let res = c.conjugate_clifford(&hadamard, false);

//         assert!(res.unwrap() == false);
//         assert!(c.pstr == output, "Expected: {}, got: {}", output, c.pstr);

//         for generator_info in &c.generator_info {
//             assert!(
//                 generator_info.get_coefficient() == (-1.0 as f64),
//                 "Expected: -1.0, got: {}",
//                 generator_info.get_coefficient()
//             );
//         }
//     }

//     #[test]
//     fn conjugate_with_s_y() {
//         let input = pauli_from_str("Y");
//         let output = pauli_from_str("X");

//         let s_gate = Gate::new(&"S".to_string(), 0, None, None).unwrap();

//         let mut c = Component::new(input);
//         c.generator_info.push(GeneratorInfo::new(0));
//         c.generator_info.push(GeneratorInfo::new(1));

//         let res = c.conjugate_clifford(&s_gate, false);

//         assert!(res.unwrap() == true);
//         assert!(c.pstr == output, "Expected: {}, got: {}", output, c.pstr);

//         for generator_info in &c.generator_info {
//             assert!(
//                 generator_info.get_coefficient() == (-1.0 as f64),
//                 "Expected: -1.0, got: {}",
//                 generator_info.get_coefficient()
//             );
//         }
//     }

//     #[test]
//     fn conjugate_with_cnot_ixizi() {
//         let input = pauli_from_str("IXIZI");
//         let output = pauli_from_str("IYIYI");

//         let cnot = Gate::new(&"CNOT".to_string(), 1, Some(3), None).unwrap();

//         let mut c = Component::new(input);
//         let res = c.conjugate_clifford(&cnot, false);

//         assert!(res.unwrap() == true);
//         assert!(c.pstr == output, "Expected: {}, got: {}", output, c.pstr);
//     }

//     #[test]
//     fn conjugate_with_cnot_ixizii() {
//         let input = pauli_from_str("IXIZII");
//         let output = pauli_from_str("IXIZXI");

//         let cnot = Gate::new(&"CNOT".to_string(), 1, Some(4), None).unwrap();

//         let mut c = Component::new(input);
//         let res = c.conjugate_clifford(&cnot, false).unwrap();

//         assert!(res == true);
//         assert!(c.pstr == output, "Expected: {}, got: {}", output, c.pstr);
//     }

//     #[test]
//     fn test_merge() {
//         let input1 = pauli_from_str("IXIZII");
//         let mut c1 = Component::new(input1);
//         c1.generator_info.push(GeneratorInfo::new(0));
//         c1.generator_info.push(GeneratorInfo::new(1));
//         c1.generator_info.push(GeneratorInfo::new(3));

//         let input2 = pauli_from_str("IXIZII");
//         let mut c2 = Component::new(input2);
//         c2.generator_info.push(GeneratorInfo::new(0));
//         c2.generator_info.push(GeneratorInfo::new(1));
//         c2.generator_info.push(GeneratorInfo::new(2));
//         c2.generator_info.push(GeneratorInfo::new(3));

//         c1.merge(&c2).unwrap();

//         for generator_info in &c1.generator_info {
//             if generator_info.get_index() != 2 {
//                 assert!(
//                     generator_info.get_coefficient() == 2.0 as f64,
//                     "Expected: 2.0, got: {}",
//                     generator_info.get_coefficient()
//                 );
//             } else {
//                 assert!(
//                     generator_info.get_coefficient() == 1.0 as f64,
//                     "Expected: 1.0, got: {}",
//                     generator_info.get_coefficient()
//                 );
//             }
//         }

//         assert!(c1.generator_info[2].get_index() == 2)
//     }

//     #[test]
//     fn test_merge_2() {
//         let p1 = pauli_from_str("XIZII");
//         let p2 = pauli_from_str("XIZII");

//         let mut c1 = Component::new(p1);
//         c1.generator_info.push(GeneratorInfo::new(0));
//         c1.generator_info.push(GeneratorInfo::new(3));
//         c1.generator_info.push(GeneratorInfo::new(4));

//         let mut c2 = Component::new(p2);
//         c2.generator_info.push(GeneratorInfo::new(0));
//         c2.generator_info[0].coefficient = OrderedFloat(-1.0);
//         c2.generator_info.push(GeneratorInfo::new(3));
//         c2.generator_info.push(GeneratorInfo::new(5));

//         assert!(c1.merge(&c2).unwrap() == true);

//         let target = vec![
//             GeneratorInfo {
//                 generator_index: 3,
//                 coefficient: OrderedFloat(2.0),
//             },
//             GeneratorInfo {
//                 generator_index: 4,
//                 coefficient: OrderedFloat(1.0),
//             },
//             GeneratorInfo {
//                 generator_index: 5,
//                 coefficient: OrderedFloat(1.0),
//             },
//         ];

//         assert!(c1.generator_info == target);
//     }
// }
