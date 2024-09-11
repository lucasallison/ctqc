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

    pub fn merge(&mut self, fp: &FloatingPointOPC) {
        self.f = self.f + fp.f;
        self.ops = std::cmp::max(self.ops, fp.ops) + 1;
    }

    pub fn mul(&mut self, fp: &FloatingPointOPC) {
        self.f = self.f * fp.f;
        if fp.f.abs() != 1.0 {
            self.ops += 1 + fp.ops;
        }
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

    pub fn cmp_threshold(&self, other: &FloatingPointOPC) -> f64 {
        let total_ops = std::cmp::max(1, self.ops + other.ops);
        f64::EPSILON * (total_ops) as f64
    }
}

impl PartialEq for FloatingPointOPC {
    /// Returns whether the two floating point numbers are equal within an error margin
    fn eq(&self, other: &FloatingPointOPC) -> bool {
        if self.f.is_nan() || other.f.is_nan() {
            return self.f.is_nan() && other.f.is_nan();
        }

        // We don't have to worry about overflow because the floats we
        // use are between -1.0 and 1.0
        let res = (self.f - other.f).abs() < self.cmp_threshold(other);
        res
    }
}

impl fmt::Display for FloatingPointOPC {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{} (ops: {})", self.f, self.ops)
    }
}
