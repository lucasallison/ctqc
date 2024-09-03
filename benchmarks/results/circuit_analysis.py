import os
import re
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
import pandas as pd
from utils import BASE_DIR, CIRCUIT_NAMES_FULL, SIMULATOR_NAMES, rankmin, get_json_files, load_json_data
from heatmaps import initialize_aggregates, process_benchmark, prepare_heatmap_data


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
        
        data = load_json_data(file)
        simulators = [res['simulator'] for res in data[0]['results']]
        time_aggregates, memory_aggregates = initialize_aggregates(simulators)
        circuits = []
        circuits_avg_clif_percentage = []

        for benchmark in data:
            if all('exception' in result for result in benchmark['results']):
                continue

            curr_benchmark = benchmark['circuit']['file'].split('/')[-1].split('.')[0].split('_')[0]
            if not circuits or curr_benchmark != circuits[-1]:
                circuits_avg_clif_percentage.append((calc_clif_percentage(benchmark), 1))
            else:
                circuits_avg_clif_percentage[-1] = (circuits_avg_clif_percentage[-1][0] + calc_clif_percentage(benchmark), circuits_avg_clif_percentage[-1][1] + 1)

            process_benchmark(benchmark, simulators, time_aggregates, memory_aggregates, circuits)
        
        time_heatmap_data, circuits_full, simulators_full = prepare_heatmap_data(time_aggregates, circuits, simulators)
        circuits_avg_clif_percentage = [int(c[0] * 100 // c[1]) for c in circuits_avg_clif_percentage]
        
        df = pd.DataFrame(columns=['clif_percentage']+simulators_full)
        for i, circuit in enumerate(circuits_full):
            df.loc[circuit + f" ({circuits_avg_clif_percentage[i]}%)"] = [circuits_avg_clif_percentage[i]] + [time_heatmap_data[i][j] + 1 for j in range(len(simulators_full))]

        df = df.sort_values(by='clif_percentage')
        df = df.drop(columns=['clif_percentage'], axis=1)
        plot_results(df, os.path.basename(file).split('.')[0], out_dir = os.path.dirname(file))


if __name__ == "__main__":
    main()