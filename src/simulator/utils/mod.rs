use lazy_static::lazy_static;

pub mod optional_progress_bar;

lazy_static! {
    pub static ref DAG_CHAR: char = std::char::from_u32(8224).unwrap();
}

pub fn z_x_print_char(check_zero_state_generators: bool) -> char {
    if check_zero_state_generators {
        return 'Z';
    } else {
        return 'X';
    };
}
