use ordered_float::OrderedFloat;

use super::{FP_ERROR_REMOVE_MARGIN, FP_ERROR_CHECK_MARGIN};

/// A set that can be associated to a Pauli string. The list
/// keeps track of the generators that the Pauli string belongs to (i.e.,
/// the Pauli string is part of the sum of Pauli strings that make up the generator)
/// its coefficient.
#[derive(Clone, Hash, PartialEq, Eq)]
pub struct CoefficientList {
    pub coefficients: Vec<(usize, OrderedFloat<f64>)>,
}

impl CoefficientList {
    /// Create a new Coeffients list with a single coefficient
    /// set to 1.0 associated to the provided generator index.
    pub fn new(generator_index: usize) -> CoefficientList {
        CoefficientList {
            coefficients: vec![(generator_index, OrderedFloat::from(1.0))],
        }
    }

    /// Multiply all coefficients with the provided value
    pub fn multiply(&mut self, value: f64) {
        for (_, coefficient) in self.coefficients.iter_mut() {
            *coefficient *= value;
        }
    }

    /// Merge the provided coeffiencts list with the current one.
    /// Ensures that the coefficients are sorted by (generator) index.
    pub fn merge(&mut self, other: &CoefficientList) {
        let mut merged_coefficients =
            Vec::with_capacity(self.coefficients.len() + other.coefficients.len());
        let mut it_self = self.coefficients.iter_mut().peekable();
        let mut it_other = other.coefficients.iter().peekable();

        while it_self.peek() != None && it_other.peek() != None {
            let (self_index, self_coefficient) = it_self.peek().unwrap();
            let (other_index, other_coefficient) = it_other.peek().unwrap();

            if self_index < other_index {
                merged_coefficients.push(it_self.next().unwrap().clone());
            } else if self_index > other_index {
                merged_coefficients.push(it_other.next().unwrap().clone());
            } else {
                merged_coefficients.push((*self_index, *self_coefficient + *other_coefficient));
                it_self.next();
                it_other.next();
            }
        }

        while it_self.peek() != None {
            merged_coefficients.push(it_self.next().unwrap().clone());
        }

        while it_other.peek() != None {
            merged_coefficients.push(it_other.next().unwrap().clone());
        }

        self.coefficients = merged_coefficients;
    }

    /// Returns true if the Coeffients list is empty, that is there
    /// is at least one non zero coefficient.
    /// While checking this it removes any zero coefficient.
    pub fn is_empty(&mut self) -> bool {
        self.coefficients.retain(|(_, f)| {
            *f > OrderedFloat(0.0 + FP_ERROR_REMOVE_MARGIN) || *f < OrderedFloat(0.0 - FP_ERROR_REMOVE_MARGIN)
        });

        self.coefficients.is_empty()
    }

    /// Returns if the coefficient list would be valid for the ith generator.
    /// This is the case if:
    /// 1. The coefficient list only contains the coefficient of the ith generator
    /// 2. The coefficient is 1.0.
    pub fn is_valid_ith_generator_coef_list(&self, i: usize) -> bool {
        self.coefficients.len() == 1
            && self.coefficients[0].0 == i
            && self.coefficients[0].1 < OrderedFloat(1.0 + FP_ERROR_CHECK_MARGIN * 100.0)
            && self.coefficients[0].1 > OrderedFloat(1.0 - FP_ERROR_CHECK_MARGIN * 100.0)
    }

    /// Returns true if the Coeffients list is empty up to the error margin.
    /// The error margin is defined as FP_ERROR_MARGIN * 100.0, i.e., if a coefficient
    /// is within this margin of 0.0 it is considered to be zero.
    pub fn empty_up_to_error_margin(&self) -> bool {
        for (_, f) in self.coefficients.iter() {
            if !(*f < OrderedFloat(0.0 + FP_ERROR_CHECK_MARGIN) && *f > OrderedFloat(0.0 - FP_ERROR_CHECK_MARGIN)) {
                return false
            }
        }
        true
    }
}
