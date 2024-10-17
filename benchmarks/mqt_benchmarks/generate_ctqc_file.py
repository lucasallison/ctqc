import re, argparse, sys

def qasm2_to_ctqc(qasm_file: str):

    print(f"Transpiling {qasm_file}...")

    # Convert qasm qubits to regular numbers
    qreg_highest_offset = 0
    qreg_offset = dict()

    def convert_qubit(qreg, qubit, qreg_offset):
        return str(qreg_offset[qreg] + qubit)

    # We ignore initial comments, OPENQASM, etc
    transpilation_started = False

    ctqc_transpiled = ""
    with open(qasm_file, 'r') as f:
        for line in f.readlines():
            line = line.strip()

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

            elif re.match(r"cx \w+\[\d+\],\w+\[\d+\];", line):
                match = re.match(r"cx (\w+)\[(\d+)\],(\w+)\[(\d+)\];", line)
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

            elif re.match(r"^qreg (\w+)\[(\d+)\];", line):
                match = re.match(r"^qreg (\w+)\[(\d+)\];", line)
                
                qreg = match.group(1)
                n_qubits = int(match.group(2))

                qreg_offset[qreg] = qreg_highest_offset
                qreg_highest_offset += n_qubits
            
            elif re.match(r"measure.*;", line) or re.match(r"barrier.*", line) or re.match(r"bit.*", line) or re.match(r"creg.*", line):
                continue

            else: 
                if transpilation_started: 
                    raise RuntimeError(f"Cannot convert \"{line}\".")
                else:
                    continue
                
            transpilation_started = True

    with open(qasm_file.replace('.qasm', '.ctqc'), 'w') as f:
        f.write(ctqc_transpiled)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Transpile a QASM circuit to a CTQC circuit.')

    parser.add_argument('-f', type=str, required=True, help='File containing the QASM circuit.')
    args = parser.parse_args()

    try:
        qasm2_to_ctqc(args.f)
    except Exception as e:
        print('Exception!', e, file=sys.stderr)
