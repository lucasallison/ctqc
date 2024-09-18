import numpy as np
from qiskit import QuantumCircuit
from qiskit.circuit.library import Initialize
from qiskit.quantum_info import Statevector

def state_to_braket(state_vector, precision=3):
    n_qubits = int(np.log2(len(state_vector)))
    terms = []
    for i, amplitude in enumerate(state_vector):
        if abs(amplitude) > 1e-10:  # Ignore very small amplitudes
            # Convert index to binary string
            ket = format(i, f'0{n_qubits}b')
            # Round the amplitude and format it
            if abs(amplitude.real) < 1e-10:
                amplitude = amplitude.imag * 1j
            elif abs(amplitude.imag) < 1e-10:
                amplitude = amplitude.real
            amplitude_str = f"{amplitude:.{precision}f}".rstrip('0').rstrip('.')
            if amplitude_str == '1':
                terms.append(f"|{ket}⟩")
            elif amplitude_str == '-1':
                terms.append(f"-|{ket}⟩")
            else:
                terms.append(f"{amplitude_str}|{ket}⟩")
    return " + ".join(terms)

qc = QuantumCircuit(3)

qc.h(0)
qc.cx(0, 1)
qc.h(1)

# Get the statevector
state = Statevector(qc)

# Print the state in bra-ket notation
print(state_to_braket(state))
