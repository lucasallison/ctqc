use std::fmt;
use std::error::Error;

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
