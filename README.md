# CTQC: Clifford + T Quantum Circuit Equivalence Checker

A rust implementation of a quantum circuit equivalence checker based on the stabilizer formalism. The theory behind the code and the code itself is explained in more detail in `TODO` (reference thesis).

## Usage

In the future we will explore the possibility of packaging the code as a library or providing Python bindings, but for now the code has to be compiled manually. This can be done using the `cargo build` command. The application can also be run directly using `cargo run`. To check whether two circuits are equivalent the following command can be used:

```
cargo run --release -- -f circuit1.ctqc -e circuit2.ctqc 
```

For large circuits it can be useful to add the `-p` flag, which will print a progress bar to the terminal. Other parameters that can set can be viewed by using the `--help` flag:

```
cargo run --release -- --help
```

The base directory contains an example circuit with random gates. To experiment with the usage of the tool this circuit can be used. For example, by checking trivial equivalence: 

```
cargo run --release -- -f example.ctqc -e example.ctqc -p
```

## Circuit File Formats

The circuits that can be specified within these files is currently very limited. In future version we will look at the integration of QASM circuits, but as that is not the focus of this project we use a custom simplified format. There are five gates that can be used: H, S, CNOT, T and Rz(angle). Each gate of the circuit should be placed on a separate line and should be followed by the target qubit(s). In case of a CNOT the integers denote the control and target qubit respectively.

### Example

```
H 0
CNOT 0 1
Rz(0.5) 0
S 1
T 2
H 3
```

## Simulation

While we can theoretically perform simulations by only providing a single circuit file through the `-f` flag, for most circuits this will be computationally too intensive. The reasons for this is because of the specific way we use the stabilizer formalism. This is explained in `TODO` (reference thesis).
