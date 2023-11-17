import sys
import re
import os
import subprocess
import argparse
import time
from pathlib import Path
from qiskit import QuantumCircuit
from qiskit.compiler import transpile
from qiskit import QuantumCircuit, Aer, execute
import signal

def transpile_qasm_to_ctqc(args, f_in, f_out, optimization_level=0):

    if args.v:
        print("Transpiling...")

    qc = QuantumCircuit.from_qasm_file(f_in)

    try:
        result = transpile(qc, basis_gates=['h', 's', 'cx', 'rz'], optimization_level=optimization_level, seed_transpiler=1) 
    except:
        print("Transpilation failed.", file=sys.stderr)
        return False 
    
    qc_transpiled = result.qasm(formatted=False)

    f = open(f_out, 'w')

    transpilation_started = False

    gates_count = 0
    for line in qc_transpiled.splitlines():
        line = line.rstrip()

        if re.match(r"h .*\[\d*\];", line):
            qubit = int(re.search(r'\d+', re.search(r'\[\d+\]', line).group()).group())
            f.write("H " + str(qubit) + "\n")
        elif re.match(r"s .*\[\d*\];", line):
            qubit = int(re.search(r'\d+', re.search(r'\[\d+\]', line).group()).group())
            f.write("S " + str(qubit) + "\n")
        elif re.match(r"cx .*\[\d*\],.*\[\d*\];", line):
            qubit_1 = int(re.search(r'\d+', re.search(r'\[\d+\]', line.split(',')[0]).group()).group())
            qubit_2 = int(re.search(r'\d+', re.search(r'\[\d+\]', line.split(',')[1]).group()).group())
            f.write("CNOT " + str(qubit_1) + " " + str(qubit_2) + "\n")
        elif re.match(r"rz(.*) .*\[\d*\];", line):
            angle = re.search(r'\((.*?)\)', line).group(1)
            qubit = int(re.search(r'\d+', re.search(r'\[\d+\]', line.split(' ')[1]).group()).group())
            f.write("Rz(" + angle + ") " + str(qubit) + "\n")
        elif re.match(r"measure .*\[\d*\]", line):
            qubit = int(re.search(r'\d+', re.search(r'\[\d+\]', line).group()).group())
            f.write("M " + str(qubit) + "\n")
        else:
            if transpilation_started: 
                print("Cannot transpile", line, "(ignored)", file=sys.stderr) 
            else:
                continue
            
        transpilation_started = True
        gates_count += 1

    print(f_in, '-', gates_count, "gates", end=" ")
    f.close()
    return True

def sim(args, qc=None):
    if args.qiskit:
        backend = Aer.get_backend("qasm_simulator")
        res = execute(qc, backend, shots=1)
        if args.v:
            print(res.result().get_counts())
    else:
        datastructure = 'rbitvec' if args.ds is None else args.ds
        clean_rounds = '1000' if args.c is None else args.c
        if args.v:
            print("\n")
        subprocess.run('cargo run --release -q -- -f .tmp.ctqc -t ' + datastructure + ' -c ' + clean_rounds, shell=True, capture_output=(not args.v))



def run_qasm(args, qasm_file):

    optimization_level = 0 if args.o is None else args.o    

    # Either transpile to qasm or to ctqc
    qc_transpiled = None
    if args.qiskit:
        qc = QuantumCircuit.from_qasm_file(qasm_file)
        qc_transpiled = transpile(qc, basis_gates=['h', 's', 'cx', 'rz'], optimization_level=optimization_level, seed_transpiler=1) 
    else:
        transpile_qasm_to_ctqc(args, qasm_file, '.tmp.ctqc', optimization_level)

    timeout = False 
    start = time.time()

    if args.timeout is None:
        sim(args, qc_transpiled)

    else:
        def handler(signum, frame):
            raise Exception("Simulation timed out")

        signal.signal(signal.SIGALRM, handler)
        signal.alarm(args.timeout)

        try:
            sim(args, qc_transpiled)
        except Exception as ex:
            if args.v:
                print("\n")
            print(" ** ", ex, end=" ")
            timeout = True

        signal.alarm(0)

    end = time.time()
    print("-> %s seconds" % round((end-start), 3))
    if not args.qiskit:
        os.remove('.tmp.ctqc')
    return timeout

def run_or_transpile(args, file):

    if args.t:
        f_out = os.path.splitext(file)[0]+'.ctqc'
        op = 0 if args.o is None else args.o
        if not transpile_qasm_to_ctqc(args, file, f_out, op):
            return None
    else:
        return run_qasm(args, file)
    

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

    parser.add_argument('--timeout', type=int,
                        help='Stops simulation after timeout seconds.')

    parser.add_argument('-t', action='store_true',
                        help='If set the provided QASM file(s) will be transpiled to CTQC.')

    parser.add_argument('-v', action='store_true',
                        help='Verbose mode')

    parser.add_argument('--qiskit', action='store_true',
                        help='Simulate using Qiskit instead of CTQC.')

    args = parser.parse_args()

    if args.f is not None:
        run_or_transpile(args, args.f)

    elif args.d is not None:  

        timeouts = 0
        total = 0

        pathlist = Path(args.d).rglob('*.qasm')
        for p in pathlist:
            path = str(p)
            # TODO 
            if not re.search("transpiled", path):
                if args.v:
                    print("-------------", path, "------------")
                
                res = run_or_transpile(args, path)
                
                # Something went wrong
                if res is None: 
                    continue

                # Simulation timed out
                if res:
                    timeouts += 1

                total += 1
                if args.v:
                    print("")
        
        print("Total: ", total, "Timeouts: ", timeouts)

    else:
        print("No QASM file(s) provided.", file=sys.stderr)

