from simulators.qiskit import Qiskit 
from simulators.quokka_sharp import QuokkaSharp
from simulators.qcec import QCEC
from simulators.ctqc import CTQC

# Timeout in seconds
TIMEOUT = 2 # 10 * 60

# Path to the directory that will contain the benchmark results
# RESULTS_DIR = 'reproduced_results'
RESULTS_DIR = 'mqt_scaled_all'

# Simulation benchmarks
SIM_BENCHMARKS = []

equiv_dirs = ['opt'] # ['opt', 'flipped', 'gm', 'shift4', 'shift7']

algorithms = ["ae", "dj", "ghz", "graphstate", "grover", "portfolio", "qaoa", "qft", "qftentangled", "qnn", "qpeexact", "qpeinexact", "qwalk", "realamp", "su", "twolocal", "vqe", "wstate"]

optimizer = 'qiskit'
# optimizer = 'pyzx'

# equiv_checkers = [CTQC(), QCEC(), QuokkaSharp()]
# equiv_checkers = [CTQC(), CTQC(['-d', 'ptrees', '-p']), CTQC(['-d', 'rbitvec', '-p']), CTQC(['-d', 'cbitvec', '-p'])]
equiv_checkers = [QuokkaSharp()]


# Equivalence benchmarks
EQUIV_BENCHMARKS = [

    # Scaled MQT benchmarks   
    {
    'dirs': (f'mqt_benchmarks/{optimizer}_optimized/{algorithm}/transp/', f'mqt_benchmarks/{optimizer}_optimized/{algorithm}/{ed}'),
    'benchmark_name': '_'.join(ec.name() for ec in equiv_checkers),
    'results_subdir': f'{optimizer}/{ed}', 
    'equiv_checkers': equiv_checkers,
    }
    for ed in equiv_dirs for algorithm in algorithms 
]