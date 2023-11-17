import sys
import time
from qiskit import QuantumCircuit
from qiskit import QuantumCircuit, Aer, execute


f_in = sys.argv[1]

qc = QuantumCircuit.from_qasm_file(f_in)
backend = Aer.get_backend("qasm_simulator")
start = time.time()
res = execute(qc, backend, shots=1000)
end = time.time()
print("-> %s seconds" % round((end-start), 3))
print(res.result().get_counts())
