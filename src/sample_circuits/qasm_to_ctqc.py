import sys
from qiskit import QuantumCircuit, Aer, execute
from qiskit.quantum_info import Operator
from qiskit.compiler import transpile
import matplotlib.pyplot as plt
import re

coupling_string = [[0, 1], [0,2], [1,2]]
if len(sys.argv) != 2:
    print("Usage: python qasm_to_ctqc.py /path/to/file.qasm")
    exit(1)

qasm_file = sys.argv[1]
qc = QuantumCircuit.from_qasm_file(qasm_file)

result = transpile(qc, basis_gates=['h', 's', 'cx', 'rz'], optimization_level=1, seed_transpiler=1) 
qc_transpiled = result.qasm(formatted=False)

for line in qc_transpiled.splitlines():
    line = line.rstrip()
    if re.match(r"h", line):
        print(line)
    