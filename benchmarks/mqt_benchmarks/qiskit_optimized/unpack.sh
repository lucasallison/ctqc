#!/bin/bash

algorithms=("dj" "ghz" "graphstate" "qft" "qftentangled" "qnn" "qpeexact" "qpeinexact" "realamp" "su" "twolocal" "wstate")

for alg in "${algorithms[@]}"; do
    tar -xzvf $alg.tar.gz
done

cp -r dj full
for alg in "${algorithms[@]}"; do
    fd "$alg" $algo -e qasm -e ctqc -I  | while read file; do cp $file $(echo $file | sed s"/$alg/full/"); done
done

