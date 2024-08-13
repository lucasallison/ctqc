import os
from utils import CIRCUIT_NAMES_FULL, SIMULATOR_NAMES, get_json_files, load_json_data

def get_circuit_type(data, key):
    return data[0][key]['file'].split('/')[-2]

def create_table_header(data, simulators):
    circ_type = get_circuit_type(data, 'circuit')
    equiv_circ_type = get_circuit_type(data, 'equiv_circuit')
    n_cols = 6 + 2 * len(simulators)

    header = [
        "\\begin{table}[htb]",
        "\\centering",
        f"\\caption{{Collection: QuokkaSharp Algorithm. Circuit types: {circ_type} and {equiv_circ_type}}}",
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

def format_result(result):
    if 'exception' in result:
        return "- & -" if result['exception'] == 'Timeout' else "E & E"
    time = round(result['stats']['runtime'], 4)
    mem = round(result['stats']['max_rss_bytes'] / (1024 * 1024), 1)
    return f"{time} & {mem}"

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
        
        for result in benchmark['results']:
            body.append(" & " + format_result(result))
        
        body.append(" \\\\")

    return '\n'.join(body)

def create_table_footer():
    return "\\hline\n\\end{tabular}}\n\\end{table}"

def process_file(file_path):
    data = load_json_data(file_path)
    simulators = [SIMULATOR_NAMES[res['simulator']] if res['simulator'] in SIMULATOR_NAMES else res['simulator'] for res in data[0]['results']]
    
    table = [
        create_table_header(data, simulators),
        create_table_body(data),
        create_table_footer()
    ]
    
    output_file = os.path.join(os.path.dirname(file_path), os.path.basename(file_path).split('.')[0] + ".tex")
    with open(output_file, 'w') as f:
        f.write('\n'.join(table))

def main():
    for file in get_json_files():
        process_file(file)

if __name__ == "__main__":
    main()