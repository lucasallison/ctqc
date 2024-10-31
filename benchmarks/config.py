from simulators.qiskit import Qiskit 
from simulators.quokka_sharp import QuokkaSharp
from simulators.qcec import QCEC
from simulators.ctqc import CTQC

# Timeout in seconds
TIMEOUT = 5 * 60

# Path to the directory that will contain the benchmark results
# RESULTS_DIR = 'reproduced_results'
RESULTS_DIR = 'mqt_scaled_results'

# Simulation benchmarks
SIM_BENCHMARKS = []

optimized_dirs = ['gm'] # 'flipped', 'swap', 'gm', 'shift4', 'shift7']

algorithm = 'full'
# algorithm = 'qnn'
# algorithm = 'qpeexact'
# algorithm = 'qpeinexact'
# algorithm = 'su'
# algorithm = 'wstate'

optimizer = 'qiskit'
# optimizer = 'pyzx'

# Equivalence benchmarks
EQUIV_BENCHMARKS = [

    # Scaled MQT benchmarks   
    {
    'dirs': (f'mqt_benchmarks/{optimizer}_optimized/{algorithm}/transp/', f'mqt_benchmarks/{optimizer}_optimized/{algorithm}/{od}'),
    'benchmark_name': f'quokka',
    'results_subdir': f'{optimizer}/{od}', 
    'equiv_checkers': [CTQC(), QCEC(), QuokkaSharp()]
    # 'equiv_checkers': [CTQC(), CTQC(['-d', 'ptrees', '-p']), CTQC(['-d', 'rbitvec', '-p']), CTQC(['-d', 'cbitvec', '-p'])]
    # 'equiv_checkers': [QuokkaSharp()]
    }
    for od in optimized_dirs 
]

