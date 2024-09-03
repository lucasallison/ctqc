from simulators.qiskit import Qiskit 
from simulators.quokka_sharp import QuokkaSharp
from simulators.qcec import QCEC
from simulators.ctqc import CTQC

# Timeout in seconds
TIMEOUT = 60

# Path to the directory that will contain the benchmark results
# RESULTS_DIR = 'results/ketgpt/all/'
RESULTS_DIR = 'results/qsharp/all/'

# Set simulators and directories to be benchmarked
SIMULATORS = []
SIM_BENCHMARKS = []

# Set the equivalence checkers and directory pairs to be benchmarked
EQUIV_CHECKERS = [CTQC("map"), Qiskit(), QCEC(), QuokkaSharp()]
EQUIV_BENCHMARKS = [

    # Ketgpt
    # {
    # 'dirs': ('ketgpt_benchmarks/transp_alt_circuits/transp/', 'ketgpt_benchmarks/transp_alt_circuits/opt/'),
    # 'benchmark_name': 'transp_opt'
    # },

    # Algorithm
    {
    'dirs': ('quokka_sharp_benchmarks/algorithm/origin', 'quokka_sharp_benchmarks/algorithm/opt'),
    'benchmark_name': 'qsharp_algorithm_origin_opt'
    },
    {
    'dirs': ('quokka_sharp_benchmarks/algorithm/origin', 'quokka_sharp_benchmarks/algorithm/flip'),
    'benchmark_name': 'qsharp_algorithm_origin_flip'
    },
    {
    'dirs': ('quokka_sharp_benchmarks/algorithm/origin', 'quokka_sharp_benchmarks/algorithm/gm'),
    'benchmark_name': 'qsharp_algorithm_origin_gm'
    },
    {
    'dirs': ('quokka_sharp_benchmarks/algorithm/origin', 'quokka_sharp_benchmarks/algorithm/shift4'),
    'benchmark_name': 'qsharp_algorithm_origin_shift4'
    },
    {
    'dirs': ('quokka_sharp_benchmarks/algorithm/origin', 'quokka_sharp_benchmarks/algorithm/shift7'),
    'benchmark_name': 'qsharp_algorithm_origin_shift7'
    },
]
