import sys
import os 
import time
import subprocess
import json
from typing import Tuple
from pathlib import Path

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from simulators.interface import Simulator

class CTQC(Simulator):

    def __init__(self):

        script_dir = Path(os.path.dirname(os.path.abspath(__file__)))
        ctqc_dir_index = list(script_dir.parts).index('ctqc')
        
        binary_sub_path = 'ctqc/target/release/ctqc'
        path_to_ctqc_dir = os.path.join(*list(script_dir.parts)[:ctqc_dir_index])

        self.binary_path = os.path.join(path_to_ctqc_dir, binary_sub_path)
    
    def name(self) -> str:
        return 'CTQC'

    def equivalent(self, circuit_1: str, circuit_2: str) -> Tuple[bool, float]:
        
        start_time = time.time()
        res = subprocess.run([self.binary_path, '-f' , circuit_1, '-e', circuit_2], capture_output=True)
        end_time = time.time()
        execution_time = end_time - start_time
        res = json.loads(res.stdout.decode())
        return res['equivalent'], execution_time
    
    def file_extension(self) -> str:
        return 'ctqc'