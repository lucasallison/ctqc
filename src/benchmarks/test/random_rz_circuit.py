import random

GATES = ['h', 's', 'rz']

file_name = "circ/c"
max_qubits = 1
max_addressible_qubit = max_qubits - 1
circuit_length = 1000

t_gate_percentage = 70
remaining_percentages = 100 - t_gate_percentage
clifford_percentage = remaining_percentages // 2

weights = [clifford_percentage + (100 - 2*clifford_percentage - t_gate_percentage), 
           clifford_percentage, 
           t_gate_percentage]


# ctqc = Clifford + T quantum circuit
f = open(file_name + ".qasm", "w")

f.write("OPENQASM 2.0;\ninclude \"qelib1.inc\";\nqreg q[{}];\n".format(max_qubits, max_qubits))

# Start with a Hadamard gate, in this case the Rz gates will quickly increase the number of generators
f.write(f"h q[{0}];")

for _ in range(circuit_length-1):

    gate = random.choices(GATES, weights)[0]
    q = random.randint(0, max_addressible_qubit)

    # if gate == 'rz':
    #     power = random.randint(0, 16)
    #     minus = random.choice([True, False])
    #     f.write(f"rz({'-' if minus else ''}pi/{1 << power}) q[{q}];")

    # else:
    #     f.write(gate + " q[{}];".format(q))

    power = random.randint(0, 16)
    minus = random.choice([True, False])
    f.write(f"rz({'-' if minus else ''}pi/{1 << power}) q[{q}];")

    f.write("\n")

f.close()
