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


def create_circuit(num_qubits: int) -> QuantumCircuit:
    """Returns a quantum circuit implementing the Quantum Approximation Optimization Algorithm for a specific max-cut example.

    Arguments:
        num_qubits: number of qubits of the returned quantum circuit

    Returns:
        QuantumCircuit: quantum circuit implementing the Quantum Approximation Optimization Algorithm
    """
    qp = get_examplary_max_cut_qp(num_qubits)
    assert isinstance(qp, QuadraticProgram)

    qaoa = QAOA(sampler=Sampler(), reps=2, optimizer=SLSQP(maxiter=25))
    
    
    # Computing the minium eigenvalue is too expensive, so we just use a random optimal point
    qaoa_result = qaoa.compute_minimum_eigenvalue(qp.to_ising()[0])
    # qc = qaoa.ansatz.assign_parameters(qaoa_result.optimal_point)

    print('optimal: ', qaoa_result.optimal_point)



    from qiskit_optimization.algorithms import MinimumEigenOptimizer
    from qiskit_optimization.converters import QuadraticProgramToQubo
    from qiskit.algorithms import ClassicalMinimumEigensolver

    # Convert the QuadraticProgram to a QUBO (Quadratic Unconstrained Binary Optimization)
    qp_qubo = QuadraticProgramToQubo().convert(qp)

    # Solve classically to get a warm start
    classical_solver = MinimumEigenOptimizer(ClassicalMinimumEigensolver())
    classical_result = classical_solver.solve(qp_qubo)

    # Use classical solution as an initial guess for quantum parameters
    initial_params = np.array(classical_result.x)

    print('Guess:', initial_params)


    random_optimal_point = np.random.random(len(qaoa.ansatz.parameters))


    print('Random:', random_optimal_point)




    #qc = qaoa.ansatz.assign_parameters(qaoa_result.optimal_point)
    #qc.name = "qaoa"
    #return qc
    return 1




if __name__ == "__main__":


    print(create_circuit(1000))


    exit(0)




    algorithms = ["dj", "ghz", "graphstate", "wstate", ]

    qubit_counts = [i*(10**j) for j in range(2, 4) for i in range(1, 10)]

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