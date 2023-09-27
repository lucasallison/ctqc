use std::fmt;
use std::error::Error;
use std::collections::HashMap;

use super::pauli_string::PauliString;
use super::component::Component;
use crate::circuit::{Gate, GateType};

// TODO just for development, remove later
pub struct Stats {
    pub num_merges: usize,
}

impl Stats {
    pub fn new() -> Stats {
        Stats {
            num_merges: 0,
        }
    }
}

pub struct GeneratorComponents {
    generator_components: HashMap<PauliString, Component>,
}

impl GeneratorComponents {

    pub fn new(num_qubits: u32) -> GeneratorComponents {
        let mut gcs = GeneratorComponents {
            generator_components: HashMap::new(),
        };

        gcs.all_zero_state_generators(num_qubits);
        gcs
    }

    fn all_zero_state_generators(&mut self, num_qubits: u32) {

        for i in 0..num_qubits {

            let comp = Component::all_zero_state_generator(num_qubits, i).unwrap();
            self.generator_components.insert(comp.pstr.copy(), comp);
        }
    }

    pub fn conjugate(&mut self, gate: &Gate, stats: &mut Stats) -> Result<(), Box<dyn Error>> {

        let mut gcs_after_conjugation: HashMap<PauliString, Component> = HashMap::new();

        for component in self.generator_components.values_mut() {

            match gate.gate_type {
                GateType::T => {

                    let new_component= component.conjugate_t_gate(gate.qubit_1)?;

                    if let Some(new_component) = new_component {
                        Self::insert_or_merge(&mut gcs_after_conjugation, new_component, stats)?;
                    }

                },
                _ => {
                    component.conjugate_clifford(gate)?;
                }, 
            }

            Self::insert_or_merge(&mut gcs_after_conjugation, component.clone(), stats)?;
        }

        self.generator_components = gcs_after_conjugation;
        Ok(())
    }

    fn insert_or_merge(map: &mut HashMap<PauliString, Component>, component: Component, stats: &mut Stats) -> Result<(), Box<dyn Error>>{
        let pstr = component.pstr.copy();
        match map.get_mut(&component.pstr) {
            Some(c) => {
                let valid = c.merge(component)?;
                stats.num_merges += 1;
                if !valid {
                    map.remove(&pstr);
                }
            },
            None => {
                map.insert(pstr, component);
            },
        }
        Ok(())
    } 

    pub fn len(&self) -> usize {
        self.generator_components.len()
    }

}

impl fmt::Display for GeneratorComponents {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        for component in self.generator_components.values() {
            write!(f, "{}\n", component)?;
        }
        Ok(())
    }
}
