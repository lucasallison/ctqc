import sys
import os 
from typing import Tuple
from mqt import qcec
import time

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from simulators.interface import Simulator

class QCEC(Simulator):

    def name(self):
        return 'QCEC'

    def equivalent(self, circuit_1: str, circuit_2: str) -> Tuple[bool, float]:
        
        start_time = time.time()
        result = qcec.verify(circuit_1, circuit_2)
        end_time = time.time()
        execution_time = end_time - start_time
        return (result.equivalence, execution_time)
    
    def file_extension(self) -> str:
        return 'qasm'