import argparse
import os
import sys
import signal
import datetime
import re
import logging
from pathlib import Path
from typing import Dict
from tools.logger import Logger
from qiskit import QuantumCircuit
from qiskit.compiler import transpile
from qiskit import qasm3, qasm2


class Transpiler:

    def __init__(self, log_to_terminal: bool = False):
        self.log_to_terminal = log_to_terminal

    def transpile_dir(
        self,
        dir: str,
        output_dir: str,
        basis_gates: list[str] = None,
        optimization_level: int = 0,
        ignore_list: list[str] = list(),
        timeout: int = 300,
        transpilation_seed: int = 1,
        qasm2_format: bool = False
    ) -> None:
        """
        Transpiles and optimizes all QASM files in the specified directory.

        This function searches the specified `dir` for QASM files, transpiles and optimizes them according to the provided
        parameters, and writes the circuits to the specified `output_dir`. It supports optional
        filtering of files via regular expressions in `ignore_list`.

        Parameters:
            - dir (str): The input directory containing QASM files to transpile.
            - output_dir (str): The directory where the transpiled files will be saved.
            - basis_gates (list[str], optional): The target basis gates for transpilation. Defaults to None.
            - optimization_level (int, optional): The level of optimization to apply. Defaults to 0.
            - ignore_list (list[str], optional): A list of regular expression patterns to ignore files. Defaults to an empty list.
            - timeout (int, optional): Maximum time allowed for transpilation per file, in seconds. Defaults to 300.
            - transpilation_seed (int, optional): The seed for random processes during transpilation. Defaults to 1.
            - qasm2_format (bool, optional): Whether to output in QASM 2.0 format. If set to False, the output will be
                                             in QASM 3.0 formt. Defaults to False.
        """

        if not os.path.isdir(dir):
            raise RuntimeError(f"{dir} is not a directory.")

        if basis_gates is None and optimization_level < 1:
            raise RuntimeError(
                "No basis gates provided and optimization level is 0. Nothing to do.")

        # Create ouptut directory if it does not exist
        Path(output_dir).mkdir(parents=True, exist_ok=False)
        logger = Logger('transpiler_log', os.path.join(
            output_dir, "transpiler.log"), self.log_to_terminal)

        logger.log(f"Basis gates: {basis_gates}")
        logger.log(f"Optimization level: {optimization_level}")
        logger.log(f"Timeout: {timeout} seconds")

        qasm_file_paths = Path(dir).rglob('*.qasm')
        for qasm_file_path in qasm_file_paths:

            if any([bool(re.search(regex, str(qasm_file_path)))
                   for regex in ignore_list]):
                logger.log(
                    f"Ignoring {qasm_file_path}: a pattern in the ignore list matched.")
                continue

            try:
                result = self.transpile(
                    qasm_file_path,
                    basis_gates,
                    optimization_level,
                    timeout,
                    transpilation_seed,
                    qasm2_format)
            except Exception as e:
                logger.log(
                    f"Failed to transpile/optimize `{qasm_file_path}`: {e}",
                    level=logging.ERROR)
                continue

            logger.log(f"Successfully transpiled/optimized `{qasm_file_path}`")

            # Path to the file in the provided directory
            dirpath = Path(*qasm_file_path.parts[1:])

            for type, circuit in result.items():
                new_qasm_file_path = os.path.join(output_dir, type, dirpath)

                os.makedirs(os.path.dirname(new_qasm_file_path), exist_ok=True)
                with open(new_qasm_file_path, "w") as f:
                    f.write(circuit)

    def transpile(
        self,
        qasm_file: str,
        basis_gates: list[str] = None,
        optimization_level: int = 0,
        timeout: int = 300,
        transpilation_seed: int = 1,
        qasm2_format: bool = False
    ) -> Dict:
        """
        Transpiles/optimizes the provided qasm file and returns the result as a dictionary with the following structure:

        {
            'origin': original_circuit,
            'transp': transpiled_circuit,
            'opt': optimized_circuit.
        }

        - If no basis gates are provided the transpilation step is skipped and the 'transp' field will not be present in the result.
        - If the optimization level is 0 the optimization step is skipped and the 'opt' field is not present in the result.
        - If basis gates are provided and the optimization level is greater than 0, then the 'opt' field will contain a circuit that first
          transpiled and then optimized.
        """

        def timeout_handler(signum, frame):
            raise TimeoutError(f"Timeout reached.")

        signal.signal(signal.SIGALRM, timeout_handler)
        signal.alarm(timeout)
        try:
            origin = QuantumCircuit.from_qasm_file(qasm_file)
            transp = transpile(
                origin,
                basis_gates=basis_gates,
                optimization_level=0,
                seed_transpiler=transpilation_seed)
            opt = transpile(
                origin,
                basis_gates=basis_gates,
                optimization_level=optimization_level,
                seed_transpiler=transpilation_seed)
        except Exception as e:
            raise e

        dumps_fn = qasm2.dumps if qasm2_format else qasm3.dumps

        result = {'origin': dumps_fn(origin)}

        if basis_gates is not None:
            result['transp'] = dumps_fn(transp)

        if optimization_level > 0:
            result['opt'] = dumps_fn(opt)

        return result


if __name__ == "__main__":

    parser = argparse.ArgumentParser(
        description='Transpile and/or optimize a directory with QASM circuits to new directory.')
    parser.add_argument('-q', '--qasm-dir', type=str, required=True,
                        help='Directory containing the QASM circuits.')
    parser.add_argument(
        '-o',
        '--output-dir',
        type=str,
        required=True,
        help='Directory to write the transpiled/optimzed circuits to.')
    parser.add_argument(
        '-b',
        '--basis-gates',
        nargs='+',
        type=str,
        default=None,
        help='List of regexes that describe file paths to ignore during transpilation.')
    parser.add_argument(
        '-opt',
        '--optimization-level',
        type=int,
        default=0,
        help='Optimization level used in transpilation. When 0 is provided no optimization is performed. Default is 0.')
    parser.add_argument(
        '-ig',
        '--ignore-list',
        nargs='+',
        type=str,
        default=[],
        help='List of regexes that describe file paths to ignore during transpilation.')
    parser.add_argument(
        '-t',
        '--timeout',
        type=int,
        default=300,
        help='Max time trying to optimize a circuit. Default is 300 seconds.')
    parser.add_argument('-s', '--seed', type=int, default=1,
                        help='Transpiler seed. Default is 1.')
    parser.add_argument('--qasm2', action='store_true',
                        help='Output circuits in QASM 2 format')
    args = parser.parse_args()

    transpiler = Transpiler(True)
    try:
        transpiler.transpile_dir(args.qasm_dir,
                                 args.output_dir,
                                 args.basis_gates,
                                 args.optimization_level,
                                 args.ignore_list,
                                 args.timeout,
                                 args.seed,
                                 args.qasm2)
    except Exception as e:
        print(f"{e}")
        sys.exit(1)
