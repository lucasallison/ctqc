/// Helper structs shared among the generator set implementations
pub mod coefficient_list;
pub mod h_s_conjugations_map;

// Floating point error margin
pub static FP_ERROR_REMOVE_MARGIN: f64 = 0.000000001;
pub static FP_ERROR_CHECK_MARGIN: f64 =  FP_ERROR_REMOVE_MARGIN * 100.0;