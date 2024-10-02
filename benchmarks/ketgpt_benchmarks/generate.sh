rm -r transp_circuits
python ../transpiler.py -q origin_circuits -o transp_circuits -b h s cx rz -opt 2 -ig "ae_indep_qiskit_.*.qasm" -t 30 --qasm2
fd . tranp_circuits -e qasm | xargs sed -i '' -E '/(measure|barrier)/d'
