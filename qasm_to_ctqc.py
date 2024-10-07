import re, argparse, sys
from qiskit import QuantumCircuit, qasm3
from qiskit.compiler import transpile

def qasm_to_ctqc(qasm_file: str, transpiled_circuit_name: str, opt: int=2):

    try:
        origin = QuantumCircuit.from_qasm_file(qasm_file)
        transp = transpile(
            origin,
            basis_gates=['h', 's', 'cx', 'rz'],
            optimization_level=opt,
            seed_transpiler=1)
    except Exception as e:
        raise e

    qasm_circuit = qasm3.dumps(transp)

    # Convert qasm qubits to regular numbers
    qreg_highest_offset = 0
    qreg_offset = dict()

    def convert_qubit(qreg, qubit, qreg_offset):
        return str(qreg_offset[qreg] + qubit)

    # We ignore initial comments, OPENQASM, etc
    transpilation_started = False

    ctqc_transpiled = ""
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

        elif re.match(r"t \w+\[\d+\];", line):
            match = re.match(r"t (\w+)\[(\d+)\];", line)
            qreg = match.group(1)
            qubit = int(match.group(2))
            ctqc_transpiled += "T " + convert_qubit(qreg, qubit, qreg_offset) + "\n"

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

    with open(transpiled_circuit_name, 'w') as f:
        f.write(ctqc_transpiled)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Transpile a QASM circuit to a CTQC circuit.')

    parser.add_argument('-f', type=str, required=True, help='File containing the QASM circuit.')
    parser.add_argument('-o', type=str, required=True, help='File to write the CTQC circuit to.')
    parser.add_argument('-opt', type=int, default=2, help='Optimization level used in transpilation. Default is 2.')
    args = parser.parse_args()

    try:
        qasm_to_ctqc(args.f, args.o, args.opt)
    except Exception as e:
        print('Exception!', e, file=sys.stderr)
