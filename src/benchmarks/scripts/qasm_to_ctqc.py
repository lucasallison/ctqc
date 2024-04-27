import os
import sys
import re
import argparse
from pathlib import Path
from typing import Tuple, List

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


def qasm_dir_to_ctqc(qasm_dir: str, output_dir: str, transpile_qasm: bool=True, optimization_level: int=0, ignore_list: List[str]=list()) -> None:
    """
    Transpiles QASM files in a directory to CTQC format.

    Args:
        qasm_dir (str): The directory containing the QASM files.
        output_dir (str): The directory where the transpiled files will be saved.
        transpile_qasm (bool, optional): Whether to transpile the QASM files. Defaults to True.
        optimization_level (int, optional): The optimization level for transpilation. Defaults to 0.
        ignore_list (List, optional): A list of regular expressions to ignore certain files. Defaults to [].
    """

    if not os.path.isdir(qasm_dir):
        raise RuntimeError(f"{qasm_dir} is not a directory.")

    # Create ouptut directories if it does not exist
    os.makedirs(output_dir)

    ctqc_dir = os.path.join(output_dir, "ctqc")
    Path(ctqc_dir).mkdir(parents=True, exist_ok=True)

    new_qasm_dir = os.path.join(output_dir, "qasm")
    Path(new_qasm_dir).mkdir(parents=True, exist_ok=True)

    successfully_transpiled_files = list()
    qasm_file_paths = Path(qasm_dir).rglob('*.qasm')

    write_log_file(output_dir, "Unsuccessfully transpiled:\n")

    for qasm_file_path in qasm_file_paths:
        if any([bool(re.match(regex, str(qasm_file_path))) for regex in ignore_list]):
            continue
            
        try:
            (qasm_circuit, ctqc_circuit) = qasm_to_ctqc(qasm_file_path, optimization_level, transpile_qasm)
        except Exception as e:
            print(f"* Failed to transpile {qasm_file_path}: {e}, ignoring this file.")
            write_log_file(output_dir, f"- {qasm_file_path}: {e}\n")
            continue

        sub_dir_path, circuit_file = os.path.split(Path(*qasm_file_path.parts[1:]))
        circuit_name, _ = os.path.splitext(os.path.basename(circuit_file).split('.')[0])

        ctqc_sub_dir = os.path.join(ctqc_dir, sub_dir_path)
        ctqc_file = os.path.join(ctqc_sub_dir, circuit_name + ".ctqc")
        write_circuit_to_file(ctqc_circuit, ctqc_file)

        new_qasm_sub_dir = os.path.join(new_qasm_dir, sub_dir_path)
        new_qasm_file = os.path.join(new_qasm_sub_dir, circuit_name + ".qasm")
        write_circuit_to_file(qasm_circuit, new_qasm_file)

        successfully_transpiled_files.append(qasm_file_path)

    write_log_file(output_dir, "\nSuccessfully transpiled:")
    for file in successfully_transpiled_files:
        write_log_file(output_dir, f"\n- {file}")


def qasm_to_ctqc(qasm_file: str, optimization_level: int=0, transpile_qasm: bool=True) -> Tuple[str, str]:
    """
    Converts a QASM file to a CTQC file.

    This function takes a QASM file, transpiles it to a circuit with basis gates 'h', 's', 'cx', and 'rz', and then converts it to a CTQC format file. 
    The function returns the transpiled QASM and CTQC strings.

    Parameters:
        qasm_file (str): The path of the QASM file to be converted.
        ctqc_file (str): The path of the CTQC file to write the converted circuit to.
        optimization_level (int, optional): The optimization level to be used during transpilation. 
            Higher levels generate more optimized circuits at the expense of longer transpilation time. Default is 0.
        transpile_qasm (bool): Transpile the QASM file to a circuit with basis gates H, S, CNOT and Rz before converting it to CTQC. Default is True.

    Returns:
        Tuple[str, str]: A tuple containing the transpiled QASM string and the CTQC string.

    Raises:
        RuntimeError: If transpilation fails, the circuit has more than one quantum register, or the function encounters a line that it cannot convert.

    Note:
        The function uses the Qiskit library to transpile the QASM circuit.
        The function only supports circuits with one quantum register.
    """

    qc = QuantumCircuit.from_qasm_file(qasm_file)

    qasm_circuit = None
    if transpile_qasm: 
        try:
            print("Transpiling: ", qasm_file)
            qasm_circuit = qasm3.dumps(transpile(qc, basis_gates=['h', 's', 'cx', 'rz'], optimization_level=optimization_level, seed_transpiler=TRANSPILATION_SEED)) 
        except Exception as e:
            raise RuntimeError("Transpilation failed: ", e)
    else:
        qasm_circuit = qasm3.dumps(qc)

    ctqc_transpiled = ""

    # Convert qasm qubits to regular numbers
    qreg_highest_offset = 0
    qreg_offset = dict()

    def convert_qubit(qreg, qubit, qreg_offset):
        return str(qreg_offset[qreg] + qubit)

    # We ignore intial comments, OPENQASM, etc
    transpilation_started = False

    for line in qasm_circuit.splitlines():
        line = line.rstrip()

        if re.match(r"h \w+\[\d+\];", line):
            match = re.match(r"h (\w+)\[(\d+)\];", line)
            qreg = match.group(1)
            qubit = int(match.group(2))
            ctqc_transpiled += "H " + convert_qubit(qreg, qubit, qreg_offset) + "\n"

        elif re.match(r"s \w+\[\d+\];", line):
            match = re.match(r"s (\w+)\[(\d+)\];", line)
            qreg = match.group(1)
            qubit = int(match.group(2))
            ctqc_transpiled += "S " + convert_qubit(qreg, qubit, qreg_offset) + "\n"

        elif re.match(r"cx \w+\[\d+\], \w+\[\d+\];", line):
            match = re.match(r"cx (\w+)\[(\d+)\], (\w+)\[(\d+)\];", line)
            qreg1 = match.group(1)
            qubit1 = int(match.group(2))
            qreg2 = match.group(3)
            qubit2 = int(match.group(4))
            ctqc_transpiled += "CNOT " + convert_qubit(qreg1, qubit1, qreg_offset) + " " + convert_qubit(qreg2, qubit2, qreg_offset) + "\n"

        elif re.match(r"rz(.*) \w+\[\d+\];", line):
            match = re.match(r"rz\((.*)\) (\w+)\[(\d+)\];", line)
            angle = match.group(1)
            qreg = match.group(2)
            qubit = int(match.group(3))
            ctqc_transpiled += "Rz(" + angle + ") " + convert_qubit(qreg, qubit, qreg_offset) + "\n"

        elif re.match(r".*measure \w+\[\d+\];", line):
            match = re.match(r".*measure (\w+)\[(\d+)\];", line)
            qreg = match.group(1)
            qubit = int(match.group(2))
            ctqc_transpiled += "M " + convert_qubit(qreg, qubit, qreg_offset) + "\n"
        
        elif re.match(r"^qubit\[\d+\] \w+;", line):
            match = re.match(r"^qubit\[(\d+)\] (\w+);", line)
            n_qubits = int(match.group(1))
            qreg = match.group(2)

            qreg_offset[qreg] = qreg_highest_offset
            qreg_highest_offset += n_qubits

        # Ignore barriers
        elif re.match(r"barrier.*", line):
            continue
    
        # Ignore classical registers
        elif re.match(r"bit.*", line):
            continue

        else: 
            if transpilation_started: 
                raise RuntimeError(f"Cannot convert \"{line}\".")
            else:
                continue
        
        transpilation_started = True

    return (qasm_circuit.strip(), ctqc_transpiled.strip())


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Transpile a directory with QASM circuits to a directory with CTQC circuits.')

    parser.add_argument('-q', type=str, required=True, help='Directory containing the QASM circuits.')
    parser.add_argument('-o', type=str, required=True, help='Directory to write the CTQC circuits to.')
    parser.add_argument('-tq', action='store_true', default=False, help='Transpile the QASM file to a circuit with basis gates H, S, CNOT, and Rz. Default is False.')
    parser.add_argument('-opt', type=int, default=0, help='Optimization level used in transpilation. Default is 0.')
    parser.add_argument('-ig', nargs='+', type=str, default=[], help='List of regexes that describe file paths to ignore during transpilation.')
    args = parser.parse_args()

    try:
        qasm_dir_to_ctqc(args.q, args.o, args.tq, args.opt, args.ig)
    except Exception as e:
        print(e, file=sys.stderr)