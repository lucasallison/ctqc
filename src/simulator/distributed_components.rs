// use std::collections::BTreeMap;
use std::collections::HashMap;
use lazy_static::lazy_static;

use super::pauli_string::PauliGate;
use crate::circuit::{Gate, GateType};

static NON_I_PAULI_GATES: [PauliGate; 3] = [PauliGate::X, PauliGate::Y, PauliGate::Z];

pub struct PauliGateAtIndex {
    pgate: PauliGate,
    global_coefficient: f64,
    // maps the index of a component to the coefficient of the component
    generator_info: Option<HashMap<usize, f64>>,
}

impl PauliGateAtIndex {
    pub fn new(pgate: PauliGate) -> PauliGateAtIndex {
        PauliGateAtIndex {
            pgate: pgate,
            // TODO I think this can be a bool?
            global_coefficient: 1.0,
            generator_info: None,
        }
    }

    pub fn insert_generator_info(&mut self, index: usize, coefficient: f64) {
        if self.generator_info.is_none() {
            self.generator_info = Some(HashMap::new());
        }
        self.generator_info.as_mut().unwrap().insert(index, coefficient);
    }   

    pub fn change_gate(&mut self, pgate: &PauliGate) {
        self.pgate = *pgate;
    }

    pub fn multiply_coefficient(&mut self, coefficient: f64) {
        self.global_coefficient *= coefficient;
    }

    pub fn get_generator_info(&self) -> Option<&HashMap<usize, f64>> {
        self.generator_info.as_ref()
    }

    pub fn reset(&mut self, pgate: &PauliGate) {
        self.pgate = *pgate;
        self.global_coefficient = 1.0;
        self.generator_info = None;
    }

    pub fn merge(&mut self, other: PauliGateAtIndex) {

        if self.pgate != other.pgate {
            panic!("Cannot merge PauliGateAtIndex structs with different Pauli gates");
        }

        if other.generator_info.is_none() {
            return;
        }

        self.global_coefficient *= other.global_coefficient;

        if !self.generator_info.is_none() {
            self.generator_info.as_mut().unwrap().extend(other.generator_info.unwrap());
        } else {
            self.generator_info = other.generator_info;
        }
    }
}

// Manages a triple of 'PauliGateAtIndex' structs
pub struct PauliGatesAtIndex {
    pub pgates_at_index: [PauliGateAtIndex; 3],
}

impl PauliGatesAtIndex {
    fn new() -> PauliGatesAtIndex {
        PauliGatesAtIndex {
            pgates_at_index: [PauliGateAtIndex::new(PauliGate::X), 
                              PauliGateAtIndex::new(PauliGate::Y), 
                              PauliGateAtIndex::new(PauliGate::Z)],
        }
    }

    // Adds generator info to one of the PauliGateAtIndex structs
    pub fn add_generator_info(&mut self, index: usize, coefficient: f64, target_pgate: &PauliGate) {
        for pgate in &mut self.pgates_at_index {
            if pgate.pgate == *target_pgate {
                pgate.insert_generator_info(index, coefficient);
                return;
            }
        }

        self.reorder();
        self.add_generator_info(index, coefficient, target_pgate)
    }

    // Ensures that we have a PauliGateAtIndex struct for 
    // all three non I Pauli gates
    pub fn reorder(&mut self) {

        let mut new_pgates_at_index = [PauliGateAtIndex::new(PauliGate::X), 
                                       PauliGateAtIndex::new(PauliGate::Y), 
                                       PauliGateAtIndex::new(PauliGate::Z)];

        for pgate in &mut self.pgates_at_index {

            match pgate.pgate {
                PauliGate::X => new_pgates_at_index[0].merge(pgate),
                PauliGate::Y => new_pgates_at_index[1].merge(pgate),
                PauliGate::Z => new_pgates_at_index[2].merge(pgate),
                _ => panic!("PauliGateAtIndex struct has Pauli gate I"),
            }
        }
        self.pgates_at_index = new_pgates_at_index; 
    }

}

pub struct DistributedComponents {
    pgates: Vec<PauliGatesAtIndex>,
}

impl DistributedComponents {
    fn new (num_qubits: usize) -> DistributedComponents {
        // TODO calculate to allocate memory
        let mut pgates = Vec::new();
        for i in 0..num_qubits {
            pgates.push(PauliGatesAtIndex::new());
        }

        let mut dcmps = DistributedComponents { 
            pgates: pgates,
        };
        dcmps.all_zero_state_generators(num_qubits);

        dcmps
    }

    fn all_zero_state_generators(&mut self, num_qubits: usize) {
        // for i in 0..num_qubits {
        //     // let pgates_at_ind = self.get_gates_at_index(i);

        //     for pgate in pgates_at_ind {
        //         if pgate.pgate == PauliGate::Z {
        //             pgate.insert_generator_info(i, 1.0);
        //         } 
        //     }
        // }
    }

    // TODO error handling in all conjugate functions
    pub fn conjugate(&mut self, gate: &Gate) {




    } 

    // When we conjugate with an H or S gate we do not update the generator info individually.
    // We just update the global gate and global coefficient.
    fn conjugate_h_s(&mut self, gate: &Gate) {


        // for pgate in pgates_at_ind {

        //     let look_up_output = match gate.gate_type {
        //         GateType::H => H_CONJ_UPD_RULES.get(&pgate.pgate).unwrap(),
        //         GateType::S => S_CONJ_UPD_RULES.get(&pgate.pgate).unwrap(),
        //         _ => panic!("Gate type not supported"),
        //     };
        

        //     pgate.pgate = look_up_output.p_gate;
        //     pgate.global_coefficient *= look_up_output.coefficient as f64;
        // }

    }

    fn conjugate_cnot(&mut self, gate: &Gate) {

        let qubit_2 = gate.qubit_2.unwrap();
            

        
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


    #[test]
    fn reorder() {

        let mut pgates_at_ind = super::PauliGatesAtIndex::new();

        pgates_at_ind.pgates_at_index[0].insert_generator_info(1, 1.0);
        pgates_at_ind.pgates_at_index[1].insert_generator_info(2, 2.0);

        pgates_at_ind.pgates_at_index[0].change_gate(&crate::simulator::pauli_string::PauliGate::Y);

        pgates_at_ind.reorder();

        assert!(pgates_at_ind.pgates_at_index[0].pgate == crate::simulator::pauli_string::PauliGate::X);
        assert!(pgates_at_ind.pgates_at_index[0].get_generator_info().is_none());
        assert!(pgates_at_ind.pgates_at_index[1].pgate == crate::simulator::pauli_string::PauliGate::Y);
        assert!(pgates_at_ind.pgates_at_index[2].pgate == crate::simulator::pauli_string::PauliGate::Z);
        assert!(pgates_at_ind.pgates_at_index[2].get_generator_info().is_none());

        for (k, v) in pgates_at_ind.pgates_at_index[1].generator_info.unwrap().iter() {
            if *k == 1 { 
                assert!(*v == 1.0);
            } else if *k == 2 {
                assert!(*v == 2.0);
            } else {
                panic!("Unexpected generator info");
            }
        }

    }
}

