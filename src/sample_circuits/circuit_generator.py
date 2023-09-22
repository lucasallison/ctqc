import random

GATES = ['H', 'S', 'CNOT', 'T']

file_name = input("Enter the file name: ")
max_qubits = int(input("Enter the maximum number of qubits: "))
circuit_length = int(input("Enter the length of the circuit: "))

f = open(file_name + ".qasm", "w")

for _ in range(circuit_length):

    gate = random.choice(GATES)
    q1 = random.randint(0, max_qubits)
    f.write(gate + " " + str(q1))

    if gate == 'CNOT':
        q2 = random.randint(0, max_qubits)
        while q2 == q1:
            q2 = random.randint(0, max_qubits)
        f.write(" " + str(q2))
    f.write("\n")

f.close()






