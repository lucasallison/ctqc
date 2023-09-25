use std::fmt;
use std::error::Error;

// TODO what is the correct way to do this?

#[derive(Debug)]
pub struct ConjugationError {
    pub message: String,
}

impl fmt::Display for ConjugationError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "Conjugation error: {}", self.message)
    }
}

impl Error for ConjugationError {}

#[derive(Debug)]
pub struct ComponentError {
    pub message: String,
}

impl fmt::Display for ComponentError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "Component error: {}", self.message)
    }
}

impl Error for ComponentError {}

