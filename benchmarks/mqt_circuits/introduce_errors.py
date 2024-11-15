import random, re, argparse
from qiskit import QuantumCircuit, qasm2
from math import pi
import random


def flip_random_cx_gate(qasm_filename):
    with open(qasm_filename, 'r') as file:
        lines = file.readlines()
    
    cx_indices = []
    for i, line in enumerate(lines):
        if 'cx' in line.lower().strip():
            cx_indices.append(i)
    
    if not cx_indices:
        return ''.join(lines)  
    
    random_cx_index = random.choice(cx_indices)
    line = lines[random_cx_index]

    m = re.match(r"cx (\w+)\[(\d+)\], ?(\w+)\[(\d+)\];", line)
    if m:
        qreg1 = m.group(1)
        qubit1 = int(m.group(2))
        qreg2 = m.group(3)
        qubit2 = int(m.group(4))
        new_line = f"cx {qreg1}[{qubit2}],{qreg2}[{qubit1}];\n"
        lines[random_cx_index] = new_line
    else:
        raise RuntimeError(f'Failed flipping cx gate; no "cx" gate in "{line}"')

    modified_qasm = ''.join(lines)
    modified_circuit = QuantumCircuit.from_qasm_str(modified_qasm)
    return modified_circuit
    

def add_random_swap_to_qasm(qasm_file):
    circuit = QuantumCircuit.from_qasm_file(qasm_file)
    
    num_qubits = circuit.num_qubits
    
    if num_qubits < 2:
        raise ValueError("Circuit must have at least 2 qubits to add a SWAP gate")
    
    new_circuit = QuantumCircuit(circuit.num_qubits, circuit.num_clbits)
    
    # Choose two random different qubits for the SWAP gate
    qubit1, qubit2 = 0, 0
    
    while qubit1 == qubit2:
        qubit1, qubit2 = random.sample(range(num_qubits), 2)
    
    new_circuit.swap(qubit1, qubit2)
    
    new_circuit = new_circuit.compose(circuit)
    
    return new_circuit


def remove_random_gate_from_qasm(filename):
    circuit = QuantumCircuit.from_qasm_file(filename)
    
    instructions = circuit.data
    
    if not instructions:
        raise ValueError("Circuit is empty")
    
    removed_instruction = random.choice(instructions)
    removed_instruction_index = instructions.index(removed_instruction)

    new_circuit = QuantumCircuit()

    for qreg in circuit.qregs:
        new_circuit.add_register(qreg)

    for creg in circuit.cregs:
        new_circuit.add_register(creg)

    for i, inst in enumerate(instructions):
        if i != removed_instruction_index:
            gate = inst.operation  
            qubits = inst.qubits   
            clbits = inst.clbits   

            try:
                new_circuit.append(gate, qubits, clbits)
            except Exception as e:
                raise RuntimeError(f"Failed to append instruction {inst} to the new circuit: {e}")


    
    return new_circuit


def extract_rotation_value(gate_str):
    """
    Extract rotation angle value from a gate string.
    Example: 'rx(pi/2)' -> pi/2
    """
    match = re.search(r'\((.*?)\)', gate_str)
    if match:
        expr = match.group(1)
        # Convert pi expressions to float
        if 'pi' in expr.lower():
            expr = expr.lower().replace('pi', str(pi))
            return eval(expr)
        return float(expr)
    return None


def add_phase_shift_error(angle, error_magnitude):
    """
    Add phase shift error to rotation angle.
    """
    return angle + error_magnitude


def process_qasm_with_errors(qasm_filename, error_magnitude):
    """
    Process QASM content and add phase shift errors to rotation gates.
    """

    with open(qasm_filename, 'r') as file:
        lines = file.readlines()

    # List of rotation gates to modify
    rotation_gates = ['rx', 'ry', 'rz', 'u1', 'u2', 'u3']
    
    modified_lines = []
    
    for line in lines:
        modified_line = line
        
        # Skip empty lines and comments
        if not line.strip() or line.strip().startswith('//'):
            modified_lines.append(line)
            continue
            
        # Check for rotation gates
        for gate in rotation_gates:
            if gate in line.lower():
                # Find all rotation angles in the line
                pattern = fr"{gate}\((.*?)\)"
                matches = re.finditer(pattern, line, re.IGNORECASE)
                
                for match in matches:
                    original_expr = match.group(1)
                    angle = extract_rotation_value(match.group(0))
                    
                    if angle is not None:
                        # Add error to the angle
                        new_angle = add_phase_shift_error(angle, error_magnitude)
                        # Replace the original expression with the new angle
                        modified_line = modified_line.replace(f"({original_expr})", f"({new_angle})")
        
        modified_lines.append(modified_line)
    
    modified_circuit = QuantumCircuit.from_qasm_str('\n'.join(modified_lines))
    return modified_circuit

def save_modified_circuit(circuit, output_filename):
    with open(output_filename, 'w') as f:
        qasm2.dump(circuit,f)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Optimize a qasm file with pyzx.')
    parser.add_argument('-f', type=str, required=True, help='File containing the QASM circuit.')
    args = parser.parse_args()

    print(f'Introducing errors to {args.f}...')

    flip = flip_random_cx_gate(args.f)
    save_modified_circuit(flip, args.f.replace('.qasm', '_flipped.qasm'))

    swap = add_random_swap_to_qasm(args.f)
    save_modified_circuit(swap, args.f.replace('.qasm', '_swap.qasm'))

    gm = remove_random_gate_from_qasm(args.f)
    save_modified_circuit(gm, args.f.replace('.qasm', '_gm.qasm'))

    shift4 = process_qasm_with_errors(args.f, 1e-4)
    save_modified_circuit(shift4, args.f.replace('.qasm', '_shift4.qasm'))
    
    shift7 = process_qasm_with_errors(args.f, 1e-7)
    save_modified_circuit(shift7, args.f.replace('.qasm', '_shift7.qasm'))
