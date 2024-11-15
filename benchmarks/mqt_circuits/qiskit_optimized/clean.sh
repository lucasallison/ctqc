#!/bin/bash

algorithms=("ae" "dj" "ghz" "graphstate" "grover" "portfolio" "qaoa" "qft" "qftentangled" "qnn" "qpeexact" "qpeinexact" "qwalk" "realamp" "su" "twolocal" "vqe" "wstate")

for alg in "${algorithms[@]}"; do
    rm -rf $alg
done

rm -rf full
