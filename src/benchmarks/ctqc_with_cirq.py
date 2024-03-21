import sys
import re
import cirq 
import time
import argparse

def get_qubit(qubits, index):
    for qubit in qubits:
        if isinstance(qubit, cirq.LineQubit) and qubit.x == index:
            return qubit
    qubit = cirq.LineQubit(index)
    qubits.append(qubit)
    return qubit


def parse_ctqc_file(ctqc_file_path):
    print("Parsing file...")

    qubits = []
    circuit = cirq.Circuit()
    with open(ctqc_file_path, 'r') as ctqc_file:
        for gate in ctqc_file:
            gate = gate.strip()
            if re.match("^H (\d+)$", gate):
                qubit = get_qubit(qubits, int(gate[2:]))
                circuit.append(cirq.H(qubit))
            elif re.match("^S (\d+)$", gate):
                qubit = get_qubit(qubits, int(gate[2:]))
                circuit.append(cirq.S(qubit))
            elif re.match("^M (\d+)$", gate):
                qubit = get_qubit(qubits, int(gate[2:]))
                circuit.append(cirq.M(qubit))
            elif re.match("^CNOT (\d+) (\d+)$", gate):
                qubit_1 = get_qubit(qubits, int(gate.split(" ")[1]))
                qubit_2 = get_qubit(qubits, int(gate.split(" ")[2]))
                circuit.append(cirq.CNOT(qubit_1, qubit_2))
            elif re.match("T (\d+)$", gate):
                qubit = get_qubit(qubits, int(gate[2:]))
                circuit.append(cirq.T(qubit))
            elif re.match("^Rz\(.*\) (\d+)$", gate):
                print(f"TODO (not yet implemented) {gate}", sys.stderr)
                exit(-1)
            else:
                print(f"Invalid gate: {gate}", file=sys.stderr)
                exit(-1)

    return circuit


def simulate(circuit, repetitions):
    print("Simulating...")

    t0 = time.time()
    simulator = cirq.Simulator()
    res = simulator.run(circuit, repetitions=repetitions)  
    t1 = time.time()
    total = t1-t0
    print(f"Simulation completed in {round(total, 1)} seconds")

    decimal_digits = 3
    print("Measurments:")
    for reg, measurements in res.measurements.items():
        measurements = [m[0] for m in measurements]
        print(f"{reg}:", end=' ')
        print(f"0 -> {round(measurements.count(0) / len(measurements), decimal_digits)}", end=' ')
        print(f"1 -> {round(measurements.count(1) / len(measurements), decimal_digits)}")


if __name__=='__main__':

    parser = argparse.ArgumentParser(description='Execute a CTQC circuit with Cirq.')
    parser.add_argument('-f', metavar='FILE', type=str, required=True,
                    help='Path to the file containing the CTQC circuit.')
    parser.add_argument('-r', metavar='REPETITIONS', type=int, default=1,
                    help='The number of times the simulator simulates the circuit.')

    args = parser.parse_args()

    circuit = parse_ctqc_file(args.f)
    simulate(circuit, args.r)
    
