import sys
import cirq
from cirq.contrib.qasm_import import circuit_from_qasm


f = open(str(sys.argv[1]), 'r')


circuit = circuit_from_qasm(f.read())

simulator = cirq.Simulator()
result = simulator.run(circuit)
print(result)