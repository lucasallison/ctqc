import sys, os, subprocess, resource, json, ast
from typing import Tuple
import time

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from simulators.interface import Simulator

class Qiskit(Simulator):

    def __init__(self):
        self.qiskit_verify_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "utils", "qiskit_verify.py")

    def name(self):
        return 'QCEC'
    
    def file_type(self) -> str:
        return 'qasm2'

    def file_extension(self) -> str:
        return 'qasm'

    def equivalent(self, circuit_1: str, circuit_2: str) -> Tuple[bool, float, int]:

        cmd = ['python', self.qiskit_verify_path, circuit_1, circuit_2]

        res = subprocess.run(cmd, capture_output=True)

        try:
            res = ast.literal_eval(res.stdout.decode())
        except Exception as e:
            print(res.stderr.decode())
            raise RuntimeError(f"Failed parsing the result to dict: {res.stdout.decode()} \n {e}")

        max_rss_bytes = resource.getrusage(resource.RUSAGE_CHILDREN).ru_maxrss

        return (res['equivalence'], res['runtime'], max_rss_bytes)
    

if __name__ == "__main__":

    circuit_1 = "quokka_sharp_benchmarks/z_add/qasm2/origin/qft_nativegates_ibm_qiskit_opt0_2.qasm"
    circuit_2 = "quokka_sharp_benchmarks/z_add/qasm2/opt/qft_nativegates_ibm_qiskit_opt0_2.qasm"

    s = Qiskit()
    print(s.equivalent(circuit_1, circuit_2))
    