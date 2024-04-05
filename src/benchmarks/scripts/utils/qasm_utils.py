import os
import re
from pathlib import Path
from typing import Tuple

def qasm_dir_to_ctqc(qasm_dir: str, output_dir: str, optimization_level: int=0, ignore_transpiled_files: bool=True, verbose: bool=True):

    if not os.path.isdir(qasm_dir):
        raise ValueError(f"{qasm_dir} is not a directory.")

    os.makedirs(output_dir)

    qasm_file_paths = Path(qasm_dir).rglob('*.qasm')
    for qasm_file_path in qasm_file_paths:

        qasm_file = str(qasm_file_path)


        if ignore_transpiled_files and re.search("transpiled", qasm_file):
            continue

        if verbose:
            print("Transpiling", qasm_file_path)

        try:
            (qasm_transpiled, ctqc_tranpiled) = qasm2_to_ctqc(qasm_file, optimization_level)
        except:
            if verbose:
                print(f"Failed to transpile {qasm_file_path}, ignoring this file.")
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

def qasm2_to_ctqc(qasm_file: str, optimization_level: int=0) -> Tuple[str, str]:
    """
    Converts a QASM file to a CTQC format file.

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
    from qiskit import QuantumCircuit

    qc = QuantumCircuit.from_qasm_file(qasm_file)

    try:
        result = transpile(qc, basis_gates=['h', 's', 'cx', 'rz'], optimization_level=optimization_level, seed_transpiler=1) 
    except:
        raise RuntimeError("Transpilation failed.")

    qasm_transpiled = result.qasm(formatted=False)
    ctqc_transpiled = ""
    q_registers = 0

    transpilation_started = False
    for line in qasm_transpiled.splitlines():
        line = line.rstrip()

        if re.match(r"h .*\[\d*\];", line):
            qubit = int(re.search(r'\d+', re.search(r'\[\d+\]', line).group()).group())
            ctqc_transpiled += "H " + str(qubit) + "\n"

        elif re.match(r"s .*\[\d*\];", line):
            qubit = int(re.search(r'\d+', re.search(r'\[\d+\]', line).group()).group())
            ctqc_transpiled += ("S " + str(qubit) + "\n")

        elif re.match(r"cx .*\[\d*\],.*\[\d*\];", line):
            qubit_1 = int(re.search(r'\d+', re.search(r'\[\d+\]', line.split(',')[0]).group()).group())
            qubit_2 = int(re.search(r'\d+', re.search(r'\[\d+\]', line.split(',')[1]).group()).group())
            ctqc_transpiled += "CNOT " + str(qubit_1) + " " + str(qubit_2) + "\n"

        elif re.match(r"rz(.*) .*\[\d*\];", line):
            angle = re.search(r'\((.*?)\)', line).group(1)
            qubit = int(re.search(r'\d+', re.search(r'\[\d+\]', line.split(' ')[1]).group()).group())
            ctqc_transpiled += "Rz(" + angle + ") " + str(qubit) + "\n"

        elif re.match(r"measure .*\[\d*\]", line):
            qubit = int(re.search(r'\d+', re.search(r'\[\d+\]', line).group()).group())
            ctqc_transpiled += "M " + str(qubit) + "\n"
        
        elif re.match(r"qreq .*\[\d*\]", line):
            q_registers += 1
            if q_registers > 1:
                raise RuntimeError("Can only transpile circuits with one quantum register.")

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