import os, time, subprocess, json, resource
from typing import Dict, List
from dotenv import load_dotenv
from simulators.utils import exec_subprocess_with_memory_limit
from simulators.interface import Simulator
#from interface import Simulator


class CTQC(Simulator):

    def __init__(self, cmd_line_args: List=None):

        load_dotenv()
        self.binary_path = os.getenv('CTQC_BINARY_PATH')

        self.cmd_line_args = cmd_line_args


    def name(self) -> str:
        return 'CTQC' if self.cmd_line_args is None else 'CTQC' + '_'.join('' if s.startswith('-') else s for s in self.cmd_line_args)


    def simulate(self):
        pass


    def get_subprocess_args(self, circuit_1: str, circuit_2: str) -> List[str]:
        args = [self.binary_path, '-f', circuit_1, '-e', circuit_2]
        if self.cmd_line_args is not None:
            args += self.cmd_line_args
        return args


    def equivalence_check(self, circuit_1: str, circuit_2: str) -> Dict:

        ctqc_circuit_1 = circuit_1.replace('.qasm', '.ctqc')
        ctqc_circuit_2 = circuit_2.replace('.qasm', '.ctqc')

        res = exec_subprocess_with_memory_limit(self.get_subprocess_args(ctqc_circuit_1, ctqc_circuit_2))


        return {'equivalent': res['equivalent'], 'runtime': res['runtime_as_secs'], 'max_rss_bytes': res['max_rss_bytes']}


if __name__=='__main__':

    import sys

    circ_1 = sys.argv[1]
    circ_2 = sys.argv[2]

    ctqc = CTQC()
    print(ctqc.equivalence_check(circ_1, circ_2))
