use std::fmt;
use std::error::Error;
use std::collections::HashMap;
use std::collections::HashSet;

use super::pauli_string::PauliString;
use super::component::Component;
use super::simulator_errors::ConjugationError;
use crate::circuit::{Gate, GateType};



pub struct ComponentBucket {
    components: Vec<Component>,
    pstr_component_map: HashMap<PauliString, usize>,
    invalid_components: HashSet<usize>,
    non_i_indices: Vec<HashSet<usize>>,
}


impl ComponentBucket {
    
    // Always initialize with all zero state generators
    pub fn new(num_qubits: u32) -> ComponentBucket {

        let mut comp_bucket = ComponentBucket {
            components: Vec::new(),
            pstr_component_map: HashMap::new(),
            invalid_components: HashSet::new(),
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

        let mut indices_to_conjugate = HashSet::<usize>::new();
        let mut conjugated_indices = HashSet::<usize>::new();

        match gate.gate_type {
            GateType::CNOT => {

                let q1 = gate.qubit_1 as usize;
                let q2 = match gate.qubit_2 {
                    Some(q2) => q2 as usize,
                    None => { return Err(Box::from(
                                         ConjugationError{message: "Encountered CNOT gate without a second specified qubit".to_string()})); },
                };

                indices_to_conjugate = self.non_i_indices[q1].union(&self.non_i_indices[q2]).copied().collect();
            },
            _ => {
                indices_to_conjugate = self.non_i_indices[gate.qubit_1 as usize].clone();
            }
        }

        for index in indices_to_conjugate.iter() {
            self.conjugate_clifford(gate, *index, &indices_to_conjugate, &mut conjugated_indices)?;
        }


        Ok(())

    }

    fn conjugate_clifford(&mut self, gate: &Gate, tar_comp_ind: usize, indices: &HashSet<usize>, 
                          conjugated_indices: &mut HashSet<usize>)  -> Result<(), Box<dyn Error>> {

        // We already conjugated this component
        if conjugated_indices.contains(&tar_comp_ind) {
            return Ok(());
        }

        let component = match self.components.get_mut(tar_comp_ind) {
            Some(c) => c,
            None => { return Err(Box::from(
                                 ConjugationError{message: "Index specifing a Pauli string with a non I gate 
                                                            at the target qubit does not exsist".to_string()})); },
        }; 

        let current_pstr = component.pstr.copy();
        let changed = component.conjugate_clifford(gate)?;
        conjugated_indices.insert(tar_comp_ind);

        // No book keeping todo
        if !changed {
            return Ok(())
        }

        let new_pstr = component.pstr.copy();

        // The old Pauli is no longer valid, we remove it from the map but keep it in the vector so we 
        // do not have to perform a remove. 
        self.pstr_component_map.remove(&current_pstr);

        // If the new Pauli is already in the map, we merge the two components. 
        if self.pstr_component_map.contains_key(&new_pstr) {

            let existing_index = self.pstr_component_map[&new_pstr];

            if indices.contains(&existing_index) {
                self.conjugate_clifford(gate, existing_index, indices, conjugated_indices)?;
            }

            self.merge_comp1_into_comp2(tar_comp_ind, existing_index)?;

            // We mark the original component as invalid so the memory can be resused
            self.invalid_components.insert(tar_comp_ind);
            
        // Otherwise we insert the new component into the map and vector
        } else {
            self.pstr_component_map.insert(new_pstr, tar_comp_ind);
        }

        Ok(())
    } 

    // Will merge component with index c_1 into component with index c_2
    fn merge_comp1_into_comp2(&mut self, c1_index: usize, c2_index: usize) -> Result<(), ConjugationError> {

        if c1_index == c2_index {
            return Err(ConjugationError { message: "Cannot merge a component into itself".to_string() });
        }

        if c1_index > c2_index {
            let (left, right) = self.components.split_at_mut(c1_index);
            left[c2_index].merge(&right[0]);
        } else {
            let (left, right) = self.components.split_at_mut(c2_index);
            right[0].merge(&left[c1_index]);
        }

        Ok(())
    }

    fn conjugate_t_gate(&mut self, gate: &Gate, tar_comp_ind: usize, indices: &HashSet<usize>, 
                        conjugated_indices: &mut HashSet<usize>) -> Result<(), Box<dyn Error>> {

        
        // TODO 
        Ok(())
    }

}

impl fmt::Display for ComponentBucket {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        for (i, component) in self.components.iter().enumerate() {
            if self.invalid_components.contains(&i) {
                continue;
            }
            write!(f, "{}\n", component)?;
        }
        Ok(())
    }
}

// ------------------ Tests ---------------------------------------

#[cfg(test)]
mod tests {
    use super::ComponentBucket;
    use crate::circuit::Gate;


    #[test]
    // H 0, CNOT 0 1 
    fn comp_bucket_test_circuit() {
        let mut comp_bucket = ComponentBucket::new(4);

        let hadamard = Gate::new(&"H".to_string(), 0, None).unwrap();
        let cnot = Gate::new(&"CNOT".to_string(), 0, Some(1)).unwrap();

        println!("{comp_bucket}");
        comp_bucket.conjugate(&hadamard).unwrap();
        println!("{comp_bucket}");
        comp_bucket.conjugate(&cnot).unwrap();
        println!("{comp_bucket}");
    }

}
