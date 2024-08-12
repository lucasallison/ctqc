import os, re, json
import numpy as np
import seaborn as sns
import matplotlib.pylab as plt
import pandas as pd

# uniform_data = np.random.rand(10, 12)
# test = [[0,1,2], [0,1,2], [0,1,2]]
# ax = sns.heatmap(test, linewidth=0.5)
# plt.show()

files = [f for f in os.listdir('.') if os.path.isfile(f) and re.match("qsharp.*", str(f))]

for file in files:
    with open(file) as f:
        data = json.load(f)
    
    simulators = [res['simulator'] for res in data[0]['results']]

    time_aggregates = dict()
    memory_aggregates = dict()
    circuits = list()

    for simulator in simulators:
        time_aggregates[simulator] = list()
        memory_aggregates[simulator] = list()

    prev_benchmark = None
    for benchmark in data:

        only_timeouts = True
        for result in benchmark['results']:
            if 'stats' in result:
                only_timeouts = False
                break

        if only_timeouts:
            continue

        curr_benchmark = benchmark['circuit']['file'].split('/')[-1].split('.')[0].split('_')[0]
        if prev_benchmark is None or curr_benchmark != prev_benchmark:
            print('Adding', curr_benchmark)
            for simulator in simulators:
                time_aggregates[simulator].append(0)
                memory_aggregates[simulator].append(0)
                circuits.append(curr_benchmark)
        prev_benchmark = curr_benchmark


        benchmark_times = list()
        benchmark_mem = list()
        for result in benchmark['results']:

            if 'exception' in result:
                benchmark_times.append((result['simulator'], float('inf')))
                benchmark_mem.append((result['simulator'], float('inf')))
        
            else:
                benchmark_times.append((result['simulator'], result['stats']['runtime']))
                benchmark_mem.append((result['simulator'], result['stats']['max_rss_bytes']))
            
        benchmark_times.sort(key=lambda x: x[1])
        benchmark_mem.sort(key=lambda x: x[1])

        for i in range(len(benchmark_times)):
            time_aggregates[benchmark_times[i][0]][-1] += i
            memory_aggregates[benchmark_mem[i][0]][-1] += i
        
        

    print(time_aggregates)

    #print([t for t in time_aggregates.values()])

    time_heatmap_data = np.matrix([t for t in time_aggregates.items()])
    mem_heatmap_data = np.matrix([m for m in memory_aggregates.items()])

    print(time_heatmap_data)
    exit(0)

