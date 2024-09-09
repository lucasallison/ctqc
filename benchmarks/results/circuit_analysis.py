import os
import re
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
import pandas as pd
from tqdm import tqdm
from utils import get_json_files, load_json_data
from heatmaps import initialize_aggregates, process_benchmark, prepare_heatmap_data
from config import CIRCUIT_NAMES_COMPACT
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


def clif_percentage_plot(df, benchmark_name, out_dir):

    new_index_name = {index: index + f' ({int(clif_percentage)}%)'  for (index, clif_percentage) in zip(df.index, df['clif_percentage'])}
    df = df.rename(index = new_index_name)
    df = df.sort_values(by='clif_percentage')
    df = df.drop(columns=['clif_percentage', 'rz_entropy', 'gates_per_qubit'], axis=1)

    _, ax = plt.subplots(figsize=(5, 2))
    sns.lineplot(data=df, ax=ax, markers=True)
    ax.set_xlabel('Algorithm (Average Clifford gate percentage)')
    ax.set_ylabel('Relative time \nperformance')
    ax.set_yticks([i for i in range(1, len(df.columns) + 1)])
    ax.set_yticklabels([i for i in range(1, len(df.columns) + 1)])
    ax.legend(bbox_to_anchor=(1.05, 1), loc='upper left', borderaxespad=0.)
    plt.xticks(rotation=90)
    plt.savefig(os.path.join(out_dir, benchmark_name+"_clif_percentage_plot.png"), bbox_inches="tight")
    plt.close()


def max_qubit_plot(df, benchmark_name, out_dir):
    _, ax = plt.subplots(figsize=(5, 5))
    sns.lineplot(data=df, ax=ax, markers=True)
    ax.set_xlabel('Algorithm ')
    ax.set_ylabel('Maximum #Qubits ')
    ax.legend(bbox_to_anchor=(1.05, 1), loc='upper left', borderaxespad=0.)
    plt.xticks(rotation=90)
    plt.savefig(os.path.join(out_dir, benchmark_name+"_max_attainable_qubit_plot.png"), bbox_inches="tight")
    plt.close()


def circuit_properties_tex_table(df): 

    df = df.drop(columns=['Map', 'Qiskit', 'QCEC', 'QuokkaSharp'], axis=1)     
    
    headers = ['circuit'] + list(df.columns)

    table = "\\begin{center} \n"
    table += f"\\begin{{tabular}}{{ |{'|'.join('c'*len(headers))}| }} \n"
    table += "\hline \n"
    table += "&".join('\\textbf{' + header + '}' for header in headers) + " \\\\ \n"
    table += "\hline \n \hline \n"

    for index, row in df.iterrows():
        table += str(index) + '&' + '&'.join(str(val) for val in row) + " \\\\ \n"
        table += "\hline \n"
    
    table += "\end{tabular} \n"
    table += "\end{center} \n"
    print(table)

def update_max_qubit_table(benchmark, circuits, simulators, max_qubit_df):

    qubit = int(benchmark['circuit']['stats']['n_qubits'])
    curr_benchmark_full = benchmark['circuit']['file'].split('/')[-1].split('.')[0].split('_')[0]
    curr_benchmark = CIRCUIT_NAMES_COMPACT.get(curr_benchmark_full, curr_benchmark_full)

    if not circuits or curr_benchmark != max_qubit_df.index[-1]:
        max_qubit_df.loc[curr_benchmark] = [0] * (len(simulators) + 1)

    for result in benchmark['results']:
        if result.get('stats', {}).get('equivalence', '') == 'no_information':
            del result['stats']

        if 'stats' in result:
            max_qubit_df.loc[curr_benchmark, result['simulator']] = max(max_qubit_df.loc[curr_benchmark, result['simulator']], qubit)

    max_qubit_df.loc[curr_benchmark, 'highest_n_qubit'] = max(max_qubit_df.loc[curr_benchmark, 'highest_n_qubit'], int(benchmark['circuit']['stats']['n_qubits']))

def print_tex_table_body(df):
    print('* Headers:')
    print('Index & ' + ' & '.join(df.columns))
    print('* Body:')
    table_body = ""
    for index, row in df.iterrows():
        table_body += str(index) + '&' + '&'.join(str(val) for val in row) + " \\\\ \n"
        table_body += "\hline \n"
    print(table_body)

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
        max_qubit_df = pd.DataFrame(columns=['highest_n_qubit']+simulators)

        for benchmark in tqdm(data):

            update_max_qubit_table(benchmark, circuits, simulators, max_qubit_df)

            if all('exception' in result for result in benchmark['results']):
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
        avg_clif_percentage = [round(c[0] * 100 / c[1], 1) for c in cum_clif_percentage]
        avg_rz_entropy = [round(c[0] / c[1], 2) for c in cum_rz_entropy]
        avg_gates_per_qubit = [round(c[0] / c[1], 1) for c in cum_gates_per_qubit] 
        print(len(cum_gates_per_qubit))
        print(len(circuits_full))

        df = pd.DataFrame(columns=['clif_percentage', 'rz_entropy', 'gates_per_qubit']+simulators_full)
        for i, circuit in enumerate(circuits_full):
            df.loc[circuit] = [avg_clif_percentage[i], avg_rz_entropy[i], avg_gates_per_qubit[i]] + [time_heatmap_data[i][j] + 1 for j in range(len(simulators_full))]

        clif_percentage_plot(df, os.path.basename(file).split('.')[0], out_dir = os.path.dirname(file))
        max_qubit_plot(max_qubit_df, os.path.basename(file).split('.')[0], out_dir = os.path.dirname(file))

        df = df.sort_values(by='gates_per_qubit')
        print(df)

        circuit_properties_df = df.drop(columns=['Map', 'Qiskit', 'QCEC', 'QuokkaSharp'], axis=1)     
        print_tex_table_body(circuit_properties_df)
        print_tex_table_body(max_qubit_df)


if __name__ == "__main__":
    main()