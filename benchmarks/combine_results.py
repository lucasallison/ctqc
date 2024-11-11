import os, json, copy
from tools.utils import natural_keys


def find_benchmark(circuit_name, results):
    for benchmark in results:
        if benchmark['circuit']['file'].split('/')[-1] == circuit_name:
            return benchmark
    return None


def get_simulators(results):
    simulators = set()
    for result in results:
        for circuit_results in result[0]['results']:
            simulators.add(circuit_results['simulator'])
    return simulators


def combine_results(benchmark_dir, results_files, output_dir):

    circuit_names = [f for f in os.listdir(benchmark_dir) if os.path.isfile(os.path.join(benchmark_dir, f)) and 'ctqc' not in f]
    circuit_names.sort(key=natural_keys)

    results = list()
    for file in results_files:
        with open(file, 'r') as f:
            js = json.load(f)
            results.append(js)
    
    simulators = list(get_simulators(results))
    simulators.sort()

    combined_results = list()
    for circuit in circuit_names:

        combined_circuit_results = None
        for result in results:
            circuit_results = find_benchmark(circuit, result)
            if circuit_results is not None:
                if combined_circuit_results is None:
                    combined_circuit_results = copy.deepcopy(circuit_results)
                else:
                    for simulator_results in circuit_results['results']:
                        if simulator_results['simulator'] in [res['simulator'] for res in combined_circuit_results['results']]:
                            print(f"Duplicate results found for simulator '{simulator_results['simulator']}' for circuit {circuit}, stopping")
                            exit(1)

                        combined_circuit_results['results'].append(simulator_results)
        
        if combined_circuit_results is None:
            print(f"Could not find results for {circuit}")
            continue
            
        for simulator in simulators:
            if simulator not in [res['simulator'] for res in combined_circuit_results['results']]:
                combined_circuit_results['results'].append({
                    'simulator': simulator,
                    'exception': 'Timeout',
                })
        
        combined_circuit_results['results'].sort(key=lambda x: x['simulator'])
        combined_results.append(combined_circuit_results)

    combined_results_json = json.dumps(combined_results, indent=2)
    with open(os.path.join(output_dir, 'combined_results.json'), 'w') as f:
        f.write(combined_results_json)


if __name__=="__main__":
    import argparse
    
    parser = argparse.ArgumentParser(
        description='Combine JSON results files from a benchmark directory.')
    parser.add_argument('-b', type=str, required=True,
                        help='Directory containing the benchmark circuits.')
    parser.add_argument(
        '-r',
        nargs='+',
        type=str,
        required=True,
        help='List of results files to combine.')
    parser.add_argument(
        '-o',
        type=str,
        required=True,
        help='Directory to write the combined results to.')

    args = parser.parse_args()
    combine_results(args.b, args.r, args.o)