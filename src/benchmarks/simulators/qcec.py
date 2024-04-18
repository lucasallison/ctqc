from typing import Tuple
from abc import ABC, abstractmethod
from interface import Simulator
from mqt import qcec
import time

class qcec(Simulator):

    def equivalent(self, circuit_1: str, circuit_2: str) -> Tuple[bool, float]:
        start_time = time.time()
        result = qcec.verify(circuit_1, circuit_2)
        end_time = time.time()
        execution_time = end_time - start_time
        return (result.equivalence, execution_time)