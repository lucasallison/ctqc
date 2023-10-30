use ordered_float::OrderedFloat;

/// A set that can be associated to a Pauli string. The list
/// keeps track of generators that the Pauli belongs to (i.e., it
/// is the generator or if the generator is a sum of Pauli strings
/// it is one of the Pauli strings that make up the generator) and
/// its coefficient.
#[derive(Clone, Hash, PartialEq, Eq)]
pub struct CoefficientList {
    pub coefficients: Vec<(usize, OrderedFloat<f64>)>,
}

impl CoefficientList {
    /// Create a new Coeffients list with a single generator.
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

    /// Returns true if the Coeffients list is empty or if there are only
    /// coefficients with value 0.
    pub fn is_empty(&self) -> bool {
        if self.coefficients.is_empty() {
            return true;
        }
        // We consider a Coeffients list empty if all coefficients are 0
        for (_, coefficient) in self.coefficients.iter() {
            if *coefficient != OrderedFloat::from(0.0) {
                return false;
            }
        }
        true
    }
}

#[cfg(test)]
mod tests {

    use super::*;

    #[test]
    fn test_coefficient_merge() {
        let mut c1 = CoefficientList::new(0);
        let mut c2 = CoefficientList::new(0);
        let mut c3 = CoefficientList::new(1);
        let c4 = CoefficientList::new(2);
        let c5 = CoefficientList::new(1);

        c2.multiply(-0.5);
        c3.multiply(0.5);

        c2.merge(&c3);
        c1.merge(&c2);
        c1.merge(&c4);
        c1.merge(&c5);

        assert_eq!(c1.coefficients.len(), 3);

        for (i, coefficient) in c1.coefficients.iter() {
            match i {
                0 => assert_eq!(coefficient, &OrderedFloat::from(0.5)),
                1 => assert_eq!(coefficient, &OrderedFloat::from(1.5)),
                2 => assert_eq!(coefficient, &OrderedFloat::from(1.0)),
                _ => panic!("Invalid index"),
            }
        }
    }
}
