use snafu::prelude::*;

// TODO
#[derive(Debug, Snafu)]
pub enum GenertorSetErrors {
    #[snafu(display("Character is not a valid Pauli gate"))]
    CannotConjugateGate {},
}