import sys
import os
import signal
from pathlib import Path

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from simulators.qcec import QCEC
from simulators.ctqc import CTQC
from simulators.interface import Simulator

def find_file(dir: str, file_name: str):
    files = list(Path(dir).rglob('*'))
    for file in files:
        f_name = os.path.basename(file).split('.')[0]
        if f_name == file_name:
            return file
    return None

def check_equivalance(simulator: Simulator, dir1: str, dir2: str, timeout: int=1):
    
    def timeout_handler(signum, frame):
        raise Exception("Timeout")

    signal.signal(signal.SIGALRM, timeout_handler)

    dir1_circuits = list(Path(dir1).rglob('*'))
    for dir1_circuit in dir1_circuits:
        circuit_name = os.path.basename(dir1_circuit).split('.')[0]
        dir2_circuit = find_file(dir2, circuit_name)

        if dir2_circuit == None:
            print(f'{circuit_name} not found in {dir2}')
            continue
    
        signal.alarm(timeout)
        try:
            res = simulator.equivalent(str(dir1_circuit), str(dir2_circuit))
            print(f"* {circuit_name}: equivalent = {res[0]} ({res[1]} seconds)")
        except:
            print(f"* {circuit_name}: Timeout")


        

if __name__ == "__main__":

    # The Quokka benchmarks directory has the follwoing structure:
    # base_dir/circuit_type/file_format/circuits

    BENCHMARK_BASE_DIR = Path(os.path.dirname(os.path.abspath(__file__)))
    CIRCUIT_TYPES = ['z_add']
    CIRCUIT_DIR_PAIRS = [('origin', 'opt')]
    # SIMULATORS = [QCEC()]
    SIMULATORS = [CTQC(), QCEC()]

    for simulator in SIMULATORS:
        print(f"{simulator.name()}")

        for circuit_type in CIRCUIT_TYPES:

            equiv_dir_pairs_full = [(os.path.join(BENCHMARK_BASE_DIR, circuit_type, simulator.file_extension(), pair[0]), os.path.join(
                BENCHMARK_BASE_DIR, circuit_type, simulator.file_extension(), pair[1])) for pair in CIRCUIT_DIR_PAIRS]

            for pair in equiv_dir_pairs_full:
                check_equivalance(simulator, pair[0], pair[1])