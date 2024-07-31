import sys, time, json, ast
from qiskit.quantum_info import Statevector
from qiskit import QuantumCircuit

circuit_1 = sys.argv[1]
circuit_2 = sys.argv[2]

try:
    start = time.time()
    qc1 = QuantumCircuit.from_qasm_file(circuit_1)
    qc2 = QuantumCircuit.from_qasm_file(circuit_2)
    res = Statevector.from_instruction(qc1).equiv(Statevector.from_instruction(qc2))
    end = time.time()
    ret = dict()
    ret['runtime'] = end - start
    ret['equivalence'] = res
    print(ret)
except Exception as e:
    print(f"{e}", sys.stderr)
