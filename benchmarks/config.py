from simulators.qiskit import Qiskit 
from simulators.quokka_sharp import QuokkaSharp
from simulators.qcec import QCEC
from simulators.ctqc import CTQC

# Timeout in seconds
TIMEOUT = 60

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
    'equiv_checkers': [CTQC(), QCEC(), QuokkaSharp()]
    },

    # KetGPT benchmarks
    # {
    # 'dirs': ('ketgpt_benchmarks/transp_circuits/transp/', 'ketgpt_benchmarks/transp_circuits/opt/'),
    # 'benchmark_name': 'transp_opt',
    # 'results_subdir': 'ketgpt/all', 
    # 'equiv_checkers': [CTQC(), Qiskit(), QCEC(), QuokkaSharp()]
    # },

    # # QuokkaSharp benchmarks
    # {
    # 'dirs': ('quokka_sharp_benchmarks/algorithm_distilled/origin', 'quokka_sharp_benchmarks/algorithm_distilled/opt'),
    # 'benchmark_name': 'qsharp_algorithm_origin_opt', 
    # 'results_subdir': 'quokka_sharp/all', 
    # 'equiv_checkers': [CTQC(), Qiskit(), QCEC(), QuokkaSharp()]
    # },
    # {
    # 'dirs': ('quokka_sharp_benchmarks/algorithm_distilled/origin', 'quokka_sharp_benchmarks/algorithm_distilled/flip'),
    # 'benchmark_name': 'qsharp_algorithm_origin_flip',
    # 'results_subdir': 'quokka_sharp/all', 
    # 'equiv_checkers': [CTQC(), Qiskit(), QCEC(), QuokkaSharp()]
    # },
    # {
    # 'dirs': ('quokka_sharp_benchmarks/algorithm_distilled/origin', 'quokka_sharp_benchmarks/algorithm_distilled/gm'),
    # 'benchmark_name': 'qsharp_algorithm_origin_gm',
    # 'results_subdir': 'quokka_sharp/all',
    # 'equiv_checkers': [CTQC(), Qiskit(), QCEC(), QuokkaSharp()]
    # },
    # {
    # 'dirs': ('quokka_sharp_benchmarks/algorithm_distilled/origin', 'quokka_sharp_benchmarks/algorithm_distilled/shift4'),
    # 'benchmark_name': 'qsharp_algorithm_origin_shift4',
    # 'results_subdir': 'quokka_sharp/all',
    # 'equiv_checkers': [CTQC(), Qiskit(), QCEC(), QuokkaSharp()]
    # },
    # {
    # 'dirs': ('quokka_sharp_benchmarks/algorithm_distilled/origin', 'quokka_sharp_benchmarks/algorithm_distilled/shift7'),
    # 'benchmark_name': 'qsharp_algorithm_origin_shift7', 
    # 'results_subdir': 'quokka_sharp/all', 
    # 'equiv_checkers': [CTQC(), Qiskit(), QCEC(), QuokkaSharp()]
    # },

    # # QuokkaSharp benchmarks: Generator Sets
    # {
    # 'dirs': ('quokka_sharp_benchmarks/algorithm_distilled/origin', 'quokka_sharp_benchmarks/algorithm_distilled/opt'),
    # 'benchmark_name': 'qsharp_algorithm_origin_opt', 
    # 'results_subdir': 'quokka_sharp/gensets', 
    # 'equiv_checkers': [CTQC(['-d', 'map']), 
    #                    CTQC(['-d', 'rbitvec']), 
    #                    CTQC(['-d', 'cbitvec']), 
    #                    CTQC(['-d', 'ptrees'])]
    # },
    # {
    # 'dirs': ('quokka_sharp_benchmarks/algorithm_distilled/origin', 'quokka_sharp_benchmarks/algorithm_distilled/flip'),
    # 'benchmark_name': 'qsharp_algorithm_origin_flip',
    # 'results_subdir': 'quokka_sharp/gensets', 
    # 'equiv_checkers': [CTQC(['-d', 'map']), 
    #                    CTQC(['-d', 'rbitvec']), 
    #                    CTQC(['-d', 'cbitvec']), 
    #                    CTQC(['-d', 'ptrees'])]
    # },
    # {
    # 'dirs': ('quokka_sharp_benchmarks/algorithm_distilled/origin', 'quokka_sharp_benchmarks/algorithm_distilled/gm'),
    # 'benchmark_name': 'qsharp_algorithm_origin_gm',
    # 'results_subdir': 'quokka_sharp/gensets', 
    # 'equiv_checkers': [CTQC(['-d', 'map']), 
    #                    CTQC(['-d', 'rbitvec']), 
    #                    CTQC(['-d', 'cbitvec']), 
    #                    CTQC(['-d', 'ptrees'])]
    # },
    # {
    # 'dirs': ('quokka_sharp_benchmarks/algorithm_distilled/origin', 'quokka_sharp_benchmarks/algorithm_distilled/shift4'),
    # 'benchmark_name': 'qsharp_algorithm_origin_shift4',
    # 'results_subdir': 'quokka_sharp/gensets', 
    # 'equiv_checkers': [CTQC(['-d', 'map']), 
    #                    CTQC(['-d', 'rbitvec']), 
    #                    CTQC(['-d', 'cbitvec']), 
    #                    CTQC(['-d', 'ptrees'])]
    # },
    # {
    # 'dirs': ('quokka_sharp_benchmarks/algorithm_distilled/origin', 'quokka_sharp_benchmarks/algorithm_distilled/shift7'),
    # 'benchmark_name': 'qsharp_algorithm_origin_shift7', 
    # 'results_subdir': 'quokka_sharp/gensets', 
    # 'equiv_checkers': [CTQC(['-d', 'map']), 
    #                    CTQC(['-d', 'rbitvec']), 
    #                    CTQC(['-d', 'cbitvec']), 
    #                    CTQC(['-d', 'ptrees'])]
    # },

]

