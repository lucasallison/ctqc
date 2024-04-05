import argparse
import sys
from ctqc_utils import generate_random_ctqc_circuit, DEFAULT_T_GATE_PERCENTAGE

parser = argparse.ArgumentParser(description='Generate a random CTQC circuit with H, S, CNOT and T gates.')
parser.add_argument('-f', type=str, required=True, help='File to write the circuit to.')
parser.add_argument('-q', type=int, required=True, help='Number of qubits in the circuit.')
parser.add_argument('-g', type=int, required=True, help='Number of gates in the circuit.')
parser.add_argument('--no_measurements', action='store_true', help='Include measurements in the circuit.')
parser.add_argument('--t_gate_percentage', type=int, default=DEFAULT_T_GATE_PERCENTAGE, help='Percentage of T gates in the circuit.')

args = parser.parse_args()

try:
    generate_random_ctqc_circuit(args.f, args.q, args.g, not args.no_measurements, args.t_gate_percentage)
except Exception as e:
    print(e, file=sys.stderr)