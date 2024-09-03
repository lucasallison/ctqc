import numpy as np, os, json, re

BASE_DIR = 'benchmarks'

CIRCUIT_NAMES_FULL = {
    'ae': 'Amplitude Estimation',
    'dj': 'Deutsch-Josza',
    'realamprandom': 'Real Amplitude Random Circuit',
    'qft': 'Quantum Fourier Transform',
    'qwalk-noancilla': 'Quantum Walk without Ancilla',
    'qwalk-v-chain': 'Quantum Walk with V-Chain',
    'groundstate': 'Ground State',
    'twolocalrandom': 'Two-Local Random Circuit',
    'grover-noancilla': 'Grover\'s Algorithm without Ancilla',
    'graphstate': 'Graph State',
    'pricingcall': 'Pricing Call Option',
    'vqe': 'Variational Quantum Eigensolver',
    'qnn': 'Quantum Neural Network',
    'portfoliovqe': 'Portfolio Optimization using VQE',
    'wstate': 'W State',
    'portfolioqaoa': 'Portfolio Optimization using QAOA',
    'pricingput': 'Pricing Put Option',
    'qaoa': 'QAOA',
    'routing': 'Quantum Routing',
    'qpeinexact': 'Inexact Quantum Phase Estimation',
    'grover-v-chain': 'Grover\'s Algorithm with V-Chain',
    'ghz': 'GHZ State',
    'qftentangled': 'Entangled Quantum Fourier Transform',
    'su2random': 'SU Random Circuit',
    'tsp': 'Traveling Salesman Problem',
    'qpeexact': 'Exact Quantum Phase Estimation'
}

SIMULATOR_NAMES = {'CTQC_map': 'Map',
                   'CTQC_rbitvec': 'Row-wise bitvector',
                   'CTQC_cbitvec': 'Column-wise bitvector',
                   'CTQC_ptrees': 'Tree', }


def rankmin(x):
    """
    Takes in a list of numbers and returns a list of their ranks. Example:
    [7,2,5] -> [2,0,1]
    """
    _, inv, counts = np.unique(x, return_inverse=True, return_counts=True)
    csum = np.zeros_like(counts)
    csum[1:] = counts[:-1].cumsum()
    return csum[inv]


def get_json_files():
    json_files = []
    for root, _, files in os.walk('.'):
        for file in files:
            if file.endswith('.json'):
                json_files.append(os.path.join(root, file))
    return json_files


def load_json_data(file):
    with open(file) as f:
        return json.load(f)
