from abc import ABC
from typing import Tuple
from abc import ABC, abstractmethod
from typing import Tuple

class Simulator(ABC):

    @abstractmethod
    def equivalent(self, circuit_1: str, circuit_2) -> Tuple[bool, float]:
        """
        Check if two files are equivalent.

        Args:
            file1 (str): Path to the first file.
            file2 (str): Path to the second file.

        Returns:
            tuple: A tuple containing a boolean indicating whether the files are equivalent and the runtime in seconds.
        """
        pass
