import argparse, signal
import pyzx as zx


def optimize(qasm_file: str, timeout: int):
    print(f'Optimizing {qasm_file}...')

    def timeout_handler(signum, frame):
        raise TimeoutError(f"Timeout reached.")

    signal.signal(signal.SIGALRM, timeout_handler)
    signal.alarm(timeout)

    try:

        circuit = zx.Circuit.from_qasm_file(qasm_file)
        graph = circuit.to_graph() 

        zx.simplify.full_reduce(graph) 
        graph.normalize()
        c_opt = zx.extract_circuit(graph.copy())

        c_opt_qasm = c_opt.to_qasm()
        with open(qasm_file.replace('.qasm', '_optimized.qasm'), 'w') as f:
            f.write(c_opt_qasm)

        print('Successfully optimized the circuit and saved it to', qasm_file.replace('.qasm', '_optimized.qasm'))

    except Exception as e:
        print('An error occurred while optimizing the circuit:', e)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Optimize a qasm file with pyzx.')
    parser.add_argument('-f', type=str, required=True, help='File containing the QASM circuit.')
    parser.add_argument('-t', type=int, default=60, help='Timeout, default is 60 seconds.')
    args = parser.parse_args()
    optimize(args.f, args.t)