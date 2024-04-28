from abc import ABC
from typing import Tuple
from abc import ABC, abstractmethod
from typing import Tuple

class Simulator(ABC):

    @abstractmethod
    def name(self) -> str:
        """
        Get the name of the simulator.
        """
        pass

    @abstractmethod
    def file_extension(self) -> str:
        """
        Get the file extension of the circuit files that the simulator uses.

        Returns:
            str: The file extension.
        """
        pass

    @abstractmethod
    def equivalent(self, circuit_1: str, circuit_2) -> Tuple[bool, float, int]:
        """
        Check if two files are equivalent.

        Args:
            file1 (str): Path to the first file.
            file2 (str): Path to the second file.

        Returns:
            tuple: A tuple containing a boolean indicating whether the circuits are equivalent, 
            the runtime in seconds and the RSS.
        """
        pass
