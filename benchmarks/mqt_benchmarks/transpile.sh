rm -r transp_circuits
python ../transpiler.py -q circuits -o transp_circuits -b h s cx rz -opt 2 -t 300 --qasm2
fd . transp_circuits -e qasm -I | xargs sed -i '' -E '/(measure|barrier)/d'
