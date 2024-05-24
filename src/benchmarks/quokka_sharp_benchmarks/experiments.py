import argparse, sys, os, datetime, psutil
from multiprocessing import Process, Queue
from pathlib import Path

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from simulators.interface import Simulator
from simulators.ctqc import CTQC
from simulators.qcec import QCEC
from simulators.quokka_sharp import QuokkaSharp
from simulators.qiskit import Qiskit

def log(msg: str, file: str=None):
    print(msg)
    if file is not None:
        with open(file, 'a') as f:
            f.write(msg + '\n')


def get_circuit_stats(base_dir: str, collection: str, circ_type: str, circuit_name: str) -> list[str]:
    """
    Returns the number of qubits, clifford gates and rz gates of a circuit 
    """
    circuit_path = os.path.join(base_dir, collection, "ctqc", circ_type, circuit_name + ".ctqc")
    with open(circuit_path, 'r') as f:
        max_qubit = 0
        n_clifford = 0
        n_rz = 0
        for line in f:
            line.strip()
            gate = line.split()[0]

            if gate[0] == 'R' or gate[0] == 'T':
                n_rz += 1
            else:
                n_clifford += 1

            qubit = line.split()[1]
            max_qubit = max(max_qubit, int(qubit))
        
        return [str(max_qubit + 1), str(n_clifford), str(n_rz)]


# Using this workaround because the qcec checker gave some issues when trying to to use signals
def run_equiv_check(simulator: Simulator, circuit_1: str, circuit_2: str, res: dict):
    try:
        r = simulator.equivalent(circuit_1, circuit_2)
        res.put({'equiv': r[0], 'time': r[1], 'mem': r[2]})
    except Exception as e:
        res.put(e)

def kill_process_tree(pid):
    parent = psutil.Process(pid)
    for child in parent.children(recursive=True):
        child.kill()
    parent.kill()

def run_collection_benchmarks(base_dir: str, collection: str, circ_type_1: str, circ_type_2: str, simulators: list[Simulator], timeout: int):

    # Create results directory if it does not exist
    datetime.datetime.now().isoformat(sep=" ", timespec="seconds")
    results_dir = os.path.join("results", '_'.join(datetime.datetime.now().isoformat(sep=" ", timespec="seconds").split()))
    os.makedirs(results_dir, exist_ok=True)

    # Create log/tables files and remove old ones
    outfiles_name = collection + "-" + circ_type_1 + "-" + circ_type_2
    log_file = os.path.join(results_dir,  outfiles_name + ".logs")
    table_file = os.path.join(results_dir, outfiles_name + ".textable")
    if os.path.exists(log_file):
        os.remove(log_file)
    if os.path.exists(table_file):
        os.remove(table_file)
    log(f"Starting benchmark at {datetime.datetime.now()}", log_file)

    table = "\\begin{table}[htb] \n\n"
    table += "\\centering \n"
    table += "\\caption{Collection: " + collection.replace("_", "\\_") + ". Circuit types: " + circ_type_1.replace("_", "\\_") + " and " + circ_type_2.replace("_", "\\_") + "}\n"
    table += "\\vspace{2mm} \n\n"
    table += "\\resizebox{\\textwidth}{!}{ \n"
    # 1 col for circuit name
    # 1 col for number of qubits
    # 4 col for characteristics; clifford gates, rz gates for both circuits
    # For echt simulator 2 rows: time and memory
    n_cols = 6 + 2*len(simulators)
    table += f"\\begin{{tabular}}{{{'|'+ n_cols * 'c|'}}} \n"
    table += "\\hline \n"
    table += "\\multirow{2}{*}{\\bfseries Circuit Name} & \n"
    table += "\\multirow{2}{*}{\\bfseries \#Qubits} & \n"
    table += "\\multicolumn{2}{|c|}{\\bfseries " + f"{circ_type_1}" + "} & \n"
    table += "\\multicolumn{2}{|c|}{\\bfseries " + f"{circ_type_2}" + "} & \n"
    for simulator in simulators[:-1]:
        table += "\\multicolumn{2}{|c|}{\\bfseries " + \
            f"{simulator.name()}" + "} & \n"
    table += "\\multicolumn{2}{|c|}{\\bfseries " + \
        f"{simulators[-1].name()}" + "} \\\\ \n"
    table += "\\cline{3-" + str(n_cols) + "} \n"
    table += "& & \#$C$ & \#$Rz$ & \#$C$ & \#$Rz$"
    for simulator in simulators:
        table += "& t(sec)&mem(mbs) "
    table += " \\\\ \n"
    table += "\\hline \n"

    circuit_names = [os.path.basename(path).split('.')[0] for path in list(
        Path((os.path.join(base_dir, collection, 'ctqc', circ_type_1))).rglob('*'))]
    circuit_names.sort()
    if len(circuit_names) == 0:
        print('No circuits found, please provide another collection')
        exit(0)

    for circuit_name in circuit_names:

        src_circuit = os.path.join(base_dir, collection, 'ctqc', circ_type_1, circuit_name + '.ctqc')
        dst_circuit = os.path.join(base_dir, collection, 'ctqc', circ_type_2, circuit_name + '.ctqc')

        if not (os.path.exists(src_circuit) and os.path.exists(dst_circuit)):
            log(f'* File missing: {circuit_name}')
            continue

        # table += circuit_name.replace("_", "\\_") + " & "
        table += circuit_name.split('_')[0] + " & "

        c1_stats = get_circuit_stats(base_dir, collection, circ_type_1, circuit_name)
        c2_stats = get_circuit_stats(base_dir, collection, circ_type_2, circuit_name)
        table += " & ".join(c1_stats)
        table += " & "
        # Only display qubits once
        table += " & ".join(c2_stats[1:])

        log(f"-- {circuit_name} --", log_file)

        for simulator in simulators:

            table += " & "

            circ_path_t1 = os.path.join(base_dir, collection, simulator.file_type(
            ), circ_type_1, circuit_name + '.' + simulator.file_extension())
            circ_path_t2 = os.path.join(base_dir, collection, simulator.file_type(
            ), circ_type_2, circuit_name + '.' + simulator.file_extension())

            res = Queue()
            p = Process(target=run_equiv_check, args=(
                simulator, circ_path_t1, circ_path_t2, res))
            p.start()
            p.join(timeout)

            if p.is_alive():
                kill_process_tree(p.pid)
                table += "- & -"
                log(f"* {simulator.name()}: Timeout", log_file)
            else:
                res = res.get()
                if isinstance(res, Exception):
                    table += "E & E"
                    log(f"* {simulator.name()}: Exception! {res}", log_file)
                elif res['equiv'] == 'no_information':
                    table += "U & U"
                    log(f"* {simulator.name()}: Undetermined.")
                else:
                    time = round(res['time'], 4)
                    mem = round(res['mem'] / (1024 * 1024), 1)
                    table += f"{time} & {mem}"
                    log(f"* {simulator.name()}: equivalent = {res['equiv']} ({time} seconds, {mem} mbs)", log_file)

            p.join()

        table += " \\\\ \n"

    table += "\\hline \n"
    table += "\\end{tabular}} \n"
    table += "\\end{table} \n"

    with open(table_file, 'w') as f:
        f.write(table)


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
    # COLLECTIONS = ['min_transp_algorithm']
    COLLECTIONS = ['z_add']
    # CIRCUIT_DIR_PAIRS = [('origin', 'opt'), ('origin', 'flip'), ('origin', 'gm'), ('origin', 'shift4'), ('origin', 'shift7')]
    CIRCUIT_DIR_PAIRS = [('origin', 'opt')]
    # SIMULATORS = [QCEC(), CTQC(), QuokkaSharp(), Qiskit()]
    SIMULATORS = [CTQC(), QCEC(), QuokkaSharp(), Qiskit()]

    for collection in COLLECTIONS:
        for pair in CIRCUIT_DIR_PAIRS:
            run_collection_benchmarks(
                BENCHMARK_BASE_DIR, collection, pair[0], pair[1], SIMULATORS, args.timeout)
