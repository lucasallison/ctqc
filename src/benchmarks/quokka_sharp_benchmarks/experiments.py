import sys
import os
import signal
from pathlib import Path

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from simulators.qcec import QCEC
from simulators.ctqc import CTQC
from simulators.interface import Simulator
import argparse

def find_file(dir: str, file_name: str):
    files = list(Path(dir).rglob('*'))
    for file in files:
        f_name = os.path.basename(file).split('.')[0]
        if f_name == file_name:
            return file
    return None

def check_equivalance(simulator: Simulator, dir1: str, dir2: str, timeout: int=1):

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

def get_circuit_stats(circuit: str) -> list[str]:
    # TODO
    # qubits, clifford gates, rz gates
    return ['1', '2', '3']


def run_collection_benchmarks(base_dir: str, collection: str, circ_type_1: str, circ_type_2: str, simulators: list[Simulator], timeout: int):

    def timeout_handler(signum, frame):
        raise Exception("Timeout")

    signal.signal(signal.SIGALRM, timeout_handler)
    
    table = "\\begin{{center}} \n"
    table += f"\\captionof{{table}}{{Collection: {collection}. Circuits: {circ_type_1} and {circ_type_2}}} \n"
    # 1 row for circuit name
    # 6 rows for characteristics; qubits, clifford gates, rz gates for both circuits
    # For echt simulator 2 rows: time and memory
    table += f"\\begin{{tabular}}{{{'|'+ (7 + 2*len(simulators)) * 'c|'}}} \n"
    table += "\\hline \n"
    table += "\\multirow{2}{*}{\\bfseries Circuit Name} & \n"
    table += "\\multicolumn{3}{|c|}{\\bfseries" + f"{circ_type_1}" + " & \n" 
    table += "\\multicolumn{3}{|c|}{\\bfseries" + f"{circ_type_2}" + " & \n" 
    for simulator in simulators[:-1]:
        table += "\\multicolumn{2}{|c|}{\\bfseries" + f"{simulator.name()}" + " & \n"
    table += "\\multicolumn{2}{|c|}{\\bfseries" + f"{simulators[-1].name()}" + " \\ \n"
    table += "\\cline{2-" + str(7 + 2*len(simulators)) + "} \n"
    table += "& n&c&r & n&c&r" 
    for simulator in simulators:
        table += "& t(sec)&mem(bytes) "
    table += " \\ \n"
    table += "\\hline \n" 
    
    circuit_names = [os.path.basename(path).split('.')[0] for path in list(Path((os.path.join(base_dir, collection, 'qasm', circ_type_1))).rglob('*'))]
    for circuit_name in circuit_names:
        table += f"{circuit_name} & " 
        table += " & ".join(get_circuit_stats(circ_path_t1))
        table += " & "
        table += " & ".join(get_circuit_stats(circ_path_t2))
        table += " & "

        for simulator in simulators:    

            circ_path_t1 = os.path.join(base_dir, collection, simulator.file_extension(), circ_type_1, circuit_name + '.ctqc')
            circ_path_t2 = os.path.join(base_dir, collection, simulator.file_extension(), circ_type_2, circuit_name + '.ctqc')


            signal.alarm(timeout)
            try:
                res = simulator.equivalent(str(circ_path_t1), str(circ_path_t2))
                print(f"* {circuit_name}: equivalent = {res[0]} ({res[1]} seconds)")
            except:
                print(f"* {circuit_name}: Timeout")



    table += "\\end{tabular} \n"
    table += "\\end{center} \n"

    """
    \begin{center}
    \captionof{table}{Your caption here}
    \begin{tabular}{|c|c|c|c|c|c|c|c|c|c|c|}
    \hline
    \multirow{2}{*}{\textbf{Circuit Name}} & 
    \multicolumn{3}{|c|}{\textbf{Origin}} & 
    \multicolumn{3}{|c|}{\bfseries Opt} & 
    \multicolumn{2}{|c|}{\bfseries CTQC} &
    \multicolumn{2}{|c|}{\bfseries QCEC} \\
    \cline{2-11}
    & n&c&r & n&c&r & t(sec)&mem(bytes) & t(sec)&mem(bytes) \\ 
    \hline
    %------
    name & a & b & c & d & e & f & g & h & i & j \\
    \end{tabular}

    \end{center}
    """




    # circuits_dir1 = os.path.join(BENCHMARK_BASE_DIR, collection, simulator.file_extension(), pair[0])
    # circuits_dir2 = os.path.join(BENCHMARK_BASE_DIR, collection, simulator.file_extension(), pair[1])


        

if __name__ == "__main__":

    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout", type=int, default=300, help="Timeout value in seconds")
    args = parser.parse_args()

    # The Quokka benchmarks directory has the follwoing structure:
    # base_dir/collection/file_format/circuits/circuit
    # where:
    # - collection: the name of the collection of circuits (e.g. add, random, etc)
    # - file_format: file format of the circuits (e.g. qasm, ctqc)
    # - circuits: the directory containing the circuits (e.g. origin, opt)
    # - circuit: specific circuit file qft_nativegates_ibm_qiskit_opt0_2.qasm

    BENCHMARK_BASE_DIR = Path(os.path.dirname(os.path.abspath(__file__)))
    # COLLECTIONS = ['z_algorithm', 'z_add']
    COLLECTIONS = ['z_algorithm']
    CIRCUIT_DIR_PAIRS = [('origin', 'opt')]
    # SIMULATORS = [CTQC(), QCEC()]
    SIMULATORS = [CTQC()]

    for simulator in SIMULATORS:
        print(f"{simulator.name()}")

        for collection in COLLECTIONS:

            for pair in CIRCUIT_DIR_PAIRS:

                circuits_dir1 = os.path.join(BENCHMARK_BASE_DIR, collection, simulator.file_extension(), pair[0])
                circuits_dir2 = os.path.join(BENCHMARK_BASE_DIR, collection, simulator.file_extension(), pair[1])
                check_equivalance(simulator, circuits_dir1, circuits_dir2, args.timeout)