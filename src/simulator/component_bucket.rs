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
}


impl ComponentBucket {
    
    // Always initialize with all zero state generators
    pub fn new(num_qubits: u32) -> ComponentBucket {

        let mut comp_bucket = ComponentBucket {
            components: Vec::new(),
            pstr_component_map: HashMap::new(),
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
        }
    }

    pub fn conjugate(&mut self, gate: &Gate) -> Result<(), Box<dyn Error>> {

        Ok(())

    }

    fn conjugate_clifford(&mut self, gate: &Gate, tar_comp_ind: usize, indices: &HashSet<usize>, 
                          conjugated_indices: &mut HashSet<usize>)  -> Result<(), Box<dyn Error>> {
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
    }

}
