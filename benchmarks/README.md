# Benchmarks

The results of the benchmarks which are represented in the thesis can be found in the `results` directory. They can be easily reproduce by running the script `reproduce.sh`, after which the reproduced results will be stored in the directory `reproduced_results`. The only prerequisite is that [GPMC](https://git.trs.css.i.nagoya-u.ac.jp/k-hasimt/GPMC) should be installed, which is a dependency of [Quokka-Sharp](https://github.com/System-Verification-Lab/Quokka-Sharp)

The following sections will outline the structure of the code that is used to run the benchmarks and transpile the circuits.


## benchmark.py and config.py

The `benchmark.py` script is designed to execute any simulation or equivalence verification benchmark defined in the `config.py` file. The configuration file requires the following four fields to be set:

1. ```TIMEOUT```: An integer that specifies the timeout duration (in seconds) for a circuit simulation or equivalence verification.
2. ```RESULTS_DIR```: The directory path where benchmark results will be stored.
3. ```SIM_BENCHMARKS```:  A list of dictionaries, each representing a single simulation benchmark. The expected format of each dictionary entry is as follows:

```Python
{
    'dir': 'circuits/',         # Directory containing the benchmark circuits
    'benchmark_name': 'name',   # Name of the benchmark
    'results_subdir': 'path',   # Subdirectory path in the results folder
    'simulators': [Qiskit()],   # List of simulators to be used
}

```

For the benchmark script to utilize a simulator, each simulator must be wrapped in a class that implements the abstract base class defined in `simulators/interface.py`. Specifically, for simulations, the class should implement the simulate function, which accepts a path to a circuit and returns a dictionary.

When the benchmark is executed, for each circuit in the benchmark, the output dictionary provided by the simulator is stored in a JSON file located at:
`RESULTS_DIR/results_subdir/benchmark_name.json`.

4. ```EQUIV_BENCHMARKS```: Similar to `SIM_BENCHMARKS`, this field contains a list of dictionaries, each specifying a single equivalence verification benchmark. However, the format differs slightly:

```Python
{
    'dirs': ('circuits/', 'equiv_circuits/'),  # Directories containing the benchmark circuits
    'benchmark_name': 'name',                  # Name of the benchmark
    'results_subdir': 'path',                  # Subdirectory path in the results folder
    'equiv_checkers': [Qiskit()],              # List of equivalence checkers
}

```

For each circuit in the first directory specified in the `dirs` field, the benchmark code searches for a corresponding circuit (with the same subdirectory path and name) in the second directory. It then invokes the `equivalence_check` function, which must be implemented by the provided equivalence checkers.

The output dictionary for each pair of circuits is stored in a JSON file at:
`RESULTS_DIR/results_subdir/benchmark_name.json`.

## transpiler.py

Contains a class that can be used to transpile and optimize qasm circuits. The script can be run directly as follows:

```
python transpiler.py --qasm-dir circuits \
                     --output-dir out_circuits \
                     --basis-gates h s cx rz \
                     --optimization-level 2 \
                     --ignore-list qaoa \
                     --timeout 300 \
                     --seed 1 \
                     --qasm2 
```

Here `qasm-dir` is a directory containing qasm circuits that you want to transpile/optimize. The resulting circuits will be stored in the `output-dir`. The circuits are transpiled to circuits containing only the provided `basis-gates`. Any files or directories in the `ignore-list` are not transpiled or optimized. If a circuit cannot be transpiled/optimized within `timeout` seconds, it is ignored. The `seed` is passed to the Qiskit transpiler and can be set for consistent results. By default the qasm circuits in the output directory are stored in the qasm 3 format, but by setting the boolean flag `qasm2` they will be stored in the qasm2 format. Consider the directory structure below:

```
circuits
├── circ_type_1
│   └── foo.qasm
├── circ_type_2
|   └── bar.qasm
└── qaoa
    └── baz.qasm
```

This will result into the following new directory:

```
out_circuits
├── opt
│   ├── circ_type_1
│   │   └── foo.qasm
│   └── circ_type_2
│       └── bar.qasm
├── origin
│   ├── circ_type_1
│   │   └── foo.qasm
│   └── circ_type_2
│       └── bar.qasm
├── transp
│   ├── circ_type_1
│   │   └── foo.qasm
│   └── circ_type_2
│       └── bar.qasm
└── transpiler.log
```

If no basis gates are provided the transpilation step is skipped and the 'transp' field is not present in the result. If the optimization level is 0 the optimization step is skipped and the 'opt' field is not present in the result. If both basis gates and optimization level then the 'opt' field will contain a circuit that first transpiled and then optimized.

