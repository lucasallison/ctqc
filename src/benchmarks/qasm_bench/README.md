# Running QASM Benchmakrs

Use the `qasm_util.py` to transpile qasm files or run them directly. Example of transpiling and simulating an entire directory respectively:


```
python qasm_util.py -d small -t 
```

```
python qasm_util.py -d small -c 10 --timeout 20 -v 
```

Or a single file:

```
python qasm_util.py -d small/adder_n4.qasm -t
```

```
python qasm_util.py -d small/adder_n4.qasm -c 10 --timeout 20 -v 
```

