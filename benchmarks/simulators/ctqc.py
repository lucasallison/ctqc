import os, time, subprocess, json, resource, re
from typing import Dict, List
from qiskit import QuantumCircuit, qasm3
from dotenv import load_dotenv
from simulators.interface import Simulator

class CTQC(Simulator):

    def __init__(self, cmd_line_args: List=None):

        load_dotenv()
        self.binary_path = os.getenv('CTQC_BINARY_PATH')

        self.cmd_line_args = cmd_line_args
    

    def name(self) -> str:
        return 'CTQC' if self.cmd_line_args is None else 'CTQC_' + '_'.join(self.cmd_line_args)
    

    def simulate(self):
        pass


    def equivalence_check(self, circuit_1: str, circuit_2: str) -> Dict:

        ctqc_circuit_1 = self.qasm_to_ctqc(circuit_1, 'circuit_1')
        ctqc_circuit_2 = self.qasm_to_ctqc(circuit_2, 'circuit_2')

        start_time = time.time()
        res = subprocess.run(self.get_subprocess_args(ctqc_circuit_1, ctqc_circuit_2), capture_output=True)
        end_time = time.time()
        execution_time = end_time - start_time

        if res.stderr.decode() != '':
            raise RuntimeError(res.stderr.decode())

        max_rss_bytes = resource.getrusage(resource.RUSAGE_CHILDREN).ru_maxrss
        try:
            res = json.loads(res.stdout.decode())
        except Exception as e:
            raise RuntimeError(f'Failed parsing output to json: {res.stdout.decode()} \n {e}')

        return {'equivalent': res['equivalent'], 'runtime': execution_time, 'max_rss_bytes': max_rss_bytes}


    def qasm_to_ctqc(self, circuit: str, name: str) -> str:

        qc = QuantumCircuit.from_qasm_file(circuit)
        qasm_circuit = qasm3.dumps(qc)

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
        
        ctqc_circuit_file = os.path.join('/tmp', name+'.ctqc')

        with open(ctqc_circuit_file, 'w') as f:
            f.write(ctqc_transpiled)

        return ctqc_circuit_file
        