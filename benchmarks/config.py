from simulators.qiskit import Qiskit 
from simulators.quokka_sharp import QuokkaSharp
from simulators.qcec import QCEC
from simulators.ctqc import CTQC

# Path to the directory that will contain the benchmark results
RESULTS_DIR = 'mqt_results_reproduced'

# Simulation benchmarks
SIM_BENCHMARKS = []

equiv_dirs = ['opt', 'flipped', 'gm', 'shift4', 'shift7']

algorithms = ["ae", "dj", "ghz", "graphstate", "grover", "portfolio", "qaoa", "qft", "qftentangled", "qnn", "qpeexact", "qpeinexact", "qwalk", "realamp", "su", "twolocal", "vqe", "wstate"]

optimizer = 'qiskit'

equiv_checkers = [QCEC(), QuokkaSharp(), CTQC(), CTQC(['-d', 'map']),  CTQC(['-d', 'ptrees']), CTQC(['-d', 'rbitvec']), CTQC(['-d', 'cbitvec'])]

# Equivalence benchmarks
EQUIV_BENCHMARKS = [

    # Scaled MQT benchmarks   
    {
    'dirs': (f'mqt_circuits/{optimizer}_optimized/{algorithm}/transp/', f'mqt_circuits/{optimizer}_optimized/{algorithm}/{ed}'),
    'benchmark_name': '_'.join(ec.name() for ec in equiv_checkers),
    'results_subdir': f'{optimizer}/{ed}', 
    'equiv_checkers': equiv_checkers,
    'timeout': 10 * 60 if ed == 'opt' else 3 * 60
    }
    for ed in equiv_dirs for algorithm in algorithms 
]