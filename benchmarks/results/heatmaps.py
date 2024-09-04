import os
import re 
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
from utils import BASE_DIR, CIRCUIT_NAMES_FULL, SIMULATOR_NAMES, rankmin, get_json_files, load_json_data

def initialize_aggregates(simulators):
    return {simulator: [] for simulator in simulators}, {simulator: [] for simulator in simulators}

def process_benchmark(benchmark, simulators, time_aggregates, memory_aggregates, circuits):
    if all('exception' in result for result in benchmark['results']):
        return
    
    if int(benchmark['circuit']['stats']['n_qubits']) <= 5:
        return
    
    curr_benchmark = benchmark['circuit']['file'].split('/')[-1].split('.')[0].split('_')[0]
    if not circuits or curr_benchmark != circuits[-1]:
        for simulator in simulators:
            time_aggregates[simulator].append(0)
            memory_aggregates[simulator].append(0)
        circuits.append(curr_benchmark)

    for result in benchmark['results']:
        if result.get('stats', {}).get('equivalence', '') == 'no_information':
            del result['stats']

    benchmark_times = [(result['simulator'], result.get('stats', {}).get('runtime', float('inf'))) for result in benchmark['results']]
    benchmark_mem = [(result['simulator'], result.get('stats', {}).get('max_rss_bytes', float('inf'))) for result in benchmark['results']]

    update_aggregates(benchmark_times, time_aggregates)
    update_aggregates(benchmark_mem, memory_aggregates)

def update_aggregates(benchmark_data, aggregates):
    benchmark_data.sort(key=lambda x: x[1])
    for pos, (simulator, value) in enumerate(benchmark_data):
        if pos > 0 and value != benchmark_data[pos-1][1]:
            pos += 1
        aggregates[simulator][-1] += pos

def prepare_heatmap_data(aggregates, circuits, simulators):
    heatmap_data = np.array([t for t in aggregates.values()]).T
    for i in range(len(heatmap_data)):
        heatmap_data[i] = rankmin(heatmap_data[i])
    return heatmap_data, [CIRCUIT_NAMES_FULL[c] if c in CIRCUIT_NAMES_FULL else c for c in circuits], [SIMULATOR_NAMES[s] if s in SIMULATOR_NAMES else s for s in simulators]

def create_heatmap(data, xticklabels, yticklabels, title, xlabel, ylabel):
    ax = sns.heatmap(data, linewidth=0.5, cbar=False, cmap="RdYlGn_r", xticklabels=xticklabels, yticklabels=yticklabels)
    if title is not None:
        ax.set_title(title)
    ax.set_xlabel(xlabel)
    ax.set_ylabel(ylabel)
    return ax

def save_heatmap(filename):
    plt.savefig(filename, bbox_inches="tight")
    plt.close()

def generate_latex_figure(simulator_set, file_name, time_heatmap_file, mem_heatmap_file):
    return f"""
    \\begin{{figure}}
    \\centering
    \\begin{{subfigure}}{{.5\\textwidth}}
      \\centering
      \\includegraphics[width=1\\linewidth]{{{os.path.join(BASE_DIR, time_heatmap_file)}}}
      \\caption{{{file_name.replace('_', ' ')} time heatmap}}
      \\label{{fig:gensets_{file_name}_time_heatmap}}
    \\end{{subfigure}}
    \\begin{{subfigure}}{{.5\\textwidth}}
      \\centering
      \\includegraphics[width=1\linewidth]{{{os.path.join(BASE_DIR, mem_heatmap_file)}}}
      \\caption{{{file_name.replace('_', ' ')} mem heatmap}}
      \\label{{fig:gensets_{file_name}_mem_heatmap}}
    \\end{{subfigure}}
    \\caption{{{simulator_set} heatmaps}}
    \\label{{fig:gensets_{file_name}_heatmaps}}
    \\end{{figure}}
    """

def save_latex_figure(tex_figure, filename):
    with open(filename, 'w') as f:
        f.write(tex_figure)

def main():
    files = get_json_files()
    for file in files:

        if not re.search('ketgpt', file) and not re.search('qsharp', file):
            continue

        simulators = [res['simulator'] for res in data[0]['results']]
        time_aggregates, memory_aggregates = initialize_aggregates(simulators)
        circuits = []

        for benchmark in data:
            process_benchmark(benchmark, simulators, time_aggregates, memory_aggregates, circuits)
        
        time_heatmap_data, circuits_full, simulators_full = prepare_heatmap_data(time_aggregates, circuits, simulators)
        mem_heatmap_data, _, _ = prepare_heatmap_data(memory_aggregates, circuits, simulators)

        dirname = os.path.dirname(file)
        file_name = os.path.basename(file).split('.')[0]

        # Time heatmap
        ax = create_heatmap(time_heatmap_data, simulators_full, circuits_full, 'Time', 'Implementations', 'Circuits')
        time_heatmap_file = os.path.join(dirname, f"{file_name}_time_heatmap.png")
        save_heatmap(time_heatmap_file)

        # Memory heatmap
        ax = create_heatmap(mem_heatmap_data, simulators_full, circuits_full, 'Memory', 'Implementations', 'Circuits')
        mem_heatmap_file = os.path.join(dirname, f"{file_name}_mem_heatmap.png")
        save_heatmap(mem_heatmap_file)

        # Generate and save Latex figure
        simulator_set = dirname.split('/')[2]
        tex_figure = generate_latex_figure(simulator_set, file_name, time_heatmap_file, mem_heatmap_file)
        tex_file = os.path.join(dirname, f"{file_name}_heatmaps.tex")
        save_latex_figure(tex_figure, tex_file)

if __name__ == "__main__":
    main()