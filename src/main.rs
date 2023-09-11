mod circuit;
mod input_parser;

use input_parser::parse_file;

fn main() {


    let file_path = String::from("/Users/lucas/Dev/thesis/circuits/first.txt");
    // let file_path = String::from("/Users/lucas/Dev/thesis/circuits/wrong.txt");

    // TODO unwrap
    let circuit = parse_file(&file_path).unwrap();

    println!("{}", circuit);
}
