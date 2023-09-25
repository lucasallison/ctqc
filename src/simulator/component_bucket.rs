use std::error::Error;
use std::collections::HashMap;
use std::collections::HashSet;

use super::component;
use super::pauli_string::PauliString;
use super::component::Component;
use super::simulator_errors::ConjugationError;
use crate::circuit::{Gate, GateType};



pub struct ComponentBucket {
    components: Vec<Component>,
    pstr_component_map: HashMap<PauliString, usize>,
    invalid_components: Vec<usize>,
    non_i_indices: Vec<HashSet<usize>>,
}


impl ComponentBucket {
    
    // Always initialize with all zero state generators
    fn new(num_qubits: u32) -> ComponentBucket {

        let mut comp_bucket = ComponentBucket {
            components: Vec::new(),
            pstr_component_map: HashMap::new(),
            non_i_indices: Vec::new(),
        };

        comp_bucket.all_zero_state_generators(num_qubits);

        comp_bucket
    }

    fn all_zero_state_generators(&mut self, num_qubits: u32) {

        for i in 0..num_qubits {

            let comp = Component::all_zero_state_generator(num_qubits, i).unwrap();
            let pstr = comp.pstr.copy();


            self.components.push(comp);
            self.pstr_component_map.insert(pstr, self.components.len() - 1);

            self.non_i_indices.push(HashSet::new());
            self.non_i_indices[i as usize].insert(i as usize);
        }
    }

    pub fn conjugate(&mut self, gate: &Gate) -> Result<(), Box<dyn Error>> {

        match gate.gate_type {
            GateType::CNOT => {

                let q1 = gate.qubit_1 as usize;
                let q2 = match gate.qubit_2 {
                    Some(q2) => q2 as usize,
                    None => { return Err(Box::from(
                                         ConjugationError{message: "Encountered CNOT gate without a second specified qubit".to_string()})); },
                };

                
                // We take the union of the non-i indices of the two qubits and loop though them TODO
                for index in self.non_i_indices[q1].union(&self.non_i_indices[q1]) {

                }

            },
            _ => {

                for index in self.non_i_indices[gate.qubit_1 as usize].iter() {
                    
                    let component = &mut self.components[*index];
                    let prev_pstr = component.pstr.copy();
                    let changed = component.conjugate_clifford(gate)?;

                    if changed {

                        let new_pstr = component.pstr.copy();
                        
                        // TODO see if this remove/insert is too costly 
                        self.pstr_component_map.remove(&prev_pstr);

                        if self.pstr_component_map.contains_key(&new_pstr) {
                            let existing_index = self.pstr_component_map[&new_pstr];
                            self.components[existing_index].merge();
                        } else {

                        self.pstr_component_map.insert(new_pstr, *index);
                    }



                }

            }, 
        }



        Ok(())
    }

    
}