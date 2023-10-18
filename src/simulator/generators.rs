use bitvec::prelude::*;
use core::panic;
use std::collections::{hash_map::Entry, HashMap};
use std::error::Error;
use std::fmt;

use super::component::Component;
use super::pauli_string::PauliString;
use crate::circuit::{Gate, GateType};

pub struct Stats {
    pub num_merges: usize,
}

impl Stats {
    pub fn new() -> Stats {
        Stats { num_merges: 0 }
    }
}

pub struct GeneratorComponents {
    generator_components: Vec<Component>,
    num_qubits: u32,
}

impl GeneratorComponents {
    pub fn new(num_qubits: u32, zero_state_generators: bool) -> GeneratorComponents {
        let mut gcs = GeneratorComponents {
            generator_components: Vec::with_capacity(num_qubits as usize),
            num_qubits,
        };

        gcs.init_generators(zero_state_generators);
        gcs
    }

    /// By default initializes the generator components to all zero state generators, i.e.:
    /// ZII..II, IZI..II ... II..IZ.
    /// If plus_state_generators is true, then the generators are initialized to plus state generators, i.e.:
    /// XII..II, IXI..II ... II..IX.
    fn init_generators(&mut self, zero_state_generators: bool) {
        for i in 0..self.num_qubits {
            let comp = Component::ith_generator(self.num_qubits, i, zero_state_generators).unwrap();
            self.generator_components.push(comp);
        }
    }

    pub fn is_x_or_z_generators(&mut self, check_zero_state: bool) -> bool {
        self.clean();

        let mut generator_present = bitvec![0; self.num_qubits as usize];

        for component in self.generator_components.iter() {
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
    pub fn clean(&mut self) -> Result<(), Box<dyn Error>> {
        let mut comp_map: HashMap<PauliString, usize> = HashMap::new();
        let len = self.generator_components.len();
        let mut highest_valid_index: usize = 0;

        for i in 0..len {
            match comp_map.entry(self.generator_components[i].pstr.clone()) {
                Entry::Occupied(e) => {
                    let (l, r) = self.generator_components.split_at_mut(i);

                    // TODO
                    if *e.get() >= l.len() {
                        panic!("Invalid index");
                    }

                    let c1 = &mut l[*e.get()];
                    let c2 = &(r[0]);
                    c1.merge(c2)?;
                }
                Entry::Vacant(e) => {
                    self.generator_components[i].remove_zero_coefficient_generators();

                    if self.generator_components[i].valid() {
                        self.generator_components.swap(highest_valid_index, i);
                        e.insert(highest_valid_index);
                        highest_valid_index += 1;
                    }
                }
            }
        }

        self.generator_components.truncate(highest_valid_index);

        Ok(())
    }

    pub fn conjugate(
        &mut self,
        gate: &Gate,
        stats: &mut Stats,
        conjugate_dagger: bool,
    ) -> Result<(), Box<dyn Error>> {
        let len = self.generator_components.len();

        for i in 0..len {
            let component = &mut self.generator_components[i];

            match gate.gate_type {
                GateType::T => {
                    let new_component =
                        component.conjugate_t_gate(gate.qubit_1, conjugate_dagger)?;

                    if new_component.is_some() {
                        self.generator_components.push(new_component.unwrap());
                    }
                }
                _ => {
                    component.conjugate_clifford(gate, conjugate_dagger)?;
                }
            }
        }

        Ok(())
    }

    // TODO ownsership component
    // fn insert_or_merge(
    //     map: &mut HashMap<PauliString, Component>,
    //     component: Component,
    //     stats: &mut Stats,
    // ) -> Result<(), Box<dyn Error>> {
    //     let pstr = component.pstr.clone();
    //     match map.entry(pstr) {
    //         Entry::Occupied(mut c) => {
    //             let c = c.get_mut();

    //             let valid = c.merge(&component)?;

    //             stats.num_merges += 1;
    //             if !valid {
    //                 map.remove(&component.pstr);
    //             }
    //         }
    //         Entry::Vacant(e) => {
    //             e.insert(component);
    //         }
    //     }
    //     Ok(())
    // }

    pub fn len(&self) -> usize {
        self.generator_components.len()
    }
}

impl fmt::Display for GeneratorComponents {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        for component in self.generator_components.iter() {
            write!(f, "{}\n", component)?;
        }
        Ok(())
    }
}
