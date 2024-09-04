import os
import re
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
import pandas as pd
from tqdm import tqdm
from utils import get_json_files, load_json_data
from heatmaps import initialize_aggregates, process_benchmark, prepare_heatmap_data
from qiskit import qasm3, QuantumCircuit
from scipy.stats import entropy

def get_rz_entropy(circuit):

    if re.search('transp_alt_circuit', circuit):
        circuit = circuit.replace('transp_alt_circuit', 'transp_circuit')

    circuit = os.path.join('..', circuit)
    
    qc = QuantumCircuit.from_qasm_file(circuit)
    qasm_circuit = qasm3.dumps(qc)

    qreg_highest_offset = 0
    circuit_started = False
    qubits = None

    for line in qasm_circuit.splitlines(): 
        line = line.rstrip()

        if re.match(r"rz(.*) \w+\[\d+\];", line):
            if not circuit_started:
                circuit_started = True
                qubits = [0] * qreg_highest_offset

            match = re.match(r"rz(.*) \w+\[(\d+)\];", line)
            target_qubit = int(match.group(2))
            qubits[target_qubit] += 1

        elif re.match(r"t \w+\[\d+\];", line):
            if not circuit_started:
                print(qreg_highest_offset)
                circuit_started = True
                qubits = [0] * qreg_highest_offset

            match = re.match(r"t \w+\[(\d+)\];", line)
            target_qubit = int(match.group(1))
            qubits[target_qubit] += 1

        elif re.match(r"^qubit\[\d+\] \w+;", line):
            match = re.match(r"^qubit\[(\d+)\] (\w+);", line)
            n_qubits = int(match.group(1))
            qreg_highest_offset += n_qubits
    
    if qubits is None:
        return 0
        
    return entropy(qubits, base=qreg_highest_offset)


def gates_per_qubit(benchmark):
    c_total_gates = int(benchmark['circuit']['stats']['clif_gates']) + int(benchmark['circuit']['stats']['rz_gates'])
    ec_total_gates = int(benchmark['equiv_circuit']['stats']['clif_gates']) + int(benchmark['equiv_circuit']['stats']['rz_gates'])
    n_qubits = int(benchmark['circuit']['stats']['n_qubits'])
    return (c_total_gates + ec_total_gates) / (2*n_qubits)


def calc_clif_percentage(benchmark):
    c_total_gates = int(benchmark['circuit']['stats']['clif_gates']) + int(benchmark['circuit']['stats']['rz_gates'])
    c_clif_gates = int(benchmark['circuit']['stats']['clif_gates'])

    ec_total_gates = int(benchmark['equiv_circuit']['stats']['clif_gates']) + int(benchmark['equiv_circuit']['stats']['rz_gates'])
    ec_clif_gates = int(benchmark['equiv_circuit']['stats']['clif_gates'])

    return (c_clif_gates + ec_clif_gates) / (c_total_gates + ec_total_gates)


def plot_results(df, benchmark_name, out_dir):

    _, ax = plt.subplots()
    sns.lineplot(data=df, ax=ax, markers=True)
    ax.set_xlabel('Percentage of clifford gates')
    ax.set_ylabel('Ranking')
    ax.set_yticks([i for i in range(1, len(df.columns) + 1)])
    ax.set_yticklabels([i for i in range(1, len(df.columns) + 1)])
    plt.xticks(rotation=90)
    plt.savefig(os.path.join(out_dir, benchmark_name+"_clif_percentage_plot.png"), bbox_inches="tight")
    plt.close()


def main():
    files = get_json_files()
    for file in files:

        if not re.search('ketgpt', file):
            continue
        
        data = load_json_data(file)
        simulators = [res['simulator'] for res in data[0]['results']]
        time_aggregates, memory_aggregates = initialize_aggregates(simulators)
        circuits = []
        cum_clif_percentage = []
        cum_rz_entropy = []
        cum_gates_per_qubit = []

        for benchmark in tqdm(data):
            if all('exception' in result for result in benchmark['results']) or int(benchmark['circuit']['stats']['n_qubits']) <= 5:
                continue

            circuit = benchmark['circuit']['file']
            equiv_circuit = benchmark['equiv_circuit']['file']
            curr_benchmark = circuit.split('/')[-1].split('.')[0].split('_')[0]

            if not circuits or curr_benchmark != circuits[-1]:
                cum_clif_percentage.append((calc_clif_percentage(benchmark), 1))
                cum_rz_entropy.append((get_rz_entropy(circuit) + get_rz_entropy(equiv_circuit), 2))
                cum_gates_per_qubit.append((gates_per_qubit(benchmark), 1))
            else:
                cum_clif_percentage[-1] = (cum_clif_percentage[-1][0] + calc_clif_percentage(benchmark), cum_clif_percentage[-1][1] + 1)
                cum_rz_entropy[-1] = (cum_rz_entropy[-1][0] + get_rz_entropy(circuit) + get_rz_entropy(equiv_circuit), cum_rz_entropy[-1][1] + 2)
                cum_gates_per_qubit[-1] = (cum_gates_per_qubit[-1][0] + gates_per_qubit(benchmark), cum_gates_per_qubit[-1][1] + 1)

            process_benchmark(benchmark, simulators, time_aggregates, memory_aggregates, circuits)
        
        time_heatmap_data, circuits_full, simulators_full = prepare_heatmap_data(time_aggregates, circuits, simulators)
        avg_clif_percentage = [int(c[0] * 100 // c[1]) for c in cum_clif_percentage]
        avg_rz_entropy = [round(c[0] / c[1], 2) for c in cum_rz_entropy]
        avg_gates_per_qubit = [int(c[0] / c[1]) for c in cum_gates_per_qubit] 
        
        df = pd.DataFrame(columns=['clif_percentage', 'rz_entropy', 'gates_per_qubit']+simulators_full)
        for i, circuit in enumerate(circuits_full):
            # df.loc[circuit + f" ({avg_clif_percentage[i]}%)"] = [avg_clif_percentage[i]] + [time_heatmap_data[i][j] + 1 for j in range(len(simulators_full))]
            df.loc[circuit] = [avg_clif_percentage[i], avg_rz_entropy[i], avg_gates_per_qubit[i]] + [time_heatmap_data[i][j] + 1 for j in range(len(simulators_full))]

        df = df.sort_values(by='Map')
        print(df)
        # df = df.drop(columns=['clif_percentage'], axis=1)
        # plot_results(df, os.path.basename(file).split('.')[0], out_dir = os.path.dirname(file))


if __name__ == "__main__":
    main()