use std::fmt;
use std::collections::HashMap;
use lazy_static::lazy_static;

use super::pauli_string::{PauliString, PauliGate};
use crate::circuit::{Gate, GateType};

lazy_static! {
    static ref ONE_OVER_SQRT_TWO: f64 = 1.0 / f64::sqrt(2.0);
}

#[derive(Clone, Copy)]
struct GeneratorInfo {
    generator_index: u32,
    coefficient: f64,
    // TODO 
    // i: bool,
}

impl GeneratorInfo {
    fn new(generator_index: u32) -> GeneratorInfo {
        GeneratorInfo {
            generator_index: generator_index,
            coefficient: 1.0,
            // i: false,
        }
    }
}

#[derive(Clone)]
struct Component {
    pstr: PauliString,
    generator_info: Vec<GeneratorInfo>, 
}

impl Component {
    fn new(pstr: PauliString) -> Component {
        Component {
            pstr,
            generator_info: Vec::new(),
        }
    }

    // The bool indicates whether the pauli string in the 
    // component has changed
    fn conjugate_clifford(&mut self, gate: &Gate) -> bool {
        match gate.gate_type {
            GateType::H => {
                return h_s_conjugation(self, gate);
            },
            GateType::CNOT => {
                return cnot_conjugation(self, gate);
            },
            GateType::S => {
                return h_s_conjugation(self, gate);
            },
            _ => {
                // TODO 
                panic!("Cannot conjugate a non clifford gate")
            },
        }
    }

    // When X, Y are conjugated by T we obtain two compontents. The first component represents
    // the Pauli string with updated coeffients. We do not need to create a new component for this
    // but just update self. The second component does represent a different Pauli string, for which 
    // we create a new component. Since the component does not change when we conjugate an 
    // I, Z we return None in that case and leave self unchanged.
    fn conjugate_t_gate(&mut self, target_qubit: u32) -> Option<Component> {

        let target_gate = self.pstr.get_pauli_gate(target_qubit as usize);

        match target_gate {

            // TXT^{\dagger} -> 1/sqrt(2) (X + Y)
            PauliGate::X => {

                for generator_info in self.generator_info.iter_mut(){
                    generator_info.coefficient *= *ONE_OVER_SQRT_TWO;
                }

                let mut new_component = self.clone();
                new_component.pstr.set_pauli_gate(target_qubit as usize, PauliGate::Y);

                return Some(new_component);
            },

            // TYT^{\dagger} -> 1/sqrt(2) (Y - X)
            PauliGate::Y => {
                for generator_info in self.generator_info.iter_mut(){
                    generator_info.coefficient *= *ONE_OVER_SQRT_TWO;
                }

                let mut new_component = self.clone();
                new_component.pstr.set_pauli_gate(target_qubit as usize, PauliGate::X);

                for generator_info in new_component.generator_info.iter_mut(){
                    generator_info.coefficient *= -1.0;
                }

                return Some(new_component);
            },

            _  => {
                return None
            },
        }
    }

    // TODO this function needs to be made more efficient
    fn merge(&mut self, other: &Component) {

        // TODO error handling
        assert!(self.pstr == other.pstr, "Pauli strings must be equal to merge");

        for generator_info in &other.generator_info {
            let i = self.generator_info.iter()
                               .position(|r| r.generator_index == generator_info.generator_index );
            
            if let Some(i) = i {
                self.generator_info[i].coefficient += generator_info.coefficient;
            } else {
                self.generator_info.push(generator_info.clone());
            }
        }
    }

}

impl fmt::Display for Component {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{}: ", self.pstr)?;
        for generator_info in &self.generator_info {
            write!(f, "({}: {}), ", generator_info.generator_index, generator_info.coefficient)?;
        }
        Ok(())
    }
}

pub struct GeneratorComponents {
    generator_components: HashMap<PauliString, Component>,
}

impl GeneratorComponents {

    fn new() -> GeneratorComponents {
        GeneratorComponents {
            generator_components: HashMap::new(),
        }
    }

    pub fn all_zero_state_generators(num_qubits: u32) -> GeneratorComponents {

        let mut generator_components = GeneratorComponents::new();

        for i in 0..num_qubits {

            // II..IZI..II -> pauli string with Z on ith place
            let mut generator = PauliString::new(num_qubits as usize);
            generator.set_pauli_gate(i as usize, PauliGate::Z);
            
            // Create component for this pauli string and associate it
            // to the ith generator
            let mut comp = Component::new(generator.copy()); 
            comp.generator_info.push(GeneratorInfo::new(i));
            
            generator_components.generator_components.insert(generator, comp);
        }

        generator_components
    }

    pub fn conjugate(&mut self, gate: &Gate) {

        let mut gcs_after_conjugation: HashMap<PauliString, Component> = HashMap::new();

        for component in self.generator_components.values_mut() {

            match gate.gate_type {
                GateType::T => {

                    let new_component= component.conjugate_t_gate(gate.qubit_1);

                    if let Some(new_component) = new_component {
                        Self::insert_or_merge(&mut gcs_after_conjugation, &new_component);
                    }

                },
                _ => {
                    component.conjugate_clifford(gate);
                }, 
            }

            Self::insert_or_merge(&mut gcs_after_conjugation, &component);
        }

        self.generator_components = gcs_after_conjugation;
    }

    // TODO create a map that does this
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

}

impl fmt::Display for GeneratorComponents {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        for component in self.generator_components.values() {
            write!(f, "{}\n", component)?;
        }
        Ok(())
    }
}

// ---------------- CONJUGATION UPDATE RULES ---------------------
struct HSPauliLookUpOutput {
    p_gate: PauliGate,
    // TODO This only has to cost 1 bit
    coefficient: i32,
    pstr_changed: bool,
}

lazy_static! {
    static ref H_CONJ_UPD_RULES: HashMap<PauliGate, HSPauliLookUpOutput> = {
        let mut m = HashMap::new();

        // X -> Z
        m.insert(PauliGate::X, HSPauliLookUpOutput{
                                    p_gate: PauliGate::Z, 
                                    coefficient: 1, 
                                    pstr_changed: true
                                });

        // Y -> -Y
        m.insert(PauliGate::Y, HSPauliLookUpOutput{p_gate: PauliGate::Y, 
                                    coefficient: -1,
                                    pstr_changed: false});

        // Z -> X
        m.insert(PauliGate::Z, HSPauliLookUpOutput{p_gate: PauliGate::X, 
                                    coefficient: 1,
                                    pstr_changed: true});
        m
    };

    static ref S_CONJ_UPD_RULES: HashMap<PauliGate, HSPauliLookUpOutput> = {
        let mut m = HashMap::new();

        // X -> Y
        m.insert(PauliGate::X, HSPauliLookUpOutput{p_gate: PauliGate::Y, 
                                        coefficient: 1, 
                                        pstr_changed: true});
        // Y -> -X
        m.insert(PauliGate::Y, HSPauliLookUpOutput{p_gate: PauliGate::X, 
                                        coefficient: -1, 
                                        pstr_changed: true});
        // Z -> Z
        m.insert(PauliGate::Z, HSPauliLookUpOutput{p_gate: PauliGate::Z, 
                                        coefficient: 1, 
                                        pstr_changed: false});
        m
    };
}

// Return true if the pauli string changed
fn h_s_conjugation(component: &mut Component, gate: &Gate) -> bool {

    let target_pauli_gate = component.pstr.get_pauli_gate(gate.qubit_1 as usize);

    // Identity gate does not change from conjugation
    if *target_pauli_gate == PauliGate::I {
        return false;
    } 

    // Look up how the pauli string changes as a result of the conjugation
    // TODO unwrap
    let look_up_output = match gate.gate_type {
        GateType::H => H_CONJ_UPD_RULES.get(target_pauli_gate).unwrap(),
        GateType::S => S_CONJ_UPD_RULES.get(target_pauli_gate).unwrap(),
        _ => panic!("This should not happen"),
    };

    // If applicable we update the coefficient
    if look_up_output.coefficient != 1{
        for generator_info in &mut component.generator_info {
            generator_info.coefficient *= look_up_output.coefficient as f64;
        }
    }

    // No change; return immediately
    if !look_up_output.pstr_changed {
        return false;
    }
    
    // We update the pauli string with the gate resulting from the conjugation
    component.pstr.set_pauli_gate(gate.qubit_1 as usize, look_up_output.p_gate);

    true
}

// No coefficient change
struct CNOTPauliLookUpOutput {
    q1_p_gate: PauliGate,
    q2_p_gate: PauliGate,
    pstr_changed: bool,
}

lazy_static! {
    static ref CNOT_CONJ_UPD_RULES: HashMap<(PauliGate, PauliGate), CNOTPauliLookUpOutput> = {
        let mut m = HashMap::new();

        // IX -> IX
        m.insert((PauliGate::I, PauliGate::X), CNOTPauliLookUpOutput{q1_p_gate: PauliGate::I, 
                                        q2_p_gate: PauliGate::X, 
                                        pstr_changed: false});
        // XI -> XX
        m.insert((PauliGate::X, PauliGate::I), CNOTPauliLookUpOutput{q1_p_gate: PauliGate::X, 
                                        q2_p_gate: PauliGate::X, 
                                        pstr_changed: true});
        // IY -> ZY
        m.insert((PauliGate::I, PauliGate::Y), CNOTPauliLookUpOutput{q1_p_gate: PauliGate::Z, 
                                        q2_p_gate: PauliGate::Y, 
                                        pstr_changed: true});
        // YI -> YX
        m.insert((PauliGate::Y, PauliGate::I), CNOTPauliLookUpOutput{q1_p_gate: PauliGate::Y, 
                                        q2_p_gate: PauliGate::X, 
                                        pstr_changed: true},   );
        // IZ -> ZZ
        m.insert((PauliGate::I, PauliGate::Z), CNOTPauliLookUpOutput{q1_p_gate: PauliGate::Z, 
                                        q2_p_gate: PauliGate::Z, 
                                        pstr_changed: true});
        // ZI -> ZI
        m.insert((PauliGate::Z, PauliGate::I), CNOTPauliLookUpOutput{q1_p_gate: PauliGate::Z, 
                                        q2_p_gate: PauliGate::I, 
                                        pstr_changed: false});
        m
    };
}

fn cnot_conjugation(component: &mut Component, gate: &Gate) -> bool {

    let qubit_2 = match gate.qubit_2 {
        Some(qubit_2) => qubit_2,
        // TODO error handling? 
        None => panic!("CNOT gate must have two qubits"),
    }; 

    let q1_target_pauli_gate = component.pstr.get_pauli_gate(gate.qubit_1 as usize);
    let q2_target_pauli_gate = component.pstr.get_pauli_gate(qubit_2 as usize);

    // The pauli string does not change from conjugation
    if !CNOT_CONJ_UPD_RULES.contains_key(&(*q1_target_pauli_gate, *q2_target_pauli_gate)) {
        return false;
    }

    let look_up_output = CNOT_CONJ_UPD_RULES.get(&(*q1_target_pauli_gate, *q2_target_pauli_gate)).unwrap();

    // The pauli string does not change from conjugation
    // TODO maybe just remove them from the map?
    if !look_up_output.pstr_changed {
        return false;
    }

    // We update the pauli string with the gate resulting from the conjugation
    component.pstr.set_pauli_gate(gate.qubit_1 as usize, look_up_output.q1_p_gate);
    component.pstr.set_pauli_gate(qubit_2 as usize, look_up_output.q2_p_gate);

    true
}

// ---------------------------------------------------------------

mod tests {

    use super::*; 

    #[test]
    // Conjugate with Hadamard
    fn conjugate_with_h_xizii() {

        let input = PauliString::from_str("XIZII");
        let output = PauliString::from_str("XIXII");

        let hadamard = Gate::new(&"H".to_string(), 2, None).unwrap();

        let mut c = Component::new(input);

        let res = c.conjugate_clifford(&hadamard);

        assert!(c.pstr == output, "Expected: {}, got: {}", output, c.pstr);
        assert!(res == true);
    }

    #[test]
    fn conjugate_with_h_yizii() {

        let input = PauliString::from_str("YIZII");
        let output = PauliString::from_str("YIZII");

        let hadamard = Gate::new(&"H".to_string(), 0, None).unwrap();

        let mut c = Component::new(input);
        c.generator_info.push(GeneratorInfo::new(0));
        c.generator_info.push(GeneratorInfo::new(1));
        c.generator_info.push(GeneratorInfo::new(3));

        let res = c.conjugate_clifford(&hadamard);

        assert!(res == false);
        assert!(c.pstr == output, "Expected: {}, got: {}", output, c.pstr);

        for generator_info in &c.generator_info {
            assert!(generator_info.coefficient == (-1.0 as f64), "Expected: -1.0, got: {}", generator_info.coefficient);
        }
    }

    #[test]
    fn conjugate_with_s_y() {

        let input = PauliString::from_str("Y");
        let output = PauliString::from_str("X");

        let s_gate = Gate::new(&"S".to_string(), 0, None).unwrap();

        let mut c = Component::new(input);
        c.generator_info.push(GeneratorInfo::new(0));
        c.generator_info.push(GeneratorInfo::new(1));

        let res = c.conjugate_clifford(&s_gate);

        assert!(res == true);
        assert!(c.pstr == output, "Expected: {}, got: {}", output, c.pstr);

        for generator_info in &c.generator_info {
            assert!(generator_info.coefficient == (-1.0 as f64), "Expected: -1.0, got: {}", generator_info.coefficient);
        }
    }

    #[test]
    fn conjugate_with_cnot_ixizi() {

        let input = PauliString::from_str("IXIZI");
        let output = PauliString::from_str("IXIZI");

        let cnot = Gate::new(&"CNOT".to_string(), 1, Some(3)).unwrap();

        let mut c = Component::new(input);
        let res = c.conjugate_clifford(&cnot);

        assert!(res == false);
        assert!(c.pstr == output, "Expected: {}, got: {}", output, c.pstr);
    }

    #[test]
    fn conjugate_with_cnot_ixizii() {

        let input = PauliString::from_str("IXIZII");
        let output = PauliString::from_str("IXIZXI");

        let cnot = Gate::new(&"CNOT".to_string(), 1, Some(4)).unwrap();

        let mut c = Component::new(input);
        let res = c.conjugate_clifford(&cnot);

        assert!(res == true);
        assert!(c.pstr == output, "Expected: {}, got: {}", output, c.pstr);
    }


    #[test]
    fn test_merge() {

        let input1 = PauliString::from_str("IXIZII");
        let mut c1 = Component::new(input1);
        c1.generator_info.push(GeneratorInfo::new(0));
        c1.generator_info.push(GeneratorInfo::new(1));
        c1.generator_info.push(GeneratorInfo::new(3));


        let input2 = PauliString::from_str("IXIZII");
        let mut c2 = Component::new(input2);
        c2.generator_info.push(GeneratorInfo::new(0));
        c2.generator_info.push(GeneratorInfo::new(1));
        c2.generator_info.push(GeneratorInfo::new(2));
        c2.generator_info.push(GeneratorInfo::new(3));

        c1.merge(&c2);



        for generator_info in &c1.generator_info {
            println!("Generator index: {}, coefficient: {}", generator_info.generator_index, generator_info.coefficient);
            if generator_info.generator_index != 2 {
                assert!(generator_info.coefficient == 2.0 as f64, "Expected: 2.0, got: {}", generator_info.coefficient);
            } else {
                assert!(generator_info.coefficient == 1.0 as f64, "Expected: 1.0, got: {}", generator_info.coefficient);
            }
        }

        assert!(c1.generator_info[3].generator_index == 2)

    }

}
