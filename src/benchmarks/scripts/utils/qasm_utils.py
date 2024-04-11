import os
import re
from pathlib import Path
from typing import Tuple

TRANSPILATION_SEED = 1

def qasm_dir_to_ctqc(qasm_dir: str, output_dir: str, optimization_level: int=0, ignore_transpiled_files: bool=True) -> None:

    if not os.path.isdir(qasm_dir):
        raise ValueError(f"{qasm_dir} is not a directory.")

    os.makedirs(output_dir)

    successfully_transpiled_files = list()
    unsuccessfully_transpiled_files = list()

    def write_log_file(output_dir, msg):
        with open(os.path.join(output_dir, "logs.txt"), 'a') as f:
            f.write(msg)

    qasm_file_paths = Path(qasm_dir).rglob('*.qasm')
    for qasm_file_path in qasm_file_paths:

        qasm_file = str(qasm_file_path)


        if ignore_transpiled_files and re.search("transpiled", qasm_file):
            continue

        print("Transpiling: ", qasm_file_path)

        try:
            (qasm_transpiled, ctqc_tranpiled) = qasm_to_ctqc(qasm_file, optimization_level)
        except Exception as e:
            msg = f"* Failed to transpile {qasm_file_path}: {e}, ignoring this file."
            print(msg)
            unsuccessfully_transpiled_files.append(qasm_file_path)
            write_log_file(output_dir, msg+"\n")
            continue

        f_name, _ = os.path.splitext(os.path.basename(qasm_file_path))

        ctqc_dir = os.path.join(output_dir, "ctqc")
        Path(ctqc_dir).mkdir(parents=True, exist_ok=True)
        ctqc_file = os.path.join(ctqc_dir, f_name + ".ctqc")
        with open(ctqc_file, "w") as f:
            f.write(ctqc_tranpiled)

        transpiled_qasm_dir = os.path.join(output_dir, "qasm")
        Path(transpiled_qasm_dir).mkdir(parents=True, exist_ok=True)
        transpiled_qasm_file = os.path.join(transpiled_qasm_dir, os.path.basename(qasm_file))
        with open(transpiled_qasm_file, "w") as f:
            f.write(qasm_transpiled)
        
        successfully_transpiled_files.append(qasm_file_path)

    write_log_file(output_dir, "\nSuccesfully transpiled:\n")
    for file in successfully_transpiled_files:
        write_log_file(output_dir, f"- {file}\n")

    write_log_file(output_dir, "\nUnsuccesfully transpiled:\n")
    for file in unsuccessfully_transpiled_files:
        write_log_file(output_dir, f"- {file}\n")


def qasm_to_ctqc(qasm_file: str, optimization_level: int=0) -> Tuple[str, str]:
    """
    Converts a QASM file to a CTQC file.

    This function takes a QASM file, transpiles it to a circuit with basis gates 'h', 's', 'cx', and 'rz', and then converts it to a CTQC format file. 
    The function returns the transpiled QASM and CTQC strings.

    Parameters:
        qasm_file (str): The path of the QASM file to be converted.
        ctqc_file (str): The path of the CTQC file to write the converted circuit to.
        optimization_level (int, optional): The optimization level to be used during transpilation. 
            Higher levels generate more optimized circuits at the expense of longer transpilation time. Default is 0.

    Returns:
        Tuple[str, str]: A tuple containing the transpiled QASM string and the CTQC string.

    Raises:
        RuntimeError: If transpilation fails, the circuit has more than one quantum register, or the function encounters a line that it cannot convert.

    Note:
        The function uses the Qiskit library to transpile the QASM circuit.
        The function only supports circuits with one quantum register.
    """

    from qiskit import QuantumCircuit
    from qiskit.compiler import transpile
    from qiskit import qasm3

    qc = QuantumCircuit.from_qasm_file(qasm_file)

    try:
        result = transpile(qc, basis_gates=['h', 's', 'cx', 'rz'], optimization_level=optimization_level, seed_transpiler=TRANSPILATION_SEED) 
    except:
        raise RuntimeError("Transpilation failed.")


    qasm_transpiled = qasm3.dumps(result)
    # print(qasm_transpiled)

    ctqc_transpiled = ""

    # Convert qasm qubits to regular numbers
    qreg_highest_offset = 0
    qreg_offset = dict()

    def convert_qubit(qreg, qubit, qreg_offset):
        return str(qreg_offset[qreg] + qubit)

    # We ignore intial comments, OPENQASM, etc
    transpilation_started = False

    for line in qasm_transpiled.splitlines():
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

    return (qasm_transpiled.strip(), ctqc_transpiled.strip())


def sim_with_cirq(file: str, repetitions: int=1):
    """
    Simulates a quantum circuit from a QASM file using Cirq and prints the measurement results.

    Parameters:
        file (str): The name of the QASM file containing the quantum circuit to be simulated.
        repetitions (int, optional): The number of times to repeat the simulation. Default is 1.
    """
    import cirq
    from cirq.contrib.qasm_import import circuit_from_qasm

    with open(file, "r") as f:

        circuit = circuit_from_qasm(f.read())

        simulator = cirq.Simulator()
        res = simulator.run(circuit, repetitions=repetitions)

        digits = 3
        for reg, measurements in res.measurements.items():
            measurements = [m[0] for m in measurements]
            print(
                f"""
                {reg}: 0 -> {round(measurements.count(0) / len(measurements), digits)}, 
                1 -> {round(measurements.count(1) / len(measurements), digits)}
                """
            )