import random, os

GATES = ['h', 's', 'cx', 't']

file_name = "circ/c"
max_qubits = 2
max_addressible_qubit = max_qubits - 1
circuit_length = 1000

t_gate_percentage = 25
remaining_percentages = 100 - t_gate_percentage
clifford_percentage = remaining_percentages // 3

weights = [clifford_percentage + (100 - 3*clifford_percentage - t_gate_percentage), 
           clifford_percentage, 
           clifford_percentage, 
           t_gate_percentage]


# ctqc = Clifford + T quantum circuit
f = open(file_name + ".qasm", "w")

f.write("OPENQASM 2.0;\ninclude \"qelib1.inc\";\nqreg q[{}];\n".format(max_qubits, max_qubits))

for _ in range(circuit_length):

    gate = random.choices(GATES, weights)[0]
    q1 = random.randint(0, max_addressible_qubit)

    if gate == 'cx':
        q2 = random.randint(0, max_addressible_qubit)
        while q2 == q1:
            q2 = random.randint(0, max_addressible_qubit)
        f.write(gate + " q[{}],q[{}];".format(q1, q2))
    else:
        f.write(gate + " q[{}];".format(q1))

    f.write("\n")

f.close()
