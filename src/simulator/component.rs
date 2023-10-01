use std::fmt;
use std::error::Error;
use std::collections::HashMap;
use lazy_static::lazy_static;
use ordered_float::OrderedFloat;

use super::pauli_string::{PauliGate, PauliString};
use crate::circuit::{Gate, GateType};
use super::simulator_errors::{ComponentError, ConjugationError};

lazy_static! {
    static ref ONE_OVER_SQRT_TWO: f64 = 1.0 / f64::sqrt(2.0);
}

#[derive(Clone, Copy, Hash, PartialEq, Eq)]
pub struct GeneratorInfo {
    generator_index: u32,
    coefficient: OrderedFloat<f64>,
}

impl GeneratorInfo {
    pub fn new(generator_index: u32) -> GeneratorInfo {
        GeneratorInfo {
            generator_index: generator_index,
            coefficient: OrderedFloat(1.0),
        }
    }

    pub fn get_index(&self) -> u32 {
        self.generator_index
    }

    pub fn get_coefficient(&self) -> OrderedFloat<f64> {
        self.coefficient
    }
}

#[derive(Clone)]
pub struct Component {
    pub pstr: PauliString,
    pub generator_info: Vec<GeneratorInfo>
}

impl Component {
    pub fn new(pstr: PauliString) -> Component {
        Component {
            pstr,
            generator_info: Vec::new(),
        }
    }

    // Returns a compolnent representing the ith generator of the all zero state.
    // I.e., II..IZI..II -> Pauli string with Z on ith place
    pub fn all_zero_state_generator(num_qubits: u32, i: u32) -> Result<Component, ComponentError> {

        if i >= num_qubits {
            return Err(ComponentError { message: format!("Tried creating the ith generator of the all zero state, 
                                                          but in a circuit of {num_qubits} qubits there are only {num_qubits} generators. ") });
        }

        let mut generator = PauliString::new(num_qubits as usize);
        generator.set_pauli_gate(i as usize, PauliGate::Z).unwrap();

        let mut comp = Component::new(generator); 
        comp.generator_info.push(GeneratorInfo::new(i));

        Ok(comp)
    }

    // The bool indicates whether the pauli string in the 
    // component has changed
    pub fn conjugate_clifford(&mut self, gate: &Gate) -> Result<bool, Box<dyn Error>> {
        match gate.gate_type {
            GateType::H => {
                return self.h_s_conjugation(gate);
            },
            GateType::CNOT => {
                return self.cnot_conjugation(gate);
            },
            GateType::S => {
                return self.h_s_conjugation(gate);
            },
            _ => {
                Err(Box::from(ConjugationError
                    {message: "Cannot use 'conjugate_clifford' function for a non clifford gate".to_string()}))
            },
        }
    }

    // Return true if the pauli string changed
    fn h_s_conjugation(&mut self, gate: &Gate) -> Result<bool, Box<dyn Error>> {

        let target_pauli_gate = self.pstr.get_pauli_gate(gate.qubit_1 as usize)?;

        // Identity gate does not change from conjugation
        if target_pauli_gate == PauliGate::I {
            return Ok(false);
        } 

        // Look up how the Pauli string changes as a result of the conjugation
        let look_up_output = match gate.gate_type {
            GateType::H => H_CONJ_UPD_RULES.get(&target_pauli_gate).unwrap(),
            GateType::S => S_CONJ_UPD_RULES.get(&target_pauli_gate).unwrap(),
            _ => return Err(Box::from(ConjugationError{message: "Cannot use 'h_s_conjugation' function for a non H or S gate".to_string()})),
        };

        // If applicable we update the coefficient
        if look_up_output.coefficient != 1 {
            for generator_info in self.generator_info.iter_mut() {
                generator_info.coefficient *= look_up_output.coefficient as f64;
            }
        }

        // No change; return immediately
        if !look_up_output.pstr_changed {
            return Ok(false);
        }

        // We update the pauli string with the gate resulting from the conjugation
        self.pstr.set_pauli_gate(gate.qubit_1 as usize, look_up_output.p_gate)?;

        Ok(true) 
    }


    fn cnot_conjugation(&mut self, gate: &Gate) -> Result<bool, Box<dyn Error>> {

        let qubit_2 = match gate.qubit_2 {
            Some(qubit_2) => qubit_2,
            None => { return Err(Box::from(ConjugationError{message: "CNOT gate must have a control qubit".to_string()})); }, 
        }; 

        let q1_target_pauli_gate = self.pstr.get_pauli_gate(gate.qubit_1 as usize)?;
        let q2_target_pauli_gate = self.pstr.get_pauli_gate(qubit_2 as usize)?;

        // The pauli string does not change from conjugation
        if !CNOT_CONJ_UPD_RULES.contains_key(&(q1_target_pauli_gate, q2_target_pauli_gate)) {
            return Ok(false);
        }

        let look_up_output = CNOT_CONJ_UPD_RULES.get(&(q1_target_pauli_gate, q2_target_pauli_gate)).unwrap();

        // The pauli string does not change from conjugation
        // TODO maybe just remove them from the map?
        if !look_up_output.pstr_changed {
            return Ok(false);
        }

        // We update the pauli string with the gate resulting from the conjugation
        self.pstr.set_pauli_gate(gate.qubit_1 as usize, look_up_output.q1_p_gate)?;
        self.pstr.set_pauli_gate(qubit_2 as usize, look_up_output.q2_p_gate)?;

        Ok(true)
    }


    // When X, Y are conjugated by T we obtain two compontents. The first component represents
    // the Pauli string with updated coeffients. We do not need to create a new component for this
    // but just update self. The second component does represent a different Pauli string, for which 
    // we create a new component. Since the component does not change when we conjugate an 
    // I, Z we return None in that case and leave self unchanged.
    pub fn conjugate_t_gate(&mut self, target_qubit: u32) -> Result<Option<Component>, Box<dyn Error>> {

        let target_gate = self.pstr.get_pauli_gate(target_qubit as usize)?;

        match target_gate {

            // TXT^{\dagger} -> 1/sqrt(2) (X + Y)
            PauliGate::X => {

                for generator_info in self.generator_info.iter_mut(){
                    generator_info.coefficient *= *ONE_OVER_SQRT_TWO;
                }

                let mut new_self = self.clone();
                new_self.pstr.set_pauli_gate(target_qubit as usize, PauliGate::Y)?;

                return Ok(Some(new_self));
            },

            // TYT^{\dagger} -> 1/sqrt(2) (Y - X)
            PauliGate::Y => {
                for generator_info in self.generator_info.iter_mut(){
                    generator_info.coefficient *= *ONE_OVER_SQRT_TWO;
                }

                let mut new_self = self.clone();
                new_self.pstr.set_pauli_gate(target_qubit as usize, PauliGate::X)?;

                for generator_info in new_self.generator_info.iter_mut(){
                    generator_info.coefficient *= -1.0;
                }

                return Ok(Some(new_self));
            },

            _  => {
                return Ok(None);
            },
        }
    }


    // Merges two components, returns 'true' this Pauli string is a component
    // of any generator, i.e., there exists a non zero coefficient of this Pauli
    // string for a generator.
    // TODO refactor?
    pub fn merge(&mut self, other: Component) -> Result<bool, ComponentError> {

        if self.pstr != other.pstr  {
            return Err(ComponentError { message: "Pauli strings must be equal to merge".to_string() } ); 
        }

        if self.generator_info.len() == 0 || other.generator_info.len() == 0 {
            return Err(ComponentError { message: "Cannot merge components that belong to no generators".to_string() } ); 
            
        }

        let mut merged_generator_info = Vec::<GeneratorInfo>::new();
        let mut ind_self: usize = 0;
        let mut ind_other: usize = 0; 

        while ind_self < self.generator_info.len() && ind_other < other.generator_info.len() {
    
            let self_generator_info = self.generator_info[ind_self];
            let other_generator_info = other.generator_info[ind_other];
    
            if self_generator_info.generator_index == other_generator_info.generator_index {
                let new_coefficient = self_generator_info.coefficient + other_generator_info.coefficient;
                if new_coefficient == OrderedFloat(0.0) {
                    ind_self += 1;
                    ind_other += 1;
                    continue;
                }
                let mut new_generator_info = self_generator_info;
                new_generator_info.coefficient += other_generator_info.coefficient;
                merged_generator_info.push(new_generator_info);
                ind_self += 1;
                ind_other += 1;
            } else if self_generator_info.generator_index < other_generator_info.generator_index {
                merged_generator_info.push(self_generator_info);
                ind_self += 1;
            } else {
                merged_generator_info.push(other_generator_info);
                ind_other += 1;
            }
                
        }

        while ind_self < self.generator_info.len() {
            merged_generator_info.push(self.generator_info[ind_self]);
            ind_self += 1;
        }

        while ind_other < other.generator_info.len() {
            merged_generator_info.push(other.generator_info[ind_other]);
            ind_other += 1;
        }

        self.generator_info = merged_generator_info;
        Ok(self.generator_info.len() > 0)
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


// ---------------- Look up tables for conjugation ------------------

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

        c1.merge(c2).unwrap();

        for generator_info in &c1.generator_info {
            if generator_info.get_index() != 2 {
                assert!(generator_info.get_coefficient() == 2.0 as f64, "Expected: 2.0, got: {}", generator_info.get_coefficient());
            } else {
                assert!(generator_info.get_coefficient() == 1.0 as f64, "Expected: 1.0, got: {}", generator_info.get_coefficient());
            }
        }

        assert!(c1.generator_info[2].get_index() == 2)

    }

    #[test]
    fn test_merge_2() {

        let p1 = pauli_from_str("XIZII");
        let p2 = pauli_from_str("XIZII");

        let mut c1 = Component::new(p1);
        c1.generator_info.push(GeneratorInfo::new(0));
        c1.generator_info.push(GeneratorInfo::new(3));
        c1.generator_info.push(GeneratorInfo::new(4));

        let mut c2 = Component::new(p2);
        c2.generator_info.push(GeneratorInfo::new(0));
        c2.generator_info[0].coefficient = OrderedFloat(-1.0);
        c2.generator_info.push(GeneratorInfo::new(3));
        c2.generator_info.push(GeneratorInfo::new(5));


        assert!(c1.merge(c2).unwrap() == true);


        let target = vec![GeneratorInfo{generator_index: 3, coefficient: OrderedFloat(2.0)},
                          GeneratorInfo{generator_index: 4, coefficient: OrderedFloat(1.0)},
                          GeneratorInfo{generator_index: 5, coefficient: OrderedFloat(1.0)}];

        assert!(c1.generator_info == target);

    }

}