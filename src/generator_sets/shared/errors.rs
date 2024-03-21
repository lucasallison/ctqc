use snafu::prelude::*;

// TODO
#[derive(Debug, Snafu)]
pub enum GenertorSetError {
    #[snafu(display("Character is not a valid Pauli gate"))]
    CannotConjugateGate {},


    #[snafu(display("Invalid gate: can only conjugate H, S, CNOT or Rz gates"))]
    InvalidGateToConjugate {},
}
