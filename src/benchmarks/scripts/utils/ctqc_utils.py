import random

GATES = ['H', 'S', 'CNOT', 'T']
DEFAULT_T_GATE_PERCENTAGE = 25

def generate_random_ctqc_circuit(file: str, n_qubits: int, n_gates: int, measurements: bool=True, t_gate_percentage: int=DEFAULT_T_GATE_PERCENTAGE):
    '''
    Generates a CTQC circuit with H, S, CNOT and T gates randomly and writes it to the provided file.
    
    Args:
        file (str): The name of the file to write the circuit to.
        n_qubits (int): The number of qubits in the circuit. Must be at least 2.
        n_gates (int): The number of gates in the circuit. Must be greater than 0.
        measurements (bool, optional): If True, measurements are added to the circuit. Default is True.
        t_gate_percentage (int, optional): The percentage of T gates in the circuit. Must be between 0 and 100. 
            The remainder is divided equally among H, S, and CNOT gates. Default is DEFAULT_T_GATE_PERCENTAGE=25.

    Raises:
    ValueError: If n_qubits is less than 2, if n_gates is less than or equal to 0, or if t_gate_percentage is not between 0 and 100.
    '''

    if n_qubits < 2:
        raise ValueError("n_qubits must be at least 2")
    
    if n_gates < 1:
        raise ValueError("n_gates must be greater than 0")

    if t_gate_percentage < 0 or t_gate_percentage > 100: 
        raise ValueError("t_gate_percentage must be between 0 and 100")
    
    # Qubits are 0-indexed
    max_addressible_qubit = n_qubits - 1
        
    individual_clif_gate_percentage = (100 - t_gate_percentage) // 3

    gate_weights = 3*[individual_clif_gate_percentage] + [t_gate_percentage]

    with open(file, "w") as circuit:

        # The number of qubits stored in a CTQC circuit is the highest addressed qubit + 1.
        # To ensure that the circuit consists of the specified number of qubits, we need to add
        # at least one gate that addresses the highest qubit.
        gate_addressing_high_qubit = random.randint(0, n_gates-1)

        for gate_ind in range(n_gates):

            gate = random.choices(GATES, gate_weights)[0]

            if gate_ind == gate_addressing_high_qubit:
                q1 = max_addressible_qubit
            else:
                q1 = random.randint(0, max_addressible_qubit)

            circuit.write(gate + " " + str(q1))

            if gate == 'CNOT':
                q2 = random.randint(0, max_addressible_qubit)
                while q2 == q1:
                    q2 = random.randint(0, max_addressible_qubit)
                circuit.write(" " + str(q2))

            circuit.write("\n")

        if measurements:
            for q in range(n_qubits):
                circuit.write("M " + str(q) + "\n")