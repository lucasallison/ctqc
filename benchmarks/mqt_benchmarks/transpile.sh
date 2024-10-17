python ../transpiler.py -q dj -o dj_transp -b h s cx rz -opt 2 -t 1200 --qasm2
python ../transpiler.py -q ghz -o ghz_transp -b h s cx rz -opt 2 -t 1200 --qasm2
python ../transpiler.py -q gs -o gs_transp -b h s cx rz -opt 2 -t 1200 --qasm2
python ../transpiler.py -q qft -o qft_transp -b h s cx rz -opt 2 -t 1200 --qasm2
python ../transpiler.py -q qnn -o qnn_transp -b h s cx rz -opt 2 -t 1200 --qasm2
python ../transpiler.py -q qpe -o qpe_transp -b h s cx rz -opt 2 -t 1200 --qasm2
python ../transpiler.py -q realamp -o realamp_transp -b h s cx rz -opt 2 -t 1200 --qasm2
python ../transpiler.py -q su -o su_transp -b h s cx rz -opt 2 -t 1200 --qasm2
python ../transpiler.py -q twolocal -o twolocal_transp -b h s cx rz -opt 2 -t 1200 --qasm2
python ../transpiler.py -q wstate -o wstate -b h s cx rz -opt 2 -t 1200 --qasm2

fd . transp_circuits -e qasm -I | xargs sed -i -E '/(measure|barrier)/d'

tar -czvf dj_transp.tar.gz dj_transp
tar -czvf ghz_transp.tar.gz ghz_transp
tar -czvf gs_transp.tar.gz gs_transp
tar -czvf qft_transp.tar.gz qft_transp
tar -czvf qnn_transp.tar.gz qnn_transp
tar -czvf qpe_transp.tar.gz qpe_transp
tar -czvf realamp_transp.tar.gz realamp_transp
tar -czvf su_transp.tar.gz su_transp
tar -czvf twolocal_transp.tar.gz twolocal_transp
tar -czvf wstate_transp.tar.gz wstate_transp
