import sys, math
import numpy as np
import cirq 
from cirq.contrib.qasm_import import circuit_from_qasm

f = open(str(sys.argv[1]), 'r')

circuit = circuit_from_qasm(f.read())

print("Simulating...")
simulator = cirq.Simulator()

# STATE VECTOR
result = simulator.simulate(circuit)
final_state_vector = result.final_state_vector
print('Computational Basis States and Amplitudes:')
for i, amplitude in enumerate(final_state_vector):
    n_qubits = int(math.log(len(final_state_vector), 2))
    state = np.binary_repr(i, n_qubits)
    print(f'|{state}> - {amplitude}')

# MESUREMENTS
# res = simulator.run(circuit, repetitions=1)  
# digits = 3
# for reg, measurements in res.measurements.items():
#     measurements = [m[0] for m in measurements]
#     print(f"{reg}: 0 -> {round(measurements.count(0) / len(measurements), digits)}, 1 -> {round(measurements.count(1) / len(measurements), digits)}")
