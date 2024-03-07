import sys
import cirq 
from cirq.contrib.qasm_import import circuit_from_qasm

f = open(str(sys.argv[1]), 'r')

circuit = circuit_from_qasm(f.read())

print("Simulating...")
simulator = cirq.Simulator()
res = simulator.run(circuit, repetitions=20000)  

digits = 3
for reg, measurements in res.measurements.items():
    measurements = [m[0] for m in measurements]
    print(f"{reg}: 0 -> {round(measurements.count(0) / len(measurements), digits)}, 1 -> {round(measurements.count(1) / len(measurements), digits)}")