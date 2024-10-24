#!/bin/bash

benchmarks=("dj" "ghz" "gs" "qft" "qnn" "qpe" "realamp" "su" "twolocal" "wstate")

for benchmark in "${benchmarks[@]}"; do
    python ../transpiler.py -q "$benchmark" -o "${benchmark}_transp" -b h s cx rz -opt 2 -t 1200 --qasm2
done

fd . transp_circuits -e qasm -I | xargs sed -i -E '/(measure|barrier)/d'

for benchmark in "${benchmarks[@]}"; do
    tar -czvf "${benchmark}_transp.tar.gz" "${benchmark}_transp"
done
