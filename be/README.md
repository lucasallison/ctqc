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

## Benchmark.py
