use std::collections::HashMap;
use lazy_static::lazy_static;

use super::pauli_string::{PauliString, PauliGate};
use crate::circuit::{Gate, GateType};


struct GeneratorInfo {
    generator_index: u32,
    coefficient: f64,
    i: bool,
}

impl GeneratorInfo {
    fn new(generator_index: u32) -> GeneratorInfo {
        GeneratorInfo {
            generator_index: generator_index,
            coefficient: 1.0,
            i: false,
        }
    }
}

struct Component {
    pstr: PauliString,
    generator_info: Vec<GeneratorInfo>, 
    conjugation_status: u32,
}

impl Component {
    fn new(pstr: PauliString) -> Component {
        Component {
            pstr,
            generator_info: Vec::new(),
            conjugation_status: 0,
        }
    }

    // The bool indicates whether the pauli string in the 
    // component has changed
    fn conjugate(&mut self, gate: &Gate) -> bool {
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
            GateType::T => {
                // TODO
                return false;
            },
        }
    }
}


mod tests {

    use super::*; 

    #[test]
    // Conjugate with Hadamard
    fn conjugate_with_h_xizii() {

        let hadamard = Gate::new(&"H".to_string(), 2, None).unwrap();

        // XIZII -> XIXII
        let mut c = Component::new(PauliString::from_str("XIZII"));

        let res = c.conjugate(&hadamard);

        assert!(c.pstr == PauliString::from_str("XIXII"), "Expected: XIXII, got: {}", c.pstr);
        assert!(res == true);
    }

    #[test]
    fn conjugate_with_h_yizii() {

        let hadamard = Gate::new(&"H".to_string(), 0, None).unwrap();

        // YIZII -> -YIZII
        let mut c = Component::new(PauliString::from_str("YIZII"));
        c.generator_info.push(GeneratorInfo::new(0));
        c.generator_info.push(GeneratorInfo::new(1));
        c.generator_info.push(GeneratorInfo::new(3));

        let res = c.conjugate(&hadamard);

        assert!(res == false);
        assert!(c.pstr == PauliString::from_str("YIZII"), "Expected: YIZII, got: {}", c.pstr);

        for generator_info in &c.generator_info {
            assert!(generator_info.coefficient == (-1.0 as f64), "Expected: -1.0, got: {}", generator_info.coefficient);
        }
    }


}


pub struct GeneratorComponents {
    generator_components: HashMap<PauliString, Component>,
}

impl GeneratorComponents {

    pub fn new() -> GeneratorComponents {
        GeneratorComponents {
            generator_components: HashMap::new(),
        }
    }


    pub fn conjugate(&mut self, gate: &Gate) {
        // for (key, value) in map {
        // }
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
                                    p_gate: PauliGate::Y, 
                                    coefficient: -1, 
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


