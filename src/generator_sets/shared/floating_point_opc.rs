use std::fmt;

/// 'Floating point with operation counter': counts the number of operations
/// performed on it to make accurate floating point error margin calculations.
#[derive(Clone, Copy)]
pub struct FloatingPointOPC {
    f: f64,
    ops: usize,
}

impl FloatingPointOPC {
    pub fn new(f: f64) -> FloatingPointOPC {
        FloatingPointOPC { f: f, ops: 0 }
    }

    pub fn new_with_ops(f: f64, ops: usize) -> FloatingPointOPC {
        FloatingPointOPC { f: f, ops: ops }
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

    pub fn weak_eq(&self, fp: &FloatingPointOPC) -> bool {
        if self.f.is_nan() || fp.f.is_nan() {
            return self.f.is_nan() && fp.f.is_nan();
        }

        // Plus one to account for the subtraction
        let total_ops = (self.ops + fp.ops + 1) as f64;

        // TODO directly return the result 
        // let res = (self.f - fp.f).abs() < (f64::EPSILON * total_ops * 10.0);
        let res = (self.f - fp.f).abs() < 0.000000001 * 100.0;

        // println!("{} == {}? {}, EM: {}", self.f, fp.f, res, f64::EPSILON * total_ops);

        res
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
        // TODO directly return the result 
        // let res = (self.f - fp.f).abs() < (f64::EPSILON * total_ops);
        let res = (self.f - fp.f).abs() < 0.000000001;

        // println!("{} == {}? {}, EM: {}", self.f, fp.f, res, f64::EPSILON * total_ops);

        res 
    }
}

impl fmt::Display for FloatingPointOPC {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{}", self.f)
    }
}
