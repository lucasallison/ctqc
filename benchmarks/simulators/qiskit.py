import os
from typing import Dict, List
from simulators.interface import Simulator
from simulators.utils import exec_subprocess


class Qiskit(Simulator):

    def __init__(self):
        self.qiskit_sim_path = os.path.join(os.path.dirname( os.path.abspath(__file__)), "scripts", "qiskit_sim.py")
        self.qiskit_verify_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "scripts", "qiskit_verify.py")

    def name(self):
        return 'Qiskit'

    def simulate(self, circuit: str) -> Dict:
        cmd = ['python3', self.qiskit_sim_path, circuit]
        return exec_subprocess(cmd)

    def equivalence_check(self, circuit_1: str, circuit_2: str) -> Dict:
        cmd = ['python3', self.qiskit_verify_path, circuit_1, circuit_2]
        return exec_subprocess(cmd)
