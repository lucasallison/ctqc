use std::fmt;
use std::error::Error;
use std::collections::HashMap;
use bitvec::prelude::*;

use super::pauli_string::PauliString;
use super::pauli_string::PauliGate;
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
    num_qubits: u32,
}

impl GeneratorComponents {

    pub fn new(num_qubits: u32, plus_state_generators: bool) -> GeneratorComponents {
        let mut gcs = GeneratorComponents {
            generator_components: HashMap::new(),
            num_qubits: num_qubits,
        };

        gcs.init_generators(plus_state_generators);
        gcs
    }

    // By default initializes the generator components to all zero state generators, i.e.:
    // ZII..II, IZI..II ... II..IZ
    // If plus_state_generators is true, then the generators are initialized to plus state generators, i.e.:
    // XII..II, IXI..II ... II..IX
    fn init_generators(&mut self, plus_state_generators: bool) {
        for i in 0..self.num_qubits {
            let comp = Component::ith_generator(self.num_qubits, i, plus_state_generators).unwrap();
            self.generator_components.insert(comp.pstr.copy(), comp);
        }
    }

    pub fn is_zero_state_generators(&mut self) -> bool {
        return self.is_x_or_z_generators(true)
    }

    pub fn is_plus_state_generators(&mut self) -> bool {
        return self.is_x_or_z_generators(false)
    }

    fn is_x_or_z_generators(&mut self, check_zero_state: bool) -> bool {

        self.clean();

        let mut generator_present = bitvec![0; self.num_qubits as usize];

        for component in self.generator_components.values() {
            
            let ind = component.is_generator(check_zero_state);

            if ind == -1 {
                return false;
            } else {
                generator_present.set(ind as usize, true);
            }
        }

        for gen in generator_present {
            if !gen {
                return false;
            }
        }
        true
    } 

    // Removes all invalid components
    fn clean(&mut self) {
        let mut to_remove: Vec<PauliString> = Vec::new();

        for component in self.generator_components.values_mut() {

            component.remove_zero_coefficient_generators();

            if !component.valid() {
                to_remove.push(component.pstr.copy());
            }
        }

        for pstr in to_remove {
            self.generator_components.remove(&pstr);
        }
    }

    pub fn conjugate(&mut self, gate: &Gate, stats: &mut Stats, conjugate_dagger: bool) -> Result<(), Box<dyn Error>> {

        let mut gcs_after_conjugation: HashMap<PauliString, Component> = HashMap::new();

        for component in self.generator_components.values_mut() {

            match gate.gate_type {
                GateType::T => {

                    let new_component= component.conjugate_t_gate(gate.qubit_1, conjugate_dagger)?;

                    if let Some(new_component) = new_component {
                        Self::insert_or_merge(&mut gcs_after_conjugation, new_component, stats)?;
                    }

                },
                _ => {
                    component.conjugate_clifford(gate, conjugate_dagger)?;
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
