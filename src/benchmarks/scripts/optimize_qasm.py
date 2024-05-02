import argparse, os, sys
from pathlib import Path

from qiskit import QuantumCircuit
from qiskit.compiler import transpile
from qiskit import qasm3

TRANSPILATION_SEED = 1

# TODO utils file
def write_log_file(output_dir, msg):
    with open(os.path.join(output_dir, "logs.txt"), 'a') as f:
        f.write(msg)

# TODO utils file
def write_circuit_to_file(circuit: str, file: str):
    os.makedirs(os.path.dirname(file), exist_ok=True)
    with open(file, "w") as f:
        f.write(circuit)


def transpile_and_optimize(qasm_dir: str, output_dir: str, optimization_level: int=2) -> None:
    """
    Transpiles and optimizes the qasm files to circuits with basis gates H, S, CNOT, and Rz and 
    """

    if not os.path.isdir(qasm_dir):
        raise RuntimeError(f"{qasm_dir} is not a directory.")

    # Create ouptut directories if it does not exist
    Path(output_dir).mkdir(parents=True, exist_ok=False)

    origin = os.path.join(output_dir, "origin")
    Path(origin).mkdir(parents=True, exist_ok=True)

    opt = os.path.join(output_dir, "opt")
    Path(opt).mkdir(parents=True, exist_ok=True)

    successfully_transpiled_files = list()
    qasm_file_paths = Path(qasm_dir).rglob('*.qasm')

    write_log_file(output_dir, "Unsuccessfully transpiled:\n")
    for qasm_file_path in qasm_file_paths:

        try:
            qc = QuantumCircuit.from_qasm_file(qasm_file_path)
            qasm_origin = qasm3.dumps(transpile(qc, basis_gates=['h', 's', 'cx', 'rz'], optimization_level=0, seed_transpiler=TRANSPILATION_SEED)) 
            qasm_opt = qasm3.dumps(transpile(qc, basis_gates=['h', 's', 'cx', 'rz'], optimization_level=optimization_level, seed_transpiler=TRANSPILATION_SEED)) 
        except Exception as e:
            print(f"* Failed to transpile {qasm_file_path}: {e}, ignoring this file.")
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
    args = parser.parse_args()

    try:
        transpile_and_optimize(args.q, args.o, args.opt)
    except Exception as e:
        print(f"FAILED! {e}", file=sys.stderr)