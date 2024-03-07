import sys
import re
import cirq 

if len(sys.argv) != 2:
    print("Usage: python ctqc_with_cirq.py <circuit_file>")
    exit(1)

gates = []
with open(str(sys.argv[1]), 'r') as circuit_file:
    for gate in circuit_file:
        gate = gate.strip()
        if re.match("^(H|S|M) (\d+)$", gate):
            pass
        elif re.match("^CNOT (\d+) (\d+)$", gate):
            pass
        elif re.match("T (\d+)$", gate):
            pass
        elif re.match("^Rz\(.*\) (\d+)$", gate):
            print(f"TODO {gate}", sys.stderr)
            exit(-1)
            pass
        else:
            print(f"Invalid gate: {gate}", sys.stderr)
            exit(-1)

exit(0) 

circuit = circuit_from_qasm(f.read())

print("Simulating...")
simulator = cirq.Simulator()
res = simulator.run(circuit, repetitions=20000)  

digits = 3
for reg, measurements in res.measurements.items():
    measurements = [m[0] for m in measurements]
    print(f"{reg}:", end=' ')
    print(f"0 -> {round(measurements.count(0) / len(measurements), digits)}", end=' ')
    print(f"1 -> {round(measurements.count(1) / len(measurements), digits)}")