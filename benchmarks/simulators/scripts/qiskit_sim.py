try:

    import sys
    import time
    from qiskit import QuantumCircuit
    from qiskit_aer import AerSimulator

    circuit = sys.argv[1]

    qc = QuantumCircuit.from_qasm_file(circuit)
    backend = AerSimulator()

    start = time.time()
    # Optionally return information about the simulation results,
    # but we ignore it for now
    result = backend.run(qc, shots=1).result()
    end = time.time()

    print({'runtime': end - start})

except Exception as e:
    print({'exception': str(e)})
