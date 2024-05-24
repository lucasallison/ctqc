use crate::generator_sets::shared::floating_point_opc::FloatingPointOPC;

pub struct ImaginaryCoef {
    pub real: FloatingPointOPC,
    pub i: bool,
}

impl ImaginaryCoef {
    pub fn new(real: f64, i: bool) -> ImaginaryCoef {
        ImaginaryCoef { real: FloatingPointOPC::new(real), i }
    }

    pub fn multiply(&mut self, other: &ImaginaryCoef) {
        self.real.mul(&other.real);
        if self.i && other.i {
            self.real.mul(&FloatingPointOPC::new(-1.0));
        }
        self.i ^= other.i;
    }

    pub fn mutliply_with_fp(&mut self, other: &FloatingPointOPC) {
        self.real.mul(other);
    }

    pub fn divide(&mut self, other: &ImaginaryCoef) {
        let mut divisor = other.real.clone();
        if other.i {
            divisor.mul(&FloatingPointOPC::new(-1.0)); 
        }
        self.multiply(other);
        self.real.div(&divisor);
    }

    pub fn divide_by_fp(&mut self, other: &FloatingPointOPC) {
        self.real.div(other);
    }
}
