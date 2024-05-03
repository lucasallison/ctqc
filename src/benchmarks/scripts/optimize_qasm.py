import argparse, os, sys, signal, datetime, re
from pathlib import Path

from qiskit import QuantumCircuit
from qiskit.compiler import transpile
from qiskit import qasm3

TRANSPILATION_SEED = 1

def write_log_file(output_dir, msg):
    with open(os.path.join(output_dir, "logs.txt"), 'a') as f:
        f.write(msg)

def write_circuit_to_file(circuit: str, file: str):
    os.makedirs(os.path.dirname(file), exist_ok=True)
    with open(file, "w") as f:
        f.write(circuit)


def transpile_and_optimize(qasm_dir: str, output_dir: str, optimization_level: int, ignore_list: list[str]=list(), timeout: int=300) -> None:
    """
    Transpiles and optimizes the qasm files to circuits with basis gates H, S, CNOT, and Rz and 
    """

    if not os.path.isdir(qasm_dir):
        raise RuntimeError(f"{qasm_dir} is not a directory.")

    def timeout_handler(signum, frame):
        raise TimeoutError(f"Timeout reached.") 

    signal.signal(signal.SIGALRM, timeout_handler)

    # Create ouptut directories if it does not exist
    Path(output_dir).mkdir(parents=True, exist_ok=False)

    origin = os.path.join(output_dir, "origin")
    Path(origin).mkdir(parents=True, exist_ok=True)

    opt = os.path.join(output_dir, "opt")
    Path(opt).mkdir(parents=True, exist_ok=True)

    successfully_transpiled_files = list()
    qasm_file_paths = Path(qasm_dir).rglob('*.qasm')

    write_log_file(output_dir, f"Date: {datetime.datetime.now()}.\n")
    write_log_file(output_dir, f"Optimization level: {optimization_level}.\n")
    write_log_file(output_dir, f"Timeout: {timeout} seconds.\n")
    write_log_file(output_dir, f"Ignore list: {', '.join(ignore_list) if len(ignore_list) > 0 else '-'} seconds.\n")
    write_log_file(output_dir, "\nUnsuccessfully transpiled:\n")
    for qasm_file_path in qasm_file_paths:


        if any([bool(re.search(regex, str(qasm_file_path))) for regex in ignore_list]):
            print(f"* Ignoring {qasm_file_path}: a pattern in the ignore list matched.")
            write_log_file(output_dir, f"- {qasm_file_path}: file matches a pattern in the ignore list.\n")
            continue

        print(f"Optimizing {qasm_file_path}...")

        signal.alarm(timeout)
        try:
            qc = QuantumCircuit.from_qasm_file(qasm_file_path)
            qasm_origin = qasm3.dumps(transpile(qc, basis_gates=['h', 's', 'cx', 'rz'], optimization_level=0, seed_transpiler=TRANSPILATION_SEED)) 
            qasm_opt = qasm3.dumps(transpile(qc, basis_gates=['h', 's', 'cx', 'rz'], optimization_level=optimization_level, seed_transpiler=TRANSPILATION_SEED)) 
        except Exception as e:
            print(f"* Failed to transpile {qasm_file_path}: {e}")
            write_log_file(output_dir, f"- {qasm_file_path}: {e}\n")
            continue

        write_circuit_to_file(qasm_origin, os.path.join(origin, os.path.basename(qasm_file_path)))
        write_circuit_to_file(qasm_opt, os.path.join(opt, os.path.basename(qasm_file_path)))

        successfully_transpiled_files.append(qasm_file_path)

    write_log_file(output_dir, "\nSuccessfully transpiled:")
    for file in successfully_transpiled_files:
        write_log_file(output_dir, f"\n- {file}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Transpile a directory with QASM circuits to a directory with CTQC circuits.')

    parser.add_argument('-q', type=str, required=True, help='Directory containing the QASM circuits.')
    parser.add_argument('-o', type=str, required=True, help='Directory to write the CTQC circuits to.')
    parser.add_argument('-opt', type=int, default=2, help='Optimization level used in transpilation. Default is 2.')
    parser.add_argument('-ig', nargs='+', type=str, default=[], help='List of regexes that describe file paths to ignore during transpilation.')
    parser.add_argument('--timeout', type=int, default=300, help='Max time trying to optimize a circuit. Default is 300 seconds.')
    args = parser.parse_args()

    try:
        transpile_and_optimize(args.q, args.o, args.opt, args.ig, args.timeout)
    except Exception as e:
        print(f"FAILED! {e}", file=sys.stderr)