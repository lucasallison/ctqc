import argparse, sys, os
from multiprocessing import Process, Queue
from pathlib import Path

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from simulators.interface import Simulator
from simulators.ctqc import CTQC
from simulators.qcec import QCEC

# Using this workaround because the qcec checker gave some issues when trying to to use signals
def run_equiv_check(simulator: Simulator, circuit_1: str, circuit_2: str, res: dict):
    try:
        r = simulator.equivalent(circuit_1, circuit_2)
        res.put({'equiv': r[0], 'time': r[1], 'mem': r[2]})
    except Exception as e:
        res.put(e)


def get_circuit_stats(base_dir: str, collection: str, circ_type: str, circuit_name: str) -> list[str]:
    circuit_path = os.path.join(
        base_dir, collection, 'qasm', circ_type, circuit_name + '.qasm')
    # TODO
    # qubits, clifford gates, rz gates
    return ['1', '2', '3']


def run_collection_benchmarks(base_dir: str, collection: str, circ_type_1: str, circ_type_2: str, simulators: list[Simulator], timeout: int):

    table = "\\begin{center} \n"
    table += "\\captionof{table}{Collection: " + collection.replace("_", "\\_") + ". Circuits: " + circ_type_1.replace("_", "\\_") + " and " + circ_type_2.replace("_", "\\_") + "}\n"
    # 1 row for circuit name
    # 6 rows for characteristics; qubits, clifford gates, rz gates for both circuits
    # For echt simulator 2 rows: time and memory
    table += f"\\begin{{tabular}}{{{'|'+ (7 + 2*len(simulators)) * 'c|'}}} \n"
    table += "\\hline \n"
    table += "\\multirow{2}{*}{\\bfseries Circuit Name} & \n"
    table += "\\multicolumn{3}{|c|}{\\bfseries " + f"{circ_type_1}" + "} & \n"
    table += "\\multicolumn{3}{|c|}{\\bfseries " + f"{circ_type_2}" + "} & \n"
    for simulator in simulators[:-1]:
        table += "\\multicolumn{2}{|c|}{\\bfseries " + \
            f"{simulator.name()}" + "} & \n"
    table += "\\multicolumn{2}{|c|}{\\bfseries " + \
        f"{simulators[-1].name()}" + "} \\\\ \n"
    table += "\\cline{2-" + str(7 + 2*len(simulators)) + "} \n"
    table += "& n&c&r & n&c&r"
    for simulator in simulators:
        table += "& t(sec)&mem(mbs) "
    table += " \\\\ \n"
    table += "\\hline \n"

    circuit_names = [os.path.basename(path).split('.')[0] for path in list(
        Path((os.path.join(base_dir, collection, 'qasm', circ_type_1))).rglob('*'))]
    circuit_names.sort()
    for circuit_name in circuit_names:

        table += circuit_name.replace("_", "\\_") + " & "
        table += " & ".join(get_circuit_stats(base_dir,
                            collection, circ_type_1, circuit_name))
        table += " & "
        table += " & ".join(get_circuit_stats(base_dir,
                            collection, circ_type_2, circuit_name))

        print(f"-- {circuit_name} --")

        for simulator in simulators:

            table += " & "

            circ_path_t1 = os.path.join(base_dir, collection, simulator.file_extension(
            ), circ_type_1, circuit_name + '.' + simulator.file_extension())
            circ_path_t2 = os.path.join(base_dir, collection, simulator.file_extension(
            ), circ_type_2, circuit_name + '.' + simulator.file_extension())

            res = Queue()
            p = Process(target=run_equiv_check, args=(
                simulator, circ_path_t1, circ_path_t2, res))
            p.start()
            p.join(timeout)

            if p.is_alive():
                p.terminate()
                table += "- & -"
                print(f"* {simulator.name()}: Timeout")
            else:
                res = res.get()
                if isinstance(res, Exception):
                    table += "E & E"
                    print(f"* {simulator.name()}: Exception! {res}")
                else:
                    table += f"{round(res['time'], 5)} & {res['mem']/ (1024 * 1024)}"
                    print(
                        f"* {simulator.name()}: equivalent = {res['equiv']} ({round(res['time'], 5)} seconds, {res['mem']/ (1024 * 1024)} mbs)")

            p.join()

        table += " \\\\ \n"

    table += "\\hline \n"
    table += "\\end{tabular} \n"
    table += "\\end{center} \n"

    print(table)


if __name__ == "__main__":

    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout", type=int, default=300,
                        help="Timeout value in seconds")
    args = parser.parse_args()

    # The Quokka benchmarks directory has the follwoing structure:
    # base_dir/collection/file_format/circuits/circuit
    # where:
    # - collection: the name of the collection of circuits (e.g. add, random, etc)
    # - file_format: file format of the circuits (e.g. qasm, ctqc)
    # - circuits: the directory containing the circuits (e.g. origin, opt)
    # - circuit: specific circuit file qft_nativegates_ibm_qiskit_opt0_2.qasm

    BENCHMARK_BASE_DIR = Path(os.path.dirname(os.path.abspath(__file__)))
    COLLECTIONS = ['z_add']
    # COLLECTIONS = ['z_algorithm']
    CIRCUIT_DIR_PAIRS = [('origin', 'opt')]
    SIMULATORS = [QCEC(), CTQC()]

    for collection in COLLECTIONS:
        for pair in CIRCUIT_DIR_PAIRS:
            run_collection_benchmarks(
                BENCHMARK_BASE_DIR, collection, pair[0], pair[1], SIMULATORS, args.timeout)
