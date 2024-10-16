#!/bin/bash

circuits=(
    "dj_transp"
    "ghz_transp"
    "gs_transp"
    "qft_transp"
    "qnn_transp"
    "qpe_transp"
    "realamp_transp"
    "su_transp"
    "wstate"
)

mkdir -p transp_circuits/transp
mkdir -p transp_circuits/opt

for circ in "${circuits[@]}"; do
  tar -xzvf $circ.tar.gz 
  cp $circ/transp/* transp_circuits/transp
  cp $circ/opt/* transp_circuits/opt
done

fd . transp_circuits -e qasm -I | xargs sed -i -E '/(measure|barrier)/d'
