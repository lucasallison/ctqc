import os
from typing import Dict
from simulators.utils import exec_subprocess
from simulators.interface import Simulator


class QuokkaSharp(Simulator):

    def __init__(self):
        self.quokka_sharp_verify_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "scripts", "quokka_verify.py")

    def name(self):
        return 'QuokkaSharp'
    
    def simulate(self):
        pass

    def equivalence_check(self, circuit_1: str, circuit_2: str) -> Dict:
        cmd = ['python3', self.quokka_sharp_verify_path, circuit_1, circuit_2]
        return exec_subprocess(cmd)