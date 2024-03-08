import sys
import re
import cirq 

if len(sys.argv) != 2:
    print("Usage: python ctqc_with_cirq.py <circuit_file>")
    exit(1)

def get_qubit(qubits, index):
    for qubit in qubits:
        if isinstance(qubit, cirq.LineQubit) and qubit.x == index:
            return qubit
    qubit = cirq.LineQubit(index)
    qubits.append(qubit)
    return qubit


qubits = []
circuit = cirq.Circuit()
with open(str(sys.argv[1]), 'r') as circuit_file:
    for gate in circuit_file:
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
            print(f"TODO {gate}", sys.stderr)
            exit(-1)
        else:
            print(f"Invalid gate: {gate}", file=sys.stderr)
            exit(-1)


print("Simulating...")
simulator = cirq.Simulator()
res = simulator.run(circuit, repetitions=20000)  

digits = 3
for reg, measurements in res.measurements.items():
    measurements = [m[0] for m in measurements]
    print(f"{reg}:", end=' ')
    print(f"0 -> {round(measurements.count(0) / len(measurements), digits)}", end=' ')
    print(f"1 -> {round(measurements.count(1) / len(measurements), digits)}")