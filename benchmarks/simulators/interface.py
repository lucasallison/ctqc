from abc import ABC
from typing import Tuple
from abc import ABC, abstractmethod
from typing import Tuple, Dict


class Simulator(ABC):

    @abstractmethod
    def name(self) -> str:
        """
        Get the name of the simulator.
        """
        pass

    @abstractmethod
    def simulate(self, circuit) -> Dict:
        """
        Simulate the provided circuit
        """
        pass

    @abstractmethod
    def equivalence_check(self, circuit_1: str, circuit_2) -> Dict:
        """
        Check if two files are equivalent.
        """
        pass
