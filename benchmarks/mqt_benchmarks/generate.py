from __future__ import annotations

import os
from mqt.bench import get_benchmark
from qiskit import QuantumCircuit
from qiskit.qasm2 import dumps

from qiskit.primitives import Sampler
from qiskit_algorithms.minimum_eigensolvers import QAOA
from qiskit_algorithms.optimizers import SLSQP

import networkx as nx
import numpy as np

def qaoa_random_params(num_qubits: int) -> QuantumCircuit:
    """
    Returns a qaoa circuit with random parameters.
    """
    qaoa = QAOA(sampler=Sampler(), reps=2, optimizer=SLSQP(maxiter=2))
    
    random_optimal_point = np.random.random(len(qaoa.ansatz.parameters))

    qc = qaoa.ansatz.assign_parameters(random_optimal_point)
    qc.name = "qaoa"
    return qc

if __name__ == "__main__":


    # algorithms = ["dj", "ghz", "graphstate", "qaoa", "wstate" ]
    algorithms = ["grover-noancilla", "grover-v-chain", "portfolioqaoa", "portfoliovqe", "qft", "qftentangled", "qnn", "qpeexact", "qpeinexact", "qwalk-noancilla", "qwalk-v-chain", "realamprandom", "su2random", "twolocalrandom", "vqe", "shor", "pricingcall", "pricingput", "groundstate", "routing", "tsp" ]

    # wholes = lambda i,j: j*(10**i)
    # halves = lambda i,j: j*(10**i) + (10**i)//2
    # highest_exponent = 3
    # qubit_counts = [f(i, j) for i in range(1, highest_exponent) for j in range(1, 10) for f in (wholes, )] + [j*10**highest_exponent for j in range(1, 6)]

    qubit_counts = [2**i for i in range(3, 16)]
    print(qubit_counts)

    for algorithm in algorithms:

        for qubit_count in qubit_counts:

            circ_file = os.path.join('circuits', f"{algorithm}_{qubit_count}.qasm")
            if os.path.exists(circ_file):
                print(f"{circ_file} already exists. Skipping...")
                continue

            result = get_benchmark(benchmark_name=algorithm, level="indep", circuit_size=qubit_count, compiler="qiskit")

            if isinstance(result, QuantumCircuit):
                qasm = dumps(result)


                with open(circ_file, 'w') as f:
                    f.write(qasm)

                print(f"Generated {algorithm}_{qubit_count}.qasm")
