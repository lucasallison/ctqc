use std::fmt;


static SINGLE_FP_OP_ERROR_MARGIN: f64 = f64::EPSILON;

/// 'Floating point with operation counter': counts the number of operations
/// performed on it to make accurate floating point error margin calculations.
#[derive(Clone, Copy)]
pub struct FloatingPointOPC {
    f: f64,
    ops: usize,
}

impl FloatingPointOPC {

    pub fn new(f: f64) -> FloatingPointOPC {
        FloatingPointOPC {
            f: f, 
            ops: 0,
        }
    }

    pub fn new_with_ops(f: f64, ops: usize) -> FloatingPointOPC {
        FloatingPointOPC {
            f: f, 
            ops: ops,
        }
    }

    pub fn add(&mut self, fp: &FloatingPointOPC) {
        self.f = self.f + fp.f;
        self.ops += 1 + fp.ops;
    }

    pub fn mul(&mut self, fp: &FloatingPointOPC) {
        self.f = self.f * fp.f;
        self.ops += 1 + fp.ops;
    }

    pub fn div(&mut self, fp: &FloatingPointOPC) {
        self.f = self.f * fp.f;
        self.ops += 1 + fp.ops;
    }

    pub fn cos(&mut self) {
        self.f = self.f.cos();
        self.ops += 1; 
    }

    pub fn sin(&mut self) {
        self.f = self.f.sin();
        self.ops += 1; 
    }

    pub fn as_f64(&self) -> f64 {
        self.f
    }

}

impl PartialEq for FloatingPointOPC {
    /// Returns whether the two floating point numbers are equal within an error margin
    fn eq(&self, fp: &FloatingPointOPC) -> bool {
        if self.f.is_nan() || fp.f.is_nan() {
            return self.f.is_nan() && fp.f.is_nan();
        }

        // Plus one to account for the subtraction
        let total_ops = (self.ops + fp.ops + 1) as f64;

        // We don't have to worry about overflow because the floats we 
        // use are between -1.0 and 1.0
        (self.f - fp.f).abs() < (SINGLE_FP_OP_ERROR_MARGIN * total_ops)
    }
}

impl fmt::Display for FloatingPointOPC {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{}", self.f)
    }
}