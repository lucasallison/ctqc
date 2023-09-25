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



// ------------------ Tests ---------------------------------------

#[cfg(test)]
mod tests {

    use super::*;
    use crate::simulator::pauli_string::PauliGate;
    use crate::simulator::component::GeneratorInfo;

    fn pauli_from_str(string: &str) -> PauliString {

        let mut pstr = PauliString::new(string.len());
        println!("String: {}", string);

        for (index, char) in string.chars().enumerate() {
            match char {
                'I' => { pstr.set_pauli_gate(index, PauliGate::I).unwrap(); },
                'X' => { pstr.set_pauli_gate(index, PauliGate::X).unwrap(); },
                'Y' => { pstr.set_pauli_gate(index, PauliGate::Y).unwrap(); },
                'Z' => { pstr.set_pauli_gate(index, PauliGate::Z).unwrap(); },
                _ => panic!("Invalid character in Pauli string"),
            }
        }
        pstr
    }


    #[test]
    fn conjugate_with_h_xizii() {

        let input = pauli_from_str("XIZII");
        let output = pauli_from_str("XIXII");

        let hadamard = Gate::new(&"H".to_string(), 2, None).unwrap();

        let mut c = Component::new(input);

        let res = c.conjugate_clifford(&hadamard);

        assert!(c.pstr == output, "Expected: {}, got: {}", output, c.pstr);
        assert!(res.unwrap() == true);
    }

    #[test]
    fn conjugate_with_h_yizii() {

        let input = pauli_from_str("YIZII");
        let output = pauli_from_str("YIZII");

        let hadamard = Gate::new(&"H".to_string(), 0, None).unwrap();

        let mut c = Component::new(input);
        c.generator_info.push(GeneratorInfo::new(0));
        c.generator_info.push(GeneratorInfo::new(1));
        c.generator_info.push(GeneratorInfo::new(3));

        let res = c.conjugate_clifford(&hadamard);

        assert!(res.unwrap() == false);
        assert!(c.pstr == output, "Expected: {}, got: {}", output, c.pstr);

        for generator_info in &c.generator_info {
            assert!(generator_info.get_coefficient() == (-1.0 as f64), "Expected: -1.0, got: {}", generator_info.get_coefficient());
        }
    }

    #[test]
    fn conjugate_with_s_y() {

        let input = pauli_from_str("Y");
        let output = pauli_from_str("X");

        let s_gate = Gate::new(&"S".to_string(), 0, None).unwrap();

        let mut c = Component::new(input);
        c.generator_info.push(GeneratorInfo::new(0));
        c.generator_info.push(GeneratorInfo::new(1));

        let res = c.conjugate_clifford(&s_gate);

        assert!(res.unwrap() == true);
        assert!(c.pstr == output, "Expected: {}, got: {}", output, c.pstr);

        for generator_info in &c.generator_info {
            assert!(generator_info.get_coefficient() == (-1.0 as f64), "Expected: -1.0, got: {}", generator_info.get_coefficient());
        }
    }

    #[test]
    fn conjugate_with_cnot_ixizi() {

        let input = pauli_from_str("IXIZI");
        let output = pauli_from_str("IXIZI");

        let cnot = Gate::new(&"CNOT".to_string(), 1, Some(3)).unwrap();

        let mut c = Component::new(input);
        let res = c.conjugate_clifford(&cnot);

        assert!(res.unwrap() == false);
        assert!(c.pstr == output, "Expected: {}, got: {}", output, c.pstr);
    }

    #[test]
    fn conjugate_with_cnot_ixizii() {

        let input = pauli_from_str("IXIZII");
        let output = pauli_from_str("IXIZXI");

        println!("Input: {}", input);

        let cnot = Gate::new(&"CNOT".to_string(), 1, Some(4)).unwrap();

        let mut c = Component::new(input);
        let res = c.conjugate_clifford(&cnot).unwrap();
    
        assert!(res == true);
        assert!(c.pstr == output, "Expected: {}, got: {}", output, c.pstr);
    }


    #[test]
    fn test_merge() {

        let input1 = pauli_from_str("IXIZII");
        let mut c1 = Component::new(input1);
        c1.generator_info.push(GeneratorInfo::new(0));
        c1.generator_info.push(GeneratorInfo::new(1));
        c1.generator_info.push(GeneratorInfo::new(3));


        let input2 = pauli_from_str("IXIZII");
        let mut c2 = Component::new(input2);
        c2.generator_info.push(GeneratorInfo::new(0));
        c2.generator_info.push(GeneratorInfo::new(1));
        c2.generator_info.push(GeneratorInfo::new(2));
        c2.generator_info.push(GeneratorInfo::new(3));

        c1.merge(&c2);

        for generator_info in &c1.generator_info {
            if generator_info.get_index() != 2 {
                assert!(generator_info.get_coefficient() == 2.0 as f64, "Expected: 2.0, got: {}", generator_info.get_coefficient());
            } else {
                assert!(generator_info.get_coefficient() == 1.0 as f64, "Expected: 1.0, got: {}", generator_info.get_coefficient());
            }
        }

        assert!(c1.generator_info[3].get_index() == 2)

    }

}
