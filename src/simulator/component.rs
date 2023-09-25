use std::fmt;
use std::error::Error;
use std::collections::HashMap;
use lazy_static::lazy_static;

use super::pauli_string::{PauliGate, PauliString};
use crate::circuit::{Gate, GateType};
use super::simulator_errors::ConjugationError;

lazy_static! {
    static ref ONE_OVER_SQRT_TWO: f64 = 1.0 / f64::sqrt(2.0);
}

#[derive(Clone, Copy)]
pub struct GeneratorInfo {
    generator_index: u32,
    coefficient: f64,
}

impl GeneratorInfo {
    pub fn new(generator_index: u32) -> GeneratorInfo {
        GeneratorInfo {
            generator_index: generator_index,
            coefficient: 1.0,
        }
    }

    pub fn get_index(&self) -> u32 {
        self.generator_index
    }

    pub fn get_coefficient(&self) -> f64 {
        self.coefficient
    }
}

#[derive(Clone)]
pub struct Component {
    pub pstr: PauliString,
    pub generator_info: Vec<GeneratorInfo>, 
}

impl Component {
    pub fn new(pstr: PauliString) -> Component {
        Component {
            pstr,
            generator_info: Vec::new(),
        }
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

        // Look up how the pauli string changes as a result of the conjugation
        // TODO unwrap
        let look_up_output = match gate.gate_type {
            GateType::H => H_CONJ_UPD_RULES.get(&target_pauli_gate).unwrap(),
            GateType::S => S_CONJ_UPD_RULES.get(&target_pauli_gate).unwrap(),
            _ => panic!("This should not happen"),
        };

        // If applicable we update the coefficient
        if look_up_output.coefficient != 1{
            for generator_info in &mut self.generator_info {
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


    // TODO this function needs to be made more efficient
    pub fn merge(&mut self, other: &Component) {

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
