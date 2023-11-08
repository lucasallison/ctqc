import sys
import re
import os
import subprocess
import argparse
from pathlib import Path
from qiskit import QuantumCircuit
from qiskit.compiler import transpile

# ~/Dev/thesis/QASMBench/small/

def transpile_qasm_to_ctqc(f_in, f_out):
    qc = QuantumCircuit.from_qasm_file(f_in)

    result = transpile(qc, basis_gates=['h', 's', 'cx', 'rz'], optimization_level=2, seed_transpiler=1) 
    qc_transpiled = result.qasm(formatted=False)

    f = open(f_out, 'w')

    for line in qc_transpiled.splitlines():
        line = line.rstrip()
        if re.match(r"h q\[\d*\];", line):
            qubit = int(re.search(r'\d+', line).group())
            f.write("H " + str(qubit) + "\n")
        elif re.match(r"s q\[\d*\];", line):
            qubit = int(re.search(r'\d+', line).group())
            f.write("S " + str(qubit) + "\n")
        elif re.match(r"cx q\[\d*\],q\[\d*\];", line):
            qubit_1 = int(re.search(r'\d+', line.split(',')[0]).group())
            qubit_2 = int(re.search(r'\d+', line.split(',')[1]).group())
            f.write("CNOT " + str(qubit_1) + " " + str(qubit_2) + "\n")
        elif re.match(r"rz(.*) q\[\d*\];", line):
            # TODO
            # angle = int(re.search(r'\d+', line.split(' ')[0]).group())
            qubit = int(re.search(r'\d+', line.split(' ')[1]).group())
            f.write("T " + str(qubit) + "\n")
        elif re.match(r"measure q\[\d*\]", line):
            pass
        else:
            # print("Failed to parse: ", line, "(ignored)") 
            # TODO
            pass

    f.close()

def run_qasm(qasm_file):
    datastructure = 'rbitvec'
    clean_rounds = '1000'

    transpile_qasm_to_ctqc(qasm_file, '.tmp.ctqc')
    print('aa')
    subprocess.run('cargo run --release -- -f .tmp.ctqc -t ' + datastructure + ' -c ' + clean_rounds, shell=True, capture_output=False)
    # os.remove('.tmp.ctqc')


if __name__ == "__main__":

    parser = argparse.ArgumentParser(description='Transpile QASM to CTQC or run QASM benchmarks')

    parser.add_argument('-f', type=str,
                        help='Path to the QASM file to be transpiled to CTQC or run.')

    parser.add_argument('-d', type=str,
                        help='Path to directory containing QASM files to be transpiled to CTQC or run.')

    parser.add_argument('-t', action='store_true',
                        help='If set the provided QASM file(s) will be transpiled to CTQC.')

    args = parser.parse_args()

    if args.f is not None:
        if args.t:
            f_out = os.path.splitext(args.f)[0]+'.ctqc'
            transpile_qasm_to_ctqc(args.f, f_out)
        else:
            print('A')
            run_qasm(args.f)
        

        # # TODO

        # dir_path = sys.argv[1]

        # pathlist = Path(dir_path).rglob('*.qasm')
        # for p in pathlist:
        #      # because path is object not string
        #      path = str(p)
        #      if not re.search("transpiled", path):
        #         print(path)

        # exit(1)
    else:
        print("No QASM file(s) provided.")