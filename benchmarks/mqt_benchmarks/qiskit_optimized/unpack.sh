#!/bin/bash

algorithms=("ae" "dj" "ghz" "graphstate" "grover" "portfolio" "qaoa" "qft" "qftentangled" "qnn" "qpeexact" "qpeinexact" "qwalk" "realamp" "su" "twolocal" "vqe" "wstate")

for alg in "${algorithms[@]}"; do
    tar -xzvf $alg.tar.gz
done

cp -r dj full
for alg in "${algorithms[@]}"; do
    find "$alg" -type f \( -name "*.qasm" -o -name "*.ctqc" \) | while read file; do cp "$file" $(echo "$file" | sed "s/$alg/full/"); done
done

