rm -r opt_circuits
python ../scripts/optimize_qasm.py -q origin_circuits -o opt_circuits -opt 2 -ig ae_indep_qiskit_.*.qasm --timeout 60
rm -r transp_circuits
python ../scripts/qasm_to_ctqc.py -q opt_circuits -o transp_circuits
