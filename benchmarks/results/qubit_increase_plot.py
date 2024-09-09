import re 
import os
import numpy as np
import pandas as pd
import seaborn as sns
from matplotlib import pyplot as plt
from typing import List
from matplotlib.ticker import MaxNLocator
from utils import get_json_files, load_json_data
from config import CIRCUIT_NAMES_COMPACT, SIMULATOR_NAMES

def plot_results(results_df, circuit_name, out_dir, time_plot):

    _, ax = plt.subplots(figsize=(5, 2))
    sns.lineplot(data=results_df, ax=ax)
    ax.set_title(f"{'Runtimes' if time_plot else 'Memory usage'} for the {CIRCUIT_NAMES_COMPACT.get(circuit_name, circuit_name)} circuits")
    ax.set_xlabel('#Qubits')
    ax.set_ylabel('Runtime (seconds)' if time_plot else 'Max. RSS (bytes)')
    ax.legend(bbox_to_anchor=(1.05, 1), loc='upper left', borderaxespad=0.)
    
    indices = list(results_df.index.values)
    if len(indices) > 20:
        xticks_positions = [0] + [i - int(indices[0]) for i in range(10, len(indices), 10)] + [len(indices) - 1]
        ax.set_xticks(xticks_positions)
        ax.set_xticklabels([indices[i] for i in xticks_positions])

    time_plot_str = "time" if time_plot else "memory"
    plt.savefig(os.path.join(out_dir, circuit_name+"_qubit_increase_"+time_plot_str+".png"), bbox_inches="tight")
    plt.close()


def process_benchmark(data, simulators: List, out_dir: str):

    time_results_df = None
    mem_results_df = None
    prev_circuit = None
    for benchmark in data:

        if all('exception' in result for result in benchmark['results']):
            continue

        circuit_file_name = benchmark['circuit']['file'].split('/')[-1]
        curr_circuit = circuit_file_name.split('.')[0].split('_')[0]
        qubits = circuit_file_name.split('.')[0].split('_')[-1]

        # Plot previous benchmark results
        if curr_circuit != prev_circuit:
            
            if time_results_df is not None:
                plot_results(time_results_df, prev_circuit, out_dir, True)
                plot_results(mem_results_df, prev_circuit, out_dir, False)

            time_results_df = pd.DataFrame(columns=simulators)
            mem_results_df = pd.DataFrame(columns=simulators)

        # Add results to dataframe
        time_row_data = list() 
        mem_row_data = list()
        for result in benchmark['results']:
            if 'exception' in result or result.get('stats', {}).get('equivalence', '') == 'no_information':
                time_row_data.append(None)
                mem_row_data.append(None)
            else:
                time_row_data.append(result['stats']['runtime'])
                mem_row_data.append(result['stats']['max_rss_bytes'])
        
        time_results_df.loc[qubits] = time_row_data
        mem_results_df.loc[qubits] = mem_row_data
        prev_circuit = curr_circuit

    # Plot last benchmark results
    plot_results(time_results_df, prev_circuit, out_dir, True)
    plot_results(mem_results_df, prev_circuit, out_dir, False)


def main():
    for file in get_json_files():
        if not re.search('ketgpt', file):
            continue
    
        data = load_json_data(file)
        simulators = [SIMULATOR_NAMES.get(res['simulator'], res['simulator']) for res in data[0]['results']]
        out_dir = os.path.dirname(file)
        process_benchmark(data, simulators, out_dir)


if __name__ == "__main__":
    main()