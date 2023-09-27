import random

GATES = ['H', 'S', 'CNOT', 'T']
DEFAULT_T_GATE_PERCENTAGE = 25

file_name = input("Enter the file name: ")
max_qubits = int(input("Enter the maximum number of qubits: "))
circuit_length = int(input("Enter the length of the circuit: "))

try: 
    t_gate_percentage = int(input("Enter the percentage of T gates [0-100] [Default = 25]: "))
except:
    t_gate_percentage = DEFAULT_T_GATE_PERCENTAGE

if t_gate_percentage < 0 or t_gate_percentage > 100: 
    t_gate_percentage = DEFAULT_T_GATE_PERCENTAGE

remaining_percentages = 100 - t_gate_percentage

clifford_percentage = remaining_percentages // 3

weights = [clifford_percentage + (100 - 3*clifford_percentage - t_gate_percentage), 
           clifford_percentage, 
           clifford_percentage, 
           t_gate_percentage]

f = open(file_name + ".qasm", "w")

for _ in range(circuit_length):

    gate = random.choices(GATES, weights)[0]
    q1 = random.randint(0, max_qubits)
    f.write(gate + " " + str(q1))

    if gate == 'CNOT':
        q2 = random.randint(0, max_qubits)
        while q2 == q1:
            q2 = random.randint(0, max_qubits)
        f.write(" " + str(q2))
    f.write("\n")

f.close()






