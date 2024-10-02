import sys
import os
import datetime
import logging
import json
import ast
import pathlib
import re
from multiprocessing import Process, Queue
from typing import List, Dict
from pathlib import Path
from tools.logger import Logger
from tools.utils import natural_keys, kill_process_tree, find_file
from simulators.interface import Simulator
from qiskit import qasm3, QuantumCircuit


def circuit_stats(circuit: str) -> Dict:
    """
    Returns the number of qubits, Clifford gates and Rz gates in a circuit. 
    """
    
    qc = QuantumCircuit.from_qasm_file(circuit)
    qasm_circuit = qasm3.dumps(qc)

    qreg_highest_offset = 0
    n_clifford_gates = 0
    n_rz_gates = 0

    for line in qasm_circuit.splitlines(): 
        line = line.rstrip()

        if re.match(r"(h|s) \w+\[\d+\];", line):
            n_clifford_gates += 1

        elif re.match(r"cx \w+\[\d+\], \w+\[\d+\];", line):
            n_clifford_gates += 1

        elif re.match(r"rz(.*) \w+\[\d+\];", line):
            n_rz_gates += 1

        elif re.match(r"t \w+\[\d+\];", line):
            n_rz_gates += 1

        elif re.match(r"^qubit\[\d+\] \w+;", line):
            match = re.match(r"^qubit\[(\d+)\] (\w+);", line)
            n_qubits = int(match.group(1))
            qreg_highest_offset += n_qubits
        
    return {
        'n_qubits': qreg_highest_offset,
        'clif_gates': n_clifford_gates,
        'rz_gates': n_rz_gates
    }


def simulate(
        simulator: Simulator,
        circuit: str,
        equiv_circuit: str,
        result: Queue):
    """
    Performs a simulation or equivalence check on a circuit using a simulator and puts
    the result in a queue.
    """
    try:
        if equiv_circuit is None:
            result.put(simulator.simulate(circuit))
        else:
            result.put(simulator.equivalence_check(circuit, equiv_circuit))

    except Exception as e:
        result.put(e)


def execute_simulation(circuit_benchmark_results: Dict, 
                       simulator: Simulator, circuit: str, 
                       equiv_circuit: str, 
                       timedout: bool, 
                       timeout: int, 
                       logger: Logger):
    """
    Executes a simulation or equivalence check on a circuit using a simulator and stores the results 
    in the provided dictionary.
    """

    circuit_benchmark_results['results'].append({
        'simulator': simulator.name(),
    })

    if timedout[simulator.name()]:
        logger.log(f"{simulator.name()}: Timeout", logging.INFO)
        circuit_benchmark_results['results'][-1]['exception'] = 'Timeout'
        return

    result = Queue()
    p = Process(target=simulate, args=(
        simulator, circuit, equiv_circuit, result))
    p.start()
    p.join(timeout)

    if p.is_alive():
        kill_process_tree(p.pid)
        logger.log(f"{simulator.name()}: Timeout", logging.INFO)
        circuit_benchmark_results['results'][-1]['exception'] = 'Timeout'
        timedout[simulator.name()] = True
        return

    result = result.get()
    if isinstance(result, Exception):
        logger.log(
            f"{simulator.name()}: Exception - {result}",
            logging.ERROR)
        circuit_benchmark_results['results'][-1]['exception'] = str(result)
        return

    if not isinstance(result, dict):
        exception = f"{simulator.name()}: Exception - The simulation or equivalence check did not return a dictionary"
        logger.log(exception)
        circuit_benchmark_results['results'][-1]['exception'] = exception
        return

    logger.log( f"{simulator.name()}: benchmarked {circuit} successfully")
    circuit_benchmark_results['results'][-1]['stats'] = result


def benchmark(circuit_dir: str,
              equiv_circuit_dir: str,
              simulators: List[Simulator],
              results_dir: str,
              benchmark_name: str,
              timeout: int,
              logger: Logger):
    """
    Benchmark multiple simulators on a set of circuits and store the results in the provided
    directory.

    Args:
        - circuit_dir: Directory containing the circuits to benchmark.
        - equiv_circuit_dir: Directory containing equivalent circuits. If none are provided, we perform a simulation on
            the circuits in the `circuit_dir`. If they are, we perform an equivalence check between equivalently named
            circuits in both directories.
        - simulators: List of simulators to benchmark.
        - results_dir: Directory to store benchmark results.
        - benchmark_name: Name of the benchmark.
        - timeout: Maximum time allowed for each simulation in seconds.
    """

    if not os.path.isdir(circuit_dir):
        raise ValueError(f"{circuit_dir} is not a directory.")

    logger.log(f"Starting benchmark '{benchmark_name}'")

    # Get all circuits and sort them
    circuits = [str(path) for path in Path(circuit_dir).rglob('*.qasm')]
    circuits.sort(key=natural_keys)

    # Store results in a temporary file until we convert it to json
    results_tmp_file = os.path.join(results_dir, f"{benchmark_name}_results.tmp")

    timedout = dict()
    prev_circ_name = None

    for circuit in circuits:

        circ_name = os.path.basename(circuit).split('_')[0]

        if prev_circ_name is None or prev_circ_name != circ_name:
            for simulator in simulators:
                timedout[simulator.name()] = False
        
        prev_circ_name = circ_name

        circuit_benchmark_results = {
            'circuit': {
                'file': circuit,
                'stats': circuit_stats(circuit)
            }
        }

        # Find equivalent circuit if equiv_circuit_dir is provided
        equiv_circuit = None if equiv_circuit_dir is None else find_file( equiv_circuit_dir, os.path.basename(circuit))

        if equiv_circuit_dir is not None and equiv_circuit is None:
            logger.log(f"Exception - Failed to find {os.path.basename(circuit)} in {equiv_circuit_dir}")
            continue

        if equiv_circuit is None:
            logger.log(f"Benchmarking simulation of '{circuit}'")
        else: 
            logger.log(f"Benchmarking equivalence check of '{circuit}' and '{equiv_circuit}'")
            circuit_benchmark_results['equiv_circuit'] = {
                'file': equiv_circuit,
                'stats': circuit_stats(equiv_circuit)
            }

        circuit_benchmark_results['results'] = list()
        for simulator in simulators:
            execute_simulation(circuit_benchmark_results, simulator, circuit, equiv_circuit, timedout, timeout, logger)

        # Write temporary results
        results_tmp_file = os.path.join(results_dir, f"{benchmark_name}_results.tmp")
        with open(results_tmp_file, 'a') as f:
            f.write(str(circuit_benchmark_results) + '\n')

    # Convert temporary results to the final json format 
    results = []
    for line in open(results_tmp_file, 'r'):
        results.append(ast.literal_eval(line))

    # Write final results to JSON file
    with open(os.path.join(results_dir, f"{benchmark_name}_results.json"), 'w') as f:
        json.dump(results, f, indent=2)

    pathlib.Path.unlink(results_tmp_file)
    logger.log(f"Finished benchmark '{benchmark_name}'")


if __name__ == "__main__":
    from config import TIMEOUT, RESULTS_DIR, SIM_BENCHMARKS, EQUIV_BENCHMARKS

    print(f"Starting benchmarking with timeout {TIMEOUT} seconds")

    # Create the directory to store the benchmark results 
    if os.path.exists(RESULTS_DIR):
        RESULTS_DIR += f"_{datetime.datetime.now().isoformat(sep='_', timespec='seconds')}"
    os.makedirs(RESULTS_DIR)
    logger = Logger(RESULTS_DIR, os.path.join(RESULTS_DIR, 'benchmarks.log'), True)

    for sim_benchmark in SIM_BENCHMARKS:

        benchmark_name = sim_benchmark['benchmark_name']
        out_dir = os.path.join(RESULTS_DIR, sim_benchmark['results_subdir'])
        simulators = sim_benchmark['simulators']

        os.makedirs(out_dir, exist_ok=True)

        try:
            benchmark(
                sim_benchmark['dir'],
                None,
                simulators,
                out_dir,
                benchmark_name,
                TIMEOUT,
                logger)
        except Exception as e:
            print(
                f"Stopped simulation benchmark '{benchmark_name}': {e}",
                file=sys.stderr)

    for equiv_benchmark in EQUIV_BENCHMARKS:

        benchmark_name = equiv_benchmark['benchmark_name']
        out_dir = os.path.join(RESULTS_DIR, equiv_benchmark['results_subdir'])
        equiv_checkers = equiv_benchmark['equiv_checkers']

        os.makedirs(out_dir, exist_ok=True)

        try:
            benchmark(
                equiv_benchmark['dirs'][0],
                equiv_benchmark['dirs'][1],
                equiv_checkers,
                out_dir,
                benchmark_name,
                TIMEOUT,
                logger)
        except Exception as e:
            print(
                f"Stopped equivalence check benchmark '{benchmark_name}': {e}",
                file=sys.stderr)
