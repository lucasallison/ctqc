import sys
import time
import signal
from qiskit import QuantumCircuit
from qiskit import QuantumCircuit, Aer, execute


f_in = sys.argv[1]

def handler(signum, frame):
    raise Exception("Simulation timed out")

signal.signal(signal.SIGALRM, handler)
signal.alarm(5)

qc = QuantumCircuit.from_qasm_file(f_in)
backend = Aer.get_backend("qasm_simulator")

start = time.time()
try:
    execute(qc, backend, shots=1)
except Exception as ex:
    print("\n** ", ex,)

end = time.time()
print("-> %s seconds" % round((end-start), 3))
