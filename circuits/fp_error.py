# Circuits to illustrate errors caused by floating point precision.
# Run this script and then `cargo run --release -- -f fp_error.ctqc -e fp_error_equiv.ctqc -p`

file = 'fp_error.ctqc'
equiv_file = 'fp_error_equiv.ctqc'

n_tgates = 1001
circuit = 'H 0'
for _ in range(n_tgates):
    circuit += f'\nT 0'
circuit += f'\nRz(-pi/{4.000000000001}) 0' 

with open(file, 'w') as f:
    f.write(circuit)

with open(equiv_file, 'w') as f:
    f.write('H 0')