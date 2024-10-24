#!/bin/bash

algorithms=("dj" "ghz" "graphstate" "qft" "qftentangled" "qnn" "qpeexact" "qpeinexact" "realamp" "su" "twolocal" "wstate")

for alg in "${algorithms[@]}"; do
    tar -xzvf $alg.tar.gz
done
