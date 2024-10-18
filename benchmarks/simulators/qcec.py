import os
from typing import Dict
from simulators.interface import Simulator
from simulators.utils import exec_subprocess_with_memory_limit


class QCEC(Simulator):

    def __init__(self):
        self.qcec_verify_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "scripts", "qcec_verify.py")

    def name(self):
        return 'QCEC'
    
    def simulate(self, circuit) -> Dict:
        pass

    def equivalence_check(self, circuit_1: str, circuit_2: str) -> Dict:
        cmd = ['python3', self.qcec_verify_path, circuit_1, circuit_2]
        return exec_subprocess_with_memory_limit(cmd)