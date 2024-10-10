from __future__ import annotations

import os
from mqt.bench import get_benchmark
from qiskit import QuantumCircuit
from qiskit.qasm2 import dumps

from qiskit.primitives import Sampler
from qiskit_algorithms.minimum_eigensolvers import QAOA
from qiskit_algorithms.optimizers import SLSQP
from qiskit_optimization import QuadraticProgram
from mqt.bench.utils import get_examplary_max_cut_qp

import networkx as nx
import numpy as np


def get_examplary_max_cut_qp(n_nodes: int, degree: int = 2) -> QuadraticProgram:
    """Returns a quadratic problem formulation of a max cut problem of a random graph.

    Arguments:
        n_nodes: number of graph nodes (and also number of qubits)
        degree: edges per node
    """
    from qiskit_optimization.applications import Maxcut  # noqa: PLC0415 lazy import to reduce import cost

    graph = nx.random_regular_graph(d=degree, n=n_nodes, seed=111)
    maxcut = Maxcut(graph)
    return maxcut.to_quadratic_program()


def qaoa_random_params(num_qubits: int) -> QuantumCircuit:
    """
    Returns a qaoa circuit with random parameters.
    """
    qp = get_examplary_max_cut_qp(num_qubits)
    assert isinstance(qp, QuadraticProgram)

    qaoa = QAOA(sampler=Sampler(), reps=2, optimizer=SLSQP(maxiter=2))
    
    
    # Computing the minium eigenvalue is too expensive, so we just use a random optimal point
    # qaoa_result = qaoa.compute_minimum_eigenvalue(qp.to_ising()[0])
    # qc = qaoa.ansatz.assign_parameters(qaoa_result.optimal_point)

    random_optimal_point = np.random.random(len(qaoa.ansatz.parameters))


    qc = qaoa.ansatz.assign_parameters(random_optimal_point)
    qc.name = "qaoa"
    return qc




if __name__ == "__main__":


    algorithms = ["dj", "ghz", "graphstate", "wstate", ]


    wholes = lambda i,j: j*(10**i)
    halves = lambda i,j: j*(10**i) + (10**i)//2
    highest_exponent = 3
    # qubit_counts = [f(i, j) for i in range(1, highest_exponent) for j in range(1, 10) for f in (wholes, )] + [j*10**highest_exponent for j in range(1, 6)]
    qubit_counts = [2**i for i in range(3, 14)]
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