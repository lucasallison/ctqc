import os
from typing import Dict
from simulators.utils import exec_subprocess_with_memory_limit, kill_user_processes, remove_files_from_dir
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

        kill_user_processes('lucas', 'gpmc')
        remove_files_from_dir('/var/tmp', 'quokka')
        remove_files_from_dir('/tmp', 'quokka')

        return exec_subprocess_with_memory_limit(cmd, dirs=['/var/tmp', '/tmp'], pattern='quokka')


if __name__=='__main__':
    import sys
    qs = QuokkaSharp()
    c1 = sys.argv[1]
    c2 = sys.argv[2]
    print(qs.equivalence_check(c1, c2))