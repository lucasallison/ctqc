# CTQC: Clifford + T Quantum Circuit Equivalence Verifier

A Rust implementation of a quantum circuit equivalence verification tool based on the generalized stabilizer formalism. This project was conducted as part of my master’s thesis and both the underlying theory and the implementation details are discussed extensively in the [thesis](thesis.pdf). 

## Usage

The code can be compiled using the `cargo build` command. The application can also be run directly using `cargo run`. To check whether two circuits are equivalent the following command can be used:

```
cargo run --release -- -f circuit1.ctqc -e circuit2.ctqc 
```

For large circuits it can be useful to add the `-p` flag, which will print a progress bar to the terminal. Other parameters that can set can be viewed by using the `--help` flag:

```
cargo run --release -- --help
```

The circuits directory contains an example circuit with random gates. To experiment with the usage of the tool this circuit can be used. For example, by checking trivial equivalence: 

```
cargo run --release -- -f circuits/example.ctqc -e circuits/example.ctqc -p
```

## Circuit File Formats

The quantum circuits are represented using a custom file format. Each line in the file specifies one of five possible gates: H, S, CNOT, T, or Rz(angle), followed by the target qubit(s). For the CNOT gate, the integers represent the control and target qubits in that order.

### Example

```
H 0
CNOT 0 1
Rz(0.5) 0
S 1
T 2
H 3
```

### OpenQASM 

Since the current proof of concept requires only a few operations, quantum circuits can be represented using a simplified file format instead of the more comprehensive OpenQASM file format. QASM files can be converted to the custom file format by using the `qasm_to_ctqc.py` script. To do so, first install Qiskit:

```
pip install qiskit
```

Afterwards, the script can be used to convert QASM files:

```
python qasm_to_ctqc.py -f circuit.qasm -o circuit.ctqc
```

### Example Circuits

The `circuits` directory includes example circuits in a custom file format. Moreover, the `mqt_benchmarks.tar.gz` tarball contains both the original and optimized versions of the circuits from the [MQT benchmark set](https://www.cda.cit.tum.de/mqtbench/), also in the custom format.

## Simulation

Although it is theoretically possible to run simulations by specifying a single circuit file using the -f flag, this approach is computationally demanding for most circuits. The reason lies in the particular use of the stabilizer formalism, as detailed [here](thesis.pdf). However, for certain circuits, simulations remain feasible by incorporating a measurement gate into the circuit:

```
M target_qubit
```

For example, you can run the Bell circuit with the following command:

```
cargo run --release -- -f circuits/bell_circuit.ctqc
```
