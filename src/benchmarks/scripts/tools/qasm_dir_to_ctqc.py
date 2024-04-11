import argparse
import sys
import os

# Add the parent directory of tools and utils to the sys.path list
parent_dir = os.path.join(os.path.dirname(__file__), '..')
sys.path.append(parent_dir)

from utils.qasm_utils import qasm_dir_to_ctqc

parser = argparse.ArgumentParser(description='Transpile a directory with QASM circuits to a directory with CTQC circuits.')

parser.add_argument('-q', type=str, required=True, help='Directory containing the QASM circuits.')
parser.add_argument('-o', type=str, required=True, help='Directory to write the CTQC circuits to.')
parser.add_argument('-opt', type=int, default=0, help='Optimization level used in transpilation. Default is 0.')
args = parser.parse_args()

try:
    qasm_dir_to_ctqc(args.q, args.o, args.opt)
except Exception as e:
    print(e, file=sys.stderr)