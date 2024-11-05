#!/bin/bash

source ../.bench/bin/activate

for num_t_gates in 1 10001; do
    angle=0.00000000001

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
