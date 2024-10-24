from simulators.qiskit import Qiskit 
from simulators.quokka_sharp import QuokkaSharp
from simulators.qcec import QCEC
from simulators.ctqc import CTQC

# Timeout in seconds
TIMEOUT = 1 * 60

# Path to the directory that will contain the benchmark results
# RESULTS_DIR = 'reproduced_results'
RESULTS_DIR = 'mqt_scaled_results'

# Simulation benchmarks
SIM_BENCHMARKS = []


qiskit_optimized = ["dj", "ghz", "graphstate", "qft", "qftentangled", "qnn", "qpeexact", "qpeinexact", "realamp", "su", "twolocal", "wstate"]
optimized_dirs = ['opt']

# Equivalence benchmarks
EQUIV_BENCHMARKS = [

    # Scaled MQT benchmarks   
    {
    'dirs': (f'mqt_benchmarks/qiskit_optimized/{qo}/transp/', f'mqt_benchmarks/qiskit_optimized/{qo}/{od}'),
    'benchmark_name': f'transp_{od}',
    'results_subdir': f'mqt_scaled/{od}/{qo}', 
    'equiv_checkers': [CTQC(), CTQC(['-d', 'ptrees']), CTQC(['-d', 'rbitvec']), CTQC(['-d', 'cbitvec']), QCEC(), QuokkaSharp()]
    }

    for od in optimized_dirs for qo in qiskit_optimized 
]

