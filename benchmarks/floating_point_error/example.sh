#!/bin/bash

source ../.bench/bin/activate

for num_t_gates in 1 $((8*100+1)); do
# for num_t_gates in 1; do

    # angle=0.0001 -> all correct
    # angle=0.00001 -> quokka incorrect 10^-4
    # angle=0.00000001 -> qcec incorrect 10^-5
    # angle=0.000000000000001 -> ctqc incorrect 10^-15
    angle=0.00000000000001

    python generate_qasm.py "$num_t_gates" "$angle"
    python ../mqt_benchmarks/generate_ctqc_file.py -f fp_error.qasm > /dev/null 2>&1
    python ../mqt_benchmarks/generate_ctqc_file.py -f fp_error_equiv.qasm > /dev/null 2>&1

    echo ""
    echo "#T:", $num_t_gates, $angle
    
    # Run verification tools
    echo "* CTQC:"
    cargo run --release -- -f fp_error.ctqc -e fp_error_equiv.ctqc 2>/dev/null 

    #echo "* QCEC:"
    #python ../simulators/scripts/qcec_verify.py fp_error.qasm fp_error_equiv.qasm 

    # echo "* Quokka:"
    # python ../simulators/scripts/quokka_verify.py fp_error.qasm fp_error_equiv.qasm

    # echo "* Qiskit:"
    # python ../simulators/scripts/qiskit_verify.py fp_error.qasm fp_error_equiv.qasm

done

rm  fp_error*.qasm
rm  fp_error*.ctqc
