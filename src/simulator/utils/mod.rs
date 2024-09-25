use std::collections::{HashMap, hash_map::Entry};
use lazy_static::lazy_static;
use bitvec::prelude::*;
use fxhash::FxBuildHasher;
use crate::generator_sets::shared::coefficient_list::CoefficientList;
use crate::generator_sets::shared::floating_point_opc::FloatingPointOPC;
use crate::generator_sets::pauli_string::utils as PauliUtils;

pub mod optional_progress_bar;

lazy_static! {
    pub static ref DAG_CHAR: char = std::char::from_u32(8224).unwrap();
}

/// Return the character representation of only non-identity Pauli matrix of the 
/// initial stabilizer generator that is used to verify equivalence.
pub fn z_x_print_char(check_zero_state_generators: bool) -> char {
    if check_zero_state_generators {
        return 'Z';
    } else {
        return 'X';
    };
}

/// Half all coefficients in the given map.
pub fn half_all_coefficients(map: &mut HashMap<BitVec, CoefficientList, FxBuildHasher>) {
    for (_, coef_list) in map.iter_mut() {
        coef_list.multiply(&FloatingPointOPC::new(0.5));
    }
}

/// Merge the second map into the first map.
pub fn merge_maps(map1: &mut HashMap<BitVec, CoefficientList, FxBuildHasher>, map2: &mut HashMap<BitVec, CoefficientList, FxBuildHasher>) {
    for (pstr, coef_list) in map2.drain() {
        match map1.entry(pstr) {
            Entry::Occupied(mut entry) => {
                entry.get_mut().merge(&coef_list);
            }
            Entry::Vacant(entry) => {
                entry.insert(coef_list);
            }
        }
    }
}

/// Insert the given coefficient list into the map at the given Pauli string.
pub fn insert_into_map(map: &mut HashMap<BitVec, CoefficientList, FxBuildHasher>, pstr: BitVec, coef_list: CoefficientList) {
    match map.entry(pstr) {
        Entry::Occupied(mut entry) => {
            entry.get_mut().merge(&coef_list);
        }
        Entry::Vacant(entry) => {
            entry.insert(coef_list);
        }
    }

}

/// Return the sum of the coefficients of the Pauli strings in the given map that are of the form Z_i.
pub fn sum_coef_zi_pstrs(pstrs: &HashMap<BitVec, CoefficientList, FxBuildHasher>) -> f64 {
    let mut sum = 0.0;
    for (pstr, coef_list) in pstrs {
        if PauliUtils::is_zi_pstr(pstr) {
            sum += coef_list.sum();
        }
    }

    sum
}
