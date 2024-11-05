# Circuits to illustrate errors caused by floating point precision in QASM 2.0 format.
# Run this script and then use the appropriate quantum simulator to verify.

import sys

file = 'fp_error.qasm'
equiv_file = 'fp_error_equiv.qasm'

n_tgates = int(sys.argv[1])
angle_error = float(sys.argv[2])

circuit = 'OPENQASM 2.0;\ninclude "qelib1.inc";\nqreg q[1];\n'
circuit += 'h q[0];\n'  

for _ in range(n_tgates):
    circuit += 't q[0];\n'  

circuit += f'rz(-pi/{4+angle_error}) q[0];\n'  

with open(file, 'w') as f:
    f.write(circuit)

with open(equiv_file, 'w') as f:
    f.write('OPENQASM 2.0;\ninclude "qelib1.inc";\nqreg q[1];\nh q[0];\n')

