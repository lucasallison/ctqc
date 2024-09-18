use ordered_float::Float;

use super::floating_point_opc::FloatingPointOPC;

/// A set that can be associated to a Pauli string. The list
/// keeps track of the generators that the Pauli string belongs to (i.e.,
/// the Pauli string is part of the sum of Pauli strings that make up the generator)
/// and its coefficient.
#[derive(Clone)]
pub struct CoefficientList {
    // Generator index, coefficient, number of floating point operations to determine fp error margin
    pub coefficients: Vec<(usize, FloatingPointOPC)>,
}

impl CoefficientList {
    /// Create a new Coeffients list with a single coefficient
    /// set to 1.0 associated to the provided generator index.
    pub fn new(generator_index: usize) -> CoefficientList {
        CoefficientList {
            coefficients: vec![(generator_index, FloatingPointOPC::new(1.0))],
        }
    }

    pub fn new_with_coef(generator_index: usize, coef: f64) -> CoefficientList {
        CoefficientList {
            coefficients: vec![(generator_index, FloatingPointOPC::new(coef))],
        }
    }

    pub fn get_first_index(&self) -> usize {
        if self.coefficients.is_empty() {
            panic!("Coefficient list is empty.");
        }
        self.coefficients[0].0
    }

    pub fn get_first_coef(&self) -> FloatingPointOPC {
        if self.coefficients.is_empty() {
            panic!("Coefficient list is empty.");
        }
        self.coefficients[0].1
    }


    /// Multiply all coefficients with the provided value
    /// fp_ops are the number of floating point operations performed on provided f64.
    pub fn multiply(&mut self, fp: &FloatingPointOPC) {
        for (_, coefficient) in self.coefficients.iter_mut() {
            coefficient.mul(fp);
        }
    }

    /// Return the sum of all stored coefficients
    pub fn sum(&self) -> f64 {
        let mut sum = FloatingPointOPC::new(0.0);
        for (_, f) in self.coefficients.iter() {
            sum.add(f);
        }
        sum.as_f64()
    }

    /// Merge the provided coeffiencts list with the current one.
    /// Ensures that the coefficients are sorted by (generator) index.
    pub fn merge(&mut self, other: &CoefficientList) {
        let mut merged_coefficients =
            Vec::with_capacity(self.coefficients.len() + other.coefficients.len());
        let mut it_self = self.coefficients.iter_mut().peekable();
        let mut it_other = other.coefficients.iter().peekable();

        while it_self.peek() != None && it_other.peek() != None {
            let (self_index, mut self_coefficient) = it_self.peek().unwrap();
            let (other_index, other_coefficient) = it_other.peek().unwrap();

            if self_index < other_index {
                merged_coefficients.push(it_self.next().unwrap().clone());
            } else if self_index > other_index {
                merged_coefficients.push(it_other.next().unwrap().clone());
            } else {
                self_coefficient.merge(other_coefficient);
                merged_coefficients.push((*self_index, self_coefficient));
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

    /// Returns true if the Coeffients list is empty, i.e. all coefficients are zero.
    pub fn is_empty(&self) -> bool {
        for (_, f) in self.coefficients.iter() {
            if !(f.eq(&FloatingPointOPC::new(0.0))) {
                return false;
            }
        }
        true
    }
    
    /// Returns if the coefficient list would be valid for the ith generator.
    /// This is the case if:
    /// 1. The coefficient list only contains the coefficient of the ith generator
    /// 2. The coefficient is 1.0.
    pub fn is_valid_ith_generator_coef_list(&self, i: usize) -> bool {
        for (gen_index, f) in self.coefficients.iter() {
            // If this is a coefficient for a different generator, check if it is zero
            if *gen_index != i && !(f.eq(&FloatingPointOPC::new(0.0))) {
                return false;
            }

            // If it is the coefficient for the ith generator, check if it is 1.0
            if *gen_index == i && !(f.eq(&FloatingPointOPC::new(1.0))) {
                return false;
            }
        }
        true
    }
}
