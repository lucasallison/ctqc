pub struct ImaginaryCoef {
    pub real: f64,
    pub i: bool,
}

impl ImaginaryCoef {
    pub fn new(real: f64, i: bool) -> ImaginaryCoef {
        ImaginaryCoef { real, i }
    }

    pub fn multiply(&mut self, other: &ImaginaryCoef) {
        self.real = self.real * other.real;
        if self.i && other.i {
            self.real *= -1.0;
        }
        self.i ^= other.i;
    }

    pub fn mutliply_with_f64(&mut self, other: f64) {
        self.real *= other;
    }

    pub fn divide(&mut self, other: &ImaginaryCoef) {
        let mut divisor = other.real;
        if other.i {
            divisor *= -1.0 * other.real;
        }
        self.multiply(other);
        self.real /= divisor;
    }

    pub fn divide_by_f64(&mut self, other: f64) {
        self.real /= other;
    }
}