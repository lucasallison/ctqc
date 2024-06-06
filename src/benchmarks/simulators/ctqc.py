import sys, os, time, subprocess, json, resource
from typing import Tuple
from pathlib import Path

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from simulators.interface import Simulator

class CTQC(Simulator):

    def __init__(self, generator_set: str=None, clean: int=None, equiv_all_generators: bool=None, nbb: int=None, pgl: int=None):

        script_dir = Path(os.path.dirname(os.path.abspath(__file__)))
        ctqc_dir_index = list(script_dir.parts).index('ctqc')
        
        binary_sub_path = 'ctqc/target/release/ctqc'
        path_to_ctqc_dir = os.path.join(*list(script_dir.parts)[:ctqc_dir_index])

        self.binary_path = os.path.join(path_to_ctqc_dir, binary_sub_path)

        # Command line args
        self.generator_set = generator_set
        self.clean = clean
        self.equivalent_all_generators = equiv_all_generators

        if (nbb is not None or pgl is not None) and generator_set != "ptrees":
            raise ValueError("It is only useful to set nbb and pgl when ptrees are used")
        
        self.nbb = nbb
        self.pgl = pgl
    
    def get_subprocess_args(self, circuit_1: str, circuit_2: str):

        args = [self.binary_path, '-f' , circuit_1, '-e', circuit_2]

        if self.generator_set is not None:
            args += ['-d', self.generator_set]
        else:
            args += ['-d', 'map']

        if self.clean is not None:
            args += ['-c', str(self.clean)]

        if self.equivalent_all_generators is not None:
            args += ['-a']
        
        if self.nbb is not None:
            args += ['--nbb', str(self.nbb)]

        if self.pgl is not None:
            args += ['--pgl', str(self.pgl)]

        return args
    
    def name(self) -> str:
        name = 'CTQC'
        if self.generator_set is not None:
            name += f'_{self.generator_set}'
        if self.clean is not None:
            name += f'_c{self.clean}'
        if self.equivalent_all_generators is not None:
            name += '_all_generators'
        if self.nbb is not None:
            name += f'_nbb_{str(self.nbb)}'
        if self.pgl is not None:
            name += f'_pgl_{str(self.pgl)}'

        return name

    def file_type(self) -> str:
        return 'ctqc'

    def file_extension(self) -> str:
        return 'ctqc'

    def equivalent(self, circuit_1: str, circuit_2: str) -> Tuple[bool, float, int]:
        start_time = time.time()
        res = subprocess.run(self.get_subprocess_args(circuit_1, circuit_2), capture_output=True)
        end_time = time.time()
        execution_time = end_time - start_time

        if res.stderr.decode() != '':
            raise RuntimeError(res.stderr.decode())

        max_rss_bytes = resource.getrusage(resource.RUSAGE_CHILDREN).ru_maxrss
        try:
            res = json.loads(res.stdout.decode())
        except Exception as e:
            raise RuntimeError(f'Failed parsing output to json: {res.stdout.decode()} \n {e}')
        return (res['equivalent'], execution_time, max_rss_bytes)


if __name__ == "__main__":

    circuit_1 = "../quokka_sharp_benchmarks/z_add/ctqc/origin/qft_nativegates_ibm_qiskit_opt0_2.ctqc"
    circuit_2 = "../quokka_sharp_benchmarks/z_add/ctqc/opt/qft_nativegates_ibm_qiskit_opt0_2.ctqc"

    s = CTQC()
    print(s.equivalent(circuit_1, circuit_2))