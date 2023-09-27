use std::fmt;
use std::error::Error;
use std::collections::HashMap;

use super::pauli_string::PauliString;
use super::component::Component;
use crate::circuit::{Gate, GateType};

pub struct GeneratorComponents {
    generator_components: HashMap<PauliString, Component>,
}

impl GeneratorComponents {

    fn new() -> GeneratorComponents {
        GeneratorComponents {
            generator_components: HashMap::new(),
        }
    }

    pub fn all_zero_state_generators(num_qubits: u32) -> Result<GeneratorComponents, Box<dyn Error>> {

        let mut generator_components = GeneratorComponents::new();

        for i in 0..num_qubits {

            let comp = Component::all_zero_state_generator(num_qubits, i)?;

            generator_components.generator_components.insert(comp.pstr.copy(), comp);
        }

        Ok(generator_components)
    }

    pub fn conjugate(&mut self, gate: &Gate) -> Result<(), Box<dyn Error>> {

        let mut gcs_after_conjugation: HashMap<PauliString, Component> = HashMap::new();

        for component in self.generator_components.values_mut() {

            match gate.gate_type {
                GateType::T => {

                    let new_component= component.conjugate_t_gate(gate.qubit_1)?;

                    if let Some(new_component) = new_component {
                        Self::insert_or_merge(&mut gcs_after_conjugation, &new_component);
                    }

                },
                _ => {
                    component.conjugate_clifford(gate)?;
                }, 
            }

            Self::insert_or_merge(&mut gcs_after_conjugation, &component);
        }

        self.generator_components = gcs_after_conjugation;
        Ok(())
    }

    fn insert_or_merge(map: &mut HashMap<PauliString, Component>, component: &Component) {
        match map.get_mut(&component.pstr) {
            Some(c) => {
                c.merge(&component);
            },
            None => {
                map.insert(component.pstr.copy(), component.clone());
            },
        }
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
