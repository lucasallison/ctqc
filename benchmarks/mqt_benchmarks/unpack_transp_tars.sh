#!/bin/bash

circuits=(
    "circuits/dj_transp"
    "circuits/ghz_transp"
    "circuits/gs_transp"
    "circuits/qft_transp"
    "circuits/qnn_transp"
    "circuits/qpe_transp"
    "circuits/realamp_transp"
    "circuits/su_transp"
    "circuits/wstate_transp"
)

mkdir -p transp_circuits/transp
mkdir -p transp_circuits/opt

for circ in "${circuits[@]}"; do
  tar -xzvf $circ.tar.gz -C circuits
  cp $circ/transp/* transp_circuits/transp
  cp $circ/opt/* transp_circuits/opt
done

# fd . transp_circuits -e qasm -I | xargs sed -i -E '/(measure|barrier)/d'
