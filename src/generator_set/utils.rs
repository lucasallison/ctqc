
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

}
