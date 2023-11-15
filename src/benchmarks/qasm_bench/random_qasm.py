import random

GATES = ['h', 's', 'cx', 't']
DEFAULT_T_GATE_PERCENTAGE = 25

file_name = input("Enter the file name: ")
max_qubits = int(input("Enter the maximum number of qubits: "))
max_qubits = max(1, max_qubits)
max_addressible_qubit = max_qubits - 1
circuit_length = abs(int(input("Enter the length of the circuit: ")))

try: 
    t_gate_percentage = int(input("Enter the percentage of T gates [0-100] [Default = 25]: "))
except:
    t_gate_percentage = DEFAULT_T_GATE_PERCENTAGE

if t_gate_percentage < 0 or t_gate_percentage > 100: 
    t_gate_percentage = DEFAULT_T_GATE_PERCENTAGE

remaining_percentages = 100 - t_gate_percentage

clifford_percentage = remaining_percentages // 3

# TODO remove CNOT if only one qubit
weights = [clifford_percentage + (100 - 3*clifford_percentage - t_gate_percentage), 
           clifford_percentage, 
           clifford_percentage, 
           t_gate_percentage]

# TODO 
# ctqc = Clifford + T quantum circuit
f = open(file_name + ".qasm", "w")

f.write("OPENQASM 2.0;\ninclude \"qelib1.inc\";\nqreg q[{}];\ncreg c[{}];\n".format(max_qubits, max_qubits))

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

f.write("measure q[0] -> c[0];")
f.close()






