import sys
import time
from qiskit import QuantumCircuit
from qiskit import QuantumCircuit, Aer, execute


f_in = sys.argv[1]

qc = QuantumCircuit.from_qasm_file(f_in)
backend = Aer.get_backend("qasm_simulator")
start = time.time()
execute(qc, backend, shots=1)
end = time.time()
print("-> %s seconds" % round((end-start), 3))
