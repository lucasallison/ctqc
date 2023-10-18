use lazy_static::lazy_static;
use ordered_float::OrderedFloat;
use snafu::prelude::*;
use std::error::Error;
use std::fmt;

use super::conjugation_look_up_tables::{
    CNOT_CONJ_UPD_RULES, H_CONJ_UPD_RULES, S_CONJ_UPD_RULES, S_DAGGER_CONJ_UPD_RULES,
};
use super::pauli_string::{PauliGate, PauliString};
use crate::{
    circuit::{Gate, GateType},
    FP_ERROR_MARGIN,
};

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
    pub generator_info: Vec<GeneratorInfo>,
}

impl Component {
    pub fn new(pstr: PauliString) -> Component {
        Component {
            pstr,
            generator_info: Vec::new(),
        }
    }

    // By default returns a componenet representing the ith generator of the all zero state.
    // I.e., II..IZI..II -> Pauli string with Z on ith place
    // If plus_state_generator is true we return the ith generator of the all plus state.
    // I.e., II..IXI..II -> Pauli string with Z on ith place
    pub fn ith_generator(
        num_qubits: u32,
        i: u32,
        zero_state_generator: bool,
    ) -> Result<Component, ComponentError> {
        if i >= num_qubits {
            return Err(ComponentError::InvalidGenerator {
                num_qubits: num_qubits,
            });
        }

        let non_i_gate: PauliGate = if zero_state_generator {
            PauliGate::Z
        } else {
            PauliGate::X
        };

        let mut generator = PauliString::new(num_qubits as usize);
        generator.set_pauli_gate(i as usize, non_i_gate).unwrap();

        let mut comp = Component::new(generator);
        comp.generator_info.push(GeneratorInfo::new(i));

        Ok(comp)
    }

    // Returns wheter the component is a generator of the all zero state state or
    // all plus state (specified by the check_zero_state bool).
    // If so it returns the index of the generator, otherwise -1.
    // It does not check if the component is valid or removes zero coefficient generators.
    pub fn is_generator(&self, check_zero_state: bool) -> i32 {
        // TODO explain
        if !self.generator_info.len() == 1 {
            return -1;
        }

        let gen_coefficient = self.generator_info[0].get_coefficient();

        if gen_coefficient + FP_ERROR_MARGIN < OrderedFloat(1.0) {
            return -1;
        }

        let gen_ind = self.generator_info[0].get_index();
        let target_pauli = if check_zero_state {
            PauliGate::Z
        } else {
            PauliGate::X
        };

        for (i, pgate) in self.pstr.iter().enumerate() {
            if i == (gen_ind as usize) && pgate != target_pauli {
                return -1;
            }
            if i != (gen_ind as usize) && pgate != PauliGate::I {
                return -1;
            }
        }

        gen_ind as i32
    }

    fn multiply_generator_coefficients(&mut self, coefficient: f64) {
        for generator_info in self.generator_info.iter_mut() {
            generator_info.coefficient *= coefficient;
        }
    }

    // The bool indicates whether the pauli string in the
    // component has changed
    pub fn conjugate_clifford(
        &mut self,
        gate: &Gate,
        conjugate_dagger: bool,
    ) -> Result<bool, Box<dyn Error>> {
        match gate.gate_type {
            GateType::H => {
                return self.h_s_conjugation(gate, conjugate_dagger);
            }
            GateType::CNOT => {
                return self.cnot_conjugation(gate);
            }
            GateType::S => {
                return self.h_s_conjugation(gate, conjugate_dagger);
            }
            _ => Err(Box::from(ConjugationError::InvalidCliffordConjugation {})),
        }
    }

    // Return true if the pauli string changed
    // If conjugate_dagger is true we conjugate with the complex conjugate
    // of the gate
    fn h_s_conjugation(
        &mut self,
        gate: &Gate,
        conjugate_dagger: bool,
    ) -> Result<bool, Box<dyn Error>> {
        let target_pauli_gate = self.pstr.get_pauli_gate(gate.qubit_1 as usize)?;

        // Identity gate does not change from conjugation
        if target_pauli_gate == PauliGate::I {
            return Ok(false);
        }

        // Look up how the Pauli string changes as a result of the conjugation
        let look_up_output = match gate.gate_type {
            GateType::H => H_CONJ_UPD_RULES.get(&target_pauli_gate).unwrap(),
            GateType::S => {
                if conjugate_dagger {
                    S_DAGGER_CONJ_UPD_RULES.get(&target_pauli_gate).unwrap()
                } else {
                    S_CONJ_UPD_RULES.get(&target_pauli_gate).unwrap()
                }
            }
            _ => return Err(Box::from(ConjugationError::InvalidHSConjugation {})),
        };

        // If applicable we update the coefficient
        if look_up_output.coefficient != 1 {
            self.multiply_generator_coefficients(look_up_output.coefficient as f64);
        }

        // No change; return immediately
        if !look_up_output.pstr_changed {
            return Ok(false);
        }

        // We update the pauli string with the gate resulting from the conjugation
        self.pstr
            .set_pauli_gate(gate.qubit_1 as usize, look_up_output.p_gate)?;

        Ok(true)
    }

    fn cnot_conjugation(&mut self, gate: &Gate) -> Result<bool, Box<dyn Error>> {
        let qubit_2 = gate.qubit_2.unwrap();

        let q1_target_pauli_gate = self.pstr.get_pauli_gate(gate.qubit_1 as usize)?;
        let q2_target_pauli_gate = self.pstr.get_pauli_gate(qubit_2 as usize)?;

        // The pauli string does not change from conjugation
        if !CNOT_CONJ_UPD_RULES.contains_key(&(q1_target_pauli_gate, q2_target_pauli_gate)) {
            return Ok(false);
        }

        let look_up_output = CNOT_CONJ_UPD_RULES
            .get(&(q1_target_pauli_gate, q2_target_pauli_gate))
            .unwrap();

        if look_up_output.coefficient != 1 {
            self.multiply_generator_coefficients(look_up_output.coefficient as f64);
        }

        // The pauli string does not change from conjugation
        // TODO maybe just remove them from the map?
        if !look_up_output.pstr_changed {
            return Ok(false);
        }

        // We update the pauli string with the gate resulting from the conjugation
        self.pstr
            .set_pauli_gate(gate.qubit_1 as usize, look_up_output.q1_p_gate)?;
        self.pstr
            .set_pauli_gate(qubit_2 as usize, look_up_output.q2_p_gate)?;

        Ok(true)
    }

    // When X, Y are conjugated by T we obtain two compontents. The first component represents
    // the Pauli string with updated coeffients. We do not need to create a new component for this
    // but just update self. The second component does represent a different Pauli string, for which
    // we create a new component. Since the component does not change when we conjugate an
    // I, Z we return None in that case and leave self unchanged.
    pub fn conjugate_t_gate(
        &mut self,
        target_qubit: u32,
        conjugate_dagger: bool,
    ) -> Result<Option<Component>, Box<dyn Error>> {
        let target_gate = self.pstr.get_pauli_gate(target_qubit as usize)?;

        if target_gate == PauliGate::Z {
            return Ok(None);
        }

        let mut new_component: Component;

        match target_gate {
            PauliGate::X => {
                if conjugate_dagger {
                    // T^{\dag}XT -> 1/sqrt{2} (X - Y)
                    self.multiply_generator_coefficients(*ONE_OVER_SQRT_TWO);
                    new_component = self.clone();
                    new_component.multiply_generator_coefficients(-1.0);
                } else {
                    // TXT^{\dag} -> 1/sqrt{2} (X + Y)
                    self.multiply_generator_coefficients(*ONE_OVER_SQRT_TWO);
                    new_component = self.clone();
                }

                new_component
                    .pstr
                    .set_pauli_gate(target_qubit as usize, PauliGate::Y)?;

                return Ok(Some(new_component));
            }

            PauliGate::Y => {
                if conjugate_dagger {
                    // T^{\dag}YT -> 1/sqrt(2) (Y + X)
                    self.multiply_generator_coefficients(*ONE_OVER_SQRT_TWO);
                    new_component = self.clone();
                } else {
                    // TYT^{\dag} -> 1/sqrt(2) (Y - X)
                    self.multiply_generator_coefficients(*ONE_OVER_SQRT_TWO);
                    new_component = self.clone();
                    new_component.multiply_generator_coefficients(-1.0);
                }

                new_component
                    .pstr
                    .set_pauli_gate(target_qubit as usize, PauliGate::X)?;

                return Ok(Some(new_component));
            }

            _ => {
                return Ok(None);
            }
        }
    }

    // Removes all generators with coefficient 0 and returns if the compont is still valid,
    // that is, it is part of at least one generator.
    pub fn remove_zero_coefficient_generators(&mut self) -> bool {
        self.generator_info.retain(|generator_info| {
            generator_info.coefficient - FP_ERROR_MARGIN > OrderedFloat(0.0)
        });
        return self.valid();
    }

    pub fn valid(&self) -> bool {
        self.generator_info.len() > 0
    }

    // Merges two components, returns 'true' this Pauli string is a component
    // of any generator, i.e., there exists a non zero coefficient of this Pauli
    // string for a generator.
    // TODO refactor?
    pub fn merge(&mut self, other: &Component) -> Result<bool, ComponentError> {
        if self.pstr != other.pstr {
            return Err(ComponentError::MergeUnequalPStr {
                pstr_1: self.pstr.clone(),
                pstr_2: other.pstr.clone(),
            });
        }

        if self.generator_info.len() == 0 || other.generator_info.len() == 0 {
            return Err(ComponentError::MergeComponentWithoutGen {});
        }

        let mut merged_generator_info = Vec::<GeneratorInfo>::new();
        let mut ind_self: usize = 0;
        let mut ind_other: usize = 0;

        while ind_self < self.generator_info.len() && ind_other < other.generator_info.len() {
            let self_generator_info = self.generator_info[ind_self];
            let other_generator_info = other.generator_info[ind_other];

            if self_generator_info.generator_index == other_generator_info.generator_index {
                let new_coefficient =
                    self_generator_info.coefficient + other_generator_info.coefficient;
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
            write!(
                f,
                "({}: {}), ",
                generator_info.generator_index, generator_info.coefficient
            )?;
        }
        Ok(())
    }
}

// ------------------ Errors --------------------------------------

#[derive(Debug, Snafu)]
pub enum ComponentError {
    #[snafu(display(
        "Pauli strings must be equal to merge, tried merging: {} and {}",
        pstr_1,
        pstr_2
    ))]
    MergeUnequalPStr {
        pstr_1: PauliString,
        pstr_2: PauliString,
    },

    #[snafu(display("Cannot merge components that belong to no generators"))]
    MergeComponentWithoutGen {},

    #[snafu(display("Tried creating the ith generator, but in a circuit of {} qubits there are only {} generators.", num_qubits, num_qubits))]
    InvalidGenerator { num_qubits: u32 },
}

#[derive(Debug, Snafu)]
pub enum ConjugationError {
    #[snafu(display("Cannot use 'h_s_conjugation' function for a non H or S gate"))]
    InvalidHSConjugation {},

    #[snafu(display("Cannot use 'conjugate_t_gate' function for a non Clifford gate"))]
    InvalidCliffordConjugation {},
}

// ------------------ Tests ---------------------------------------

#[cfg(test)]
mod tests {

    use super::*;
    use crate::simulator::component::GeneratorInfo;
    use crate::simulator::pauli_string::PauliGate;

    fn pauli_from_str(string: &str) -> PauliString {
        let mut pstr = PauliString::new(string.len());
        println!("String: {}", string);

        for (index, char) in string.chars().enumerate() {
            match char {
                'I' => {
                    pstr.set_pauli_gate(index, PauliGate::I).unwrap();
                }
                'X' => {
                    pstr.set_pauli_gate(index, PauliGate::X).unwrap();
                }
                'Y' => {
                    pstr.set_pauli_gate(index, PauliGate::Y).unwrap();
                }
                'Z' => {
                    pstr.set_pauli_gate(index, PauliGate::Z).unwrap();
                }
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

        let res = c.conjugate_clifford(&hadamard, false);

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

        let res = c.conjugate_clifford(&hadamard, false);

        assert!(res.unwrap() == false);
        assert!(c.pstr == output, "Expected: {}, got: {}", output, c.pstr);

        for generator_info in &c.generator_info {
            assert!(
                generator_info.get_coefficient() == (-1.0 as f64),
                "Expected: -1.0, got: {}",
                generator_info.get_coefficient()
            );
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

        let res = c.conjugate_clifford(&s_gate, false);

        assert!(res.unwrap() == true);
        assert!(c.pstr == output, "Expected: {}, got: {}", output, c.pstr);

        for generator_info in &c.generator_info {
            assert!(
                generator_info.get_coefficient() == (-1.0 as f64),
                "Expected: -1.0, got: {}",
                generator_info.get_coefficient()
            );
        }
    }

    #[test]
    fn conjugate_with_cnot_ixizi() {
        let input = pauli_from_str("IXIZI");
        let output = pauli_from_str("IYIYI");

        let cnot = Gate::new(&"CNOT".to_string(), 1, Some(3)).unwrap();

        let mut c = Component::new(input);
        let res = c.conjugate_clifford(&cnot, false);

        assert!(res.unwrap() == true);
        assert!(c.pstr == output, "Expected: {}, got: {}", output, c.pstr);
    }

    #[test]
    fn conjugate_with_cnot_ixizii() {
        let input = pauli_from_str("IXIZII");
        let output = pauli_from_str("IXIZXI");

        let cnot = Gate::new(&"CNOT".to_string(), 1, Some(4)).unwrap();

        let mut c = Component::new(input);
        let res = c.conjugate_clifford(&cnot, false).unwrap();

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

        c1.merge(&c2).unwrap();

        for generator_info in &c1.generator_info {
            if generator_info.get_index() != 2 {
                assert!(
                    generator_info.get_coefficient() == 2.0 as f64,
                    "Expected: 2.0, got: {}",
                    generator_info.get_coefficient()
                );
            } else {
                assert!(
                    generator_info.get_coefficient() == 1.0 as f64,
                    "Expected: 1.0, got: {}",
                    generator_info.get_coefficient()
                );
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

        assert!(c1.merge(&c2).unwrap() == true);

        let target = vec![
            GeneratorInfo {
                generator_index: 3,
                coefficient: OrderedFloat(2.0),
            },
            GeneratorInfo {
                generator_index: 4,
                coefficient: OrderedFloat(1.0),
            },
            GeneratorInfo {
                generator_index: 5,
                coefficient: OrderedFloat(1.0),
            },
        ];

        assert!(c1.generator_info == target);
    }
}
