import stim
import re, time, sys
from typing import Dict
#from simulators.interface import Simulator
from interface import Simulator


class STIM_INTERFACE(Simulator):

    def __init__(self):
        pass

    def name(self):
        return 'STIM'
    
    def simulate(self, circuit) -> Dict:
        pass

    def n_qubits(circuit):

        max_qubit = 0
        with open(circuit, "r") as f:
            lines = f.readlines()
            for line in lines:
                if re.match(r'H (\d+)', line):
                    qubit = int(re.match(r'H (\d+)', line).group(1))
                    max_qubit = max(max_qubit, qubit)
                elif re.match(r'CNOT (\d+) (\d+)', line):
                    m = re.match(r'CNOT (\d+) (\d+)', line)
                    qubit_1 = int(m.group(1))
                    qubit_2 = int(m.group(2))
                    max_qubit = max(max_qubit, qubit_1, qubit_2)
                elif re.match(r'S (\d+)', line):
                    qubit = int(re.match(r'S (\d+)', line).group(1))
                    max_qubit = max(max_qubit, qubit)
                else:
                    print(f"Invalid gate {line}")
        
        return max_qubit+1


    def equivalence_check(self, circuit_1: str, circuit_2: str) -> Dict:

        circuit1 = stim.Circuit.from_file(circuit_1)
        circuit2 = stim.Circuit.from_file(circuit_2)

        only_h = stim.Circuit()
        for i in range(STIM_INTERFACE.n_qubits(circuit_1)):
            only_h.append("H", i)   
        
        circuit1_start_all_plus = only_h + stim.Circuit.from_file(circuit_1)    
        circuit2_start_all_plus = only_h + stim.Circuit.from_file(circuit_2)    

        U = stim.TableauSimulator()
        V = stim.TableauSimulator()

        Plus_U = stim.TableauSimulator()
        Plus_V = stim.TableauSimulator()

        # Start measuring elapsed time
        start_time = time.monotonic()

        # we create the tableaus from circuits:
        U.do(circuit1)
        U.canonical_stabilizers()
    
        V.do(circuit2)
        V.canonical_stabilizers()
    
        Plus_U.do(circuit1_start_all_plus)
        Plus_U.canonical_stabilizers()
    
        Plus_V.do(circuit2_start_all_plus)
        Plus_V.canonical_stabilizers()
    
        # defining
        stabilizers1 = U.canonical_stabilizers()
        stabilizers2 = V.canonical_stabilizers()
    
        # defining
        stabilizers_plus_1 = Plus_U.canonical_stabilizers()
        stabilizers_plus_2 = Plus_V.canonical_stabilizers()

        equivalent = True

        # testing if U and V are equal on |0>^n
        if stabilizers1 != stabilizers2:
            print("U and V are not equivalent on |0>^n")
            equivalent = False

        # testing if U and V are equal on |+>^n
        if stabilizers_plus_1 != stabilizers_plus_2:
            print("U and V are not equivalent on |+>^n")
            equivalent = False

        end_time = time.monotonic()

        return {'equivalent': equivalent, 'runtime': end_time - start_time}



if __name__ == '__main__':

    circuit_1 = sys.argv[1] 
    circuit_2 = sys.argv[2] 

    s = STIM_INTERFACE()
    print(s.equivalence_check(circuit_1, circuit_2))