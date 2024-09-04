import os, re 
from typing import Tuple
from utils import CIRCUIT_NAMES_FULL, SIMULATOR_NAMES, get_json_files, load_json_data

def get_circuit_type(data, key):
    return data[0][key]['file'].split('/')[-2]

def create_table_header(data, simulators, benchmark_name):
    circ_type = get_circuit_type(data, 'circuit')
    equiv_circ_type = get_circuit_type(data, 'equiv_circuit')
    n_cols = 6 + 2 * len(simulators)

    header = [
        "\\begin{table}[htb]",
        "\\centering",
        f"\\caption{{Collection: {benchmark_name}. Circuit types: {circ_type} and {equiv_circ_type}}}",
        "\\vspace{2mm}",
        "\\resizebox{\\textwidth}{!}{",
        f"\\begin{{tabular}}{{{'|'+ n_cols * 'c|'}}}",
        "\\hline",
        "\\multirow{2}{*}{\\bfseries Circuit Name} &",
        "\\multirow{2}{*}{\\bfseries \#Qubits} &",
        f"\\multicolumn{{2}}{{|c|}}{{\\bfseries {circ_type}}} &",
        f"\\multicolumn{{2}}{{|c|}}{{\\bfseries {equiv_circ_type}}} &"
    ]

    for simulator in simulators[:-1]:
        header.append(f"\\multicolumn{{2}}{{|c|}}{{\\bfseries {simulator}}} &")
    header.append(f"\\multicolumn{{2}}{{|c|}}{{\\bfseries {simulators[-1]}}} \\\\")
    header.append(f"\\cline{{3-{n_cols}}}")
    header.append("& & \#$C$ & \#$Rz$ & \#$C$ & \#$Rz$" + "& t(sec)&mem(mbs) " * len(simulators) + "\\\\")
    header.append("\\hline")

    return '\n'.join(header)

def format_result(result, sim_best_time_name, sim_best_mem_name):
    if 'exception' in result:
        return "- & -" if result['exception'] == 'Timeout' else "E & E"

    if result.get('stats', {}).get('equivalence', '') == 'no_information':
        return "N & N "
    
    time = round(result['stats']['runtime'], 4)
    mem = round(result['stats']['max_rss_bytes'] / (1024 * 1024), 1)
    time_table_entry =  f"\\textcolor{{green}}{{{time}}}" if result['simulator'] == sim_best_time_name else time 
    mem_table_entry =  f"\\textcolor{{green}}{{{mem}}}" if result['simulator'] == sim_best_mem_name else mem
    return f"{time_table_entry} & {mem_table_entry}"

def best_simulators(results) -> Tuple[str, str]:
    """
    Return the names of the simulators with tht best time and memory usage, respectively, 
    or None if they all timed-out
    """
    best_time = None
    sim_best_time_name = None
    best_mem = None
    sim_best_mem_name = None
    for result in results:
        if 'exception' in result or result.get('stats', {}).get('equivalence', '') == 'no_information':
            continue

        if best_time is None or result['stats']['runtime'] < best_time:
            best_time = result['stats']['runtime']
            sim_best_time_name = result['simulator']

        if best_mem is None or result['stats']['max_rss_bytes'] < best_mem:
            best_mem = result['stats']['max_rss_bytes'] 
            sim_best_mem_name = result['simulator']
    
    return sim_best_time_name, sim_best_mem_name


def create_table_body(data):
    body = []
    prev_benchmark = None
    add_circ_name = False

    for benchmark in data:

        curr_benchmark = benchmark['circuit']['file'].split('/')[-1].split('.')[0].split('_')[0]
        
        if prev_benchmark is None or curr_benchmark != prev_benchmark:
            if prev_benchmark is not None:
                body.append("\\hline")
            body.append(" & ")
            add_circ_name = True
        elif add_circ_name:
            body.append(f"{CIRCUIT_NAMES_FULL[curr_benchmark] if curr_benchmark in CIRCUIT_NAMES_FULL else curr_benchmark} & ")
            add_circ_name = False
        else:
            body.append(" & ")
        
        prev_benchmark = curr_benchmark
        
        circuit_stats = [benchmark['circuit']['stats']['n_qubits'], 
                         benchmark['circuit']['stats']['clif_gates'], 
                         benchmark['circuit']['stats']['rz_gates']]
        equiv_circuit_stats = [benchmark['equiv_circuit']['stats']['clif_gates'], 
                               benchmark['equiv_circuit']['stats']['rz_gates']]
        
        body.append(" & ".join(map(str, circuit_stats + equiv_circuit_stats)))

        sim_best_time_name, sim_best_mem_name = best_simulators(benchmark['results']) 
        
        for result in benchmark['results']:
            body.append(" & " + format_result(result, sim_best_time_name, sim_best_mem_name))
        
        body.append(" \\\\")

    return '\n'.join(body)

def create_table_footer():
    return "\\hline\n\\end{tabular}}\n\\end{table}"

def process_file(file_path, benchmark_name):
    data = load_json_data(file_path)
    simulators = [SIMULATOR_NAMES[res['simulator']] if res['simulator'] in SIMULATOR_NAMES else res['simulator'] for res in data[0]['results']]
    
    table = [
        create_table_header(data, simulators, benchmark_name),
        create_table_body(data),
        create_table_footer()
    ]
    
    output_file = os.path.join(os.path.dirname(file_path), os.path.basename(file_path).split('.')[0] + ".tex")
    with open(output_file, 'w') as f:
        f.write('\n'.join(table))

def all_timedout(benchmark):
    for result in benchmark['results']:
        if 'exception' not in result:
            return False
    return True

def split_results_table(file_path, benchmark_name):
    data = load_json_data(file_path)
    simulators = [SIMULATOR_NAMES[res['simulator']] if res['simulator'] in SIMULATOR_NAMES else res['simulator'] for res in data[0]['results']]

    MAX_TABLE_SIZE = 60
    split = 0

    circuit_data = list()
    for benchmark in data + [None]:

        if len(circuit_data) < MAX_TABLE_SIZE and benchmark is not None:
            
            # Only store benchmarks that did not time-out
            if not all_timedout(benchmark):
                circuit_data.append(benchmark)

            continue
    
        if len(circuit_data) == MAX_TABLE_SIZE or benchmark is None:
            split += 1

        table = [
            create_table_header(circuit_data, simulators, benchmark_name),
            create_table_body(circuit_data),
            create_table_footer()
        ]

        output_file = os.path.join(os.path.dirname(file_path), f"{os.path.basename(file_path).split('.')[0]}_{split}.tex")
        with open(output_file, 'w') as f:
            f.write('\n'.join(table))

        circuit_data = [benchmark]

def main():
    for file in get_json_files():
        if re.search('ketgpt', file):
            split_results_table(file, 'KetGPT')

        if re.search('qsharp', file):
            process_file(file, 'QuaokkaSharp')

if __name__ == "__main__":
    main()