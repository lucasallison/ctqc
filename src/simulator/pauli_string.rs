use std::fmt;

#[derive(PartialEq, Eq, Hash, Clone, Copy)]
pub enum PauliGate {
    I,
    X, 
    Y,
    Z, 
}

impl fmt::Display for PauliGate {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            PauliGate::I => write!(f, "I"),
            PauliGate::X => write!(f, "X"),
            PauliGate::Y => write!(f, "Y"),
            PauliGate::Z => write!(f, "Z"),
        }
    }
}

#[derive(Eq, Hash, Clone)]
pub struct PauliString {
    pstr: Vec<PauliGate>,
}

impl PauliString {

    // Creates a new pauli string of size `size` of only identity gates
    pub fn new(size: usize) -> PauliString {
        PauliString {
            pstr: vec![PauliGate::I; size],
        }
    }

    pub fn set_pauli_gate(&mut self, index: usize, gate: PauliGate) {
        // TODO error handling
        self.pstr[index] = gate;
    }

    pub fn get_pauli_gate(&self, index: usize) -> &PauliGate {
        // TODO error handling
        &self.pstr[index]
    }

    pub fn copy(&self) -> PauliString {
        PauliString {
            pstr: self.pstr.clone(),
        }
    }

    pub fn from_str(string: &str) -> PauliString {

        let mut pstr = PauliString::new(string.len());

        for (index, char) in string.chars().enumerate() {
            match char {
                'I' => pstr.set_pauli_gate(index, PauliGate::I),
                'X' => pstr.set_pauli_gate(index, PauliGate::X),
                'Y' => pstr.set_pauli_gate(index, PauliGate::Y),
                'Z' => pstr.set_pauli_gate(index, PauliGate::Z),
                _ => panic!("Invalid character in Pauli string"),
            }
        }
        pstr
    }

}

impl PartialEq for PauliString {
    fn eq(&self, other: &Self) -> bool {
        self.pstr == other.pstr
    }
}

impl fmt::Display for PauliString {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let mut result = String::new();
        for gate in &self.pstr {
            result.push_str(&format!("{}", gate));
        }
        write!(f, "{}", result)
    }
}

