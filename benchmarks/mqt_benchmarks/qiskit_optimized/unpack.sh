#!/bin/bash

algorithms=("ae" "dj" "ghz" "graphstate" "grover" "portfolio" "qaoa" "qft" "qftentangled" "qnn" "qpeexact" "qpeinexact" "qwalk" "realamp" "su" "twolocal" "vqe" "wstate")

for alg in "${algorithms[@]}"; do
    tar -xzvf $alg.tar.gz
done

cp -r dj full
for alg in "${algorithms[@]}"; do
    fd "$alg" $alg -e qasm -e ctqc -I | while read file; do cp $file $(echo $file | sed s"/$alg/full/"); done
done

