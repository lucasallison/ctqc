from simulators.qiskit import Qiskit 
from simulators.quokka_sharp import QuokkaSharp
from simulators.qcec import QCEC
from simulators.ctqc import CTQC

# Timeout in seconds
TIMEOUT = 10 * 60

# Path to the directory that will contain the benchmark results
# RESULTS_DIR = 'reproduced_results'
RESULTS_DIR = 'mqt_scaled_results'

# Simulation benchmarks
SIM_BENCHMARKS = []

# Equivalence benchmarks
EQUIV_BENCHMARKS = [

    # Scaled MQT benchmarks   
    {
    'dirs': ('mqt_benchmarks/transp_circuits/transp/', 'mqt_benchmarks/transp_circuits/opt/'),
    'benchmark_name': 'transp_opt',
    'results_subdir': 'mqt_scaled/all', 
    'equiv_checkers': [CTQC(), CTQC(['-d', 'ptrees']), CTQC(['-d', 'rbitvec']), CTQC(['-d', 'cbitvec']), QCEC(), QuokkaSharp()]
    },
]

