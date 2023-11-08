import sys
import re
import os
import subprocess
import argparse
import time
from pathlib import Path
from qiskit import QuantumCircuit
from qiskit.compiler import transpile

# ~/Dev/thesis/QASMBench/small/

def transpile_qasm_to_ctqc(f_in, f_out, optimization_level=0):
    print("Transpiling", f_in)
    qc = QuantumCircuit.from_qasm_file(f_in)

    result = transpile(qc, basis_gates=['h', 's', 'cx', 'rz'], optimization_level=optimization_level, seed_transpiler=1) 
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

    print("Transpilation completed")
    f.close()

def run_qasm(args, qasm_file):

    datastructure = 'rbitvec' if args.ds is None else args.ds
    clean_rounds = '1000' if args.c is None else args.c

    transpile_qasm_to_ctqc(qasm_file, '.tmp.ctqc')
    print('File: \'{}\''.format(qasm_file))
    start = time.time()
    subprocess.run('cargo run --release -q -- -f .tmp.ctqc -t ' + datastructure + ' -c ' + clean_rounds, shell=True, capture_output=False)
    end = time.time()
    print("-> %s seconds" % round((end-start), 3))
    os.remove('.tmp.ctqc')

def run_or_transpile(args, file):
    if args.t:
        f_out = os.path.splitext(file)[0]+'.ctqc'
        if args.o is not None:
            transpile_qasm_to_ctqc(file, f_out, args.o)
        else:
            transpile_qasm_to_ctqc(file, f_out)
    else:
        run_qasm(args, file)



if __name__ == "__main__":

    parser = argparse.ArgumentParser(description='Transpile QASM to CTQC or run QASM benchmarks')

    parser.add_argument('-f', type=str,
                        help='Path to the QASM file to be transpiled to CTQC or run.')

    parser.add_argument('-d', type=str,
                        help='Path to directory containing QASM files to be transpiled to CTQC or run.')

    parser.add_argument('-o', type=int,
                        help='Optimization level for transpilation.')

    parser.add_argument('-ds', type=str,
                        help='Datastructure to use for the simulation.')

    parser.add_argument('-c', type=str,
                        help='Clean parameter to use for the simulation.')

    parser.add_argument('-t', action='store_true',
                        help='If set the provided QASM file(s) will be transpiled to CTQC.')

    args = parser.parse_args()

    if args.f is not None:
        run_or_transpile(args, args.f)

    elif args.d is not None:  

        pathlist = Path(args.d).rglob('*.qasm')
        for p in pathlist:
            path = str(p)
            if not re.search("transpiled", path):
                run_or_transpile(args, path)

    else:
        print("No QASM file(s) provided.")

