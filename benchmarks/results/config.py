BASE_DIR = 'benchmarks'

MIN_QUBITS = 0

CIRCUIT_NAMES_COMPACT = {
    'ae': 'AE',
    'dj': 'DJ',
    'realamprandom': 'RARC',
    'qft': 'QFT',
    'qwalk-noancilla': 'Q-Walk (NA)',
    'qwalk-v-chain': 'Q-Walk (VC)',
    'groundstate': 'Ground State',
    'twolocalrandom': 'Two-Local Random ',
    'grover-noancilla': 'Grover (NA)',
    'graphstate': 'Graph State',
    'pricingcall': 'Pricing Call',
    'vqe': 'VQE',
    'qnn': 'QNN',
    'portfoliovqe': 'Portfolio (VQE)',
    'wstate': 'W state',
    'portfolioqaoa': 'Portfolio (QAOA)',
    'pricingput': 'Pricing Option',
    'qaoa': 'QAOA',
    'routing': 'Quantum Routing',
    'qpeinexact': 'Inexact QPE',
    'grover-v-chain': 'Grover (VC)',
    'ghz': 'GHZ State',
    'qftentangled': 'Entangled QFT',
    'su2random': 'SU Random',
    'tsp': 'TSP',
    'qpeexact': 'Exact QPE'
}


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
                   'CTQC_rbitvec': 'Row-wise BV',
                   'CTQC_cbitvec': 'Col-wise BV',
                   'CTQC_ptrees': 'Tree', }
