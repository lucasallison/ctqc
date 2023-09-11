use std::fmt;

#[derive(Debug)]
pub struct CircuitError {
    pub message: String,
}

impl fmt::Display for CircuitError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "CircuitError: {}", self.message)
    }
}
