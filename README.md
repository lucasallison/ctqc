# Quantum Cicrcuit Simulator

A rust implementation of a quantum circuit simulator based on the stabilizer formalism. 

## Usage

In the future we will explore the possibility of packinging the code as a library or providing Python bindings, but for now the code has to be compiled manually. This can be done using the command 'cargo build'. The application can also be run directly using 'cargo run'. 

Command line arguments:

- f: Specify a file containing a quantum circuit to simulate.
- e: Optional second file containing a quantum circuit. When specified an equivalence check will be run between the circuit of the first file and this one. 
- v: Verbose mode. Information about the simulation is printed to the standard output. 
- h: Print help

### Examples

Simulate a circuit: 

```
cargo run --- -f circuit
```

Check equivalence between two circuits:  
 
```
cargo run --- -f circuit1 -e circuit2
```

## Circuit File Formats

Circuits are read from files. For a full specification of accepted file format, see the [documentation](doc/circuit_file_format.md).

## Implemenation (Background)

This section briefly describes the theory behind the simulator. For a more detailed explaination, see: TODO 

### Stabilizer Formalism

A quantum state |ψ> is stabilized by U if U|ψ> = |ψ>, i.e., |ψ> is an eigenvector of U. The set of stabilizers of a state form a group under multiplication and uniquely define it. Since a group can be represented by
its generators, we can uniquely represent a quantum state by the generators of its stabilizers.

Given an arbitrary unitary U, a state |ψ> and one of its stabilizers g, then the following holds:

U|ψ> = Ug|ψ> = UgU^†U|ψ>.

From this we can see that if g stabilizes |ψ> then UgU^† stabilizes U|ψ>. More specifically, we know that if G is the set that generates the stabilizers of |ψ> then { UgU^† | g ∈ G } is the set that generates the stabilizers of U|ψ>.

### Simulation

The simulator relies on the stabilizer formalism by intializing the generators of the all zero state and subsequently conjugating the generators for each gate in the circuit. The result will be a set of generators that stabilize the state that would result from applying the circuit to the all zero state.

### Equivalence checking

For two circuits U and V to be equivalent we have to check whether UV^†|0> = |0> and UV^†|+> = |+>. This means that if we simulate the circuit UV^† twice, once starting with the generators of the all zero state and once with the generators of the all plus state, and in both cases we end up with the generators we started with we can conclude that the circuits are equivalent.
