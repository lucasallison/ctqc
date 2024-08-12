import json, re, os

# A quick and dirty script to generate a latex table from the benchmark results

files = [f for f in os.listdir('.') if os.path.isfile(f) and re.match("qsharp.*", str(f))]

for file in files:

    try: 
        with open(file) as f:
            data = json.load(f)
    except:
        continue

    simulators = [res['simulator'].replace("_", "\_") for res in data[0]['results']]
    circ_type = data[0]['circuit']['file'].split('/')[-2]
    equiv_circ_type = data[0]['equiv_circuit']['file'].split('/')[-2]

    table = "\\begin{table}[htb] \n\n"
    table += "\\centering \n"
    table += f"\\caption{{Collection:  QuokkaSharp Algorithm. Circuit types: {circ_type} and {equiv_circ_type} }}"
    table += "\\vspace{2mm} \n\n"
    table += "\\resizebox{\\textwidth}{!}{ \n"
    # 1 col for circuit name
    # 1 col for number of qubits
    # 4 col for characteristics; clifford gates, rz gates for both circuits
    # For echt simulator 2 rows: time and memory
    n_cols = 6 + 2*len(simulators)
    table += f"\\begin{{tabular}}{{{'|'+ n_cols * 'c|'}}} \n"
    table += "\\hline \n"
    table += "\\multirow{2}{*}{\\bfseries Circuit Name} & \n"
    table += "\\multirow{2}{*}{\\bfseries \#Qubits} & \n"
    table += "\\multicolumn{2}{|c|}{\\bfseries " + f"{circ_type}" + "} & \n"
    table += "\\multicolumn{2}{|c|}{\\bfseries " + f"{equiv_circ_type}" + "} & \n"
    for simulator in simulators[:-1]:
        table += "\\multicolumn{2}{|c|}{\\bfseries " + \
            f"{simulator}" + "} & \n"
    table += "\\multicolumn{2}{|c|}{\\bfseries " + \
        f"{simulators[-1]}" + "} \\\\ \n"
    table += "\\cline{3-" + str(n_cols) + "} \n"
    table += "& & \#$C$ & \#$Rz$ & \#$C$ & \#$Rz$"
    for simulator in simulators:
        table += "& t(sec)&mem(mbs) "
    table += " \\\\ \n"
    table += "\\hline \n"

    for benchmark in data:
        # Circuit name
        table += benchmark['circuit']['file'].split('/')[-1].split('.')[0].replace('_', '\_') + " & "


        table += " & ".join(str(s) for s in [benchmark['circuit']['stats']['n_qubits'], benchmark['circuit']['stats']['clif_gates'], benchmark['circuit']['stats']['rz_gates']])
        table += " & "
        table += " & ".join(str(s) for s in [benchmark['equiv_circuit']['stats']['clif_gates'], benchmark['equiv_circuit']['stats']['rz_gates']])

        for result in benchmark['results']:
            table += " & "

            if 'exception' in result and result['exception'] == 'Timeout':
                table += "- & -"
                continue
                
            if 'exception' in result:
                table += "E & E"
                continue

            time = round(result['stats']['runtime'], 4)
            mem = round(result['stats']['max_rss_bytes'] / (1024 * 1024), 1)
            table += f"{time} & {mem}"

        table += " \\\\ \n"

    table += "\\hline \n"
    table += "\\end{tabular}} \n"
    table += "\\end{table} \n"

    with open(file.split('.')[0] + ".tex", 'w') as f:
        f.write(table)