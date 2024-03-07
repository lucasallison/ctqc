
// TODO rename to ImaginaryCoef/ImCoef
pub struct ComplexCoef {
    pub real: f64,
    pub i: bool
}

impl ComplexCoef {
    pub fn new(real: f64, i: bool) -> ComplexCoef {
        ComplexCoef {
            real,
            i
        }
    }
    
    pub fn multiply(&mut self, other: &ComplexCoef) {
        self.real = self.real * other.real;
        if self.i && other.i {
            self.real *= -1.0;
        }
        self.i ^= other.i;
    }

    pub fn mutliply_with_f64(&mut self, other: f64) {
        self.real *= other;
    }

    pub fn divide(&mut self, other: &ComplexCoef) {
        let divisor = -1.0 * other.real * other.real;
        self.multiply(other);
        self.real /= divisor;
    }

    pub fn divide_by_f64(&mut self, other: f64) {
        self.real /= other;
    }

}
 

