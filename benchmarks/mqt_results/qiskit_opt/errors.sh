#!/bin/sh

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <argument>"
    exit 1
fi

dir=$1


echo "Checkig errors for $dir"
echo "--------------------------------"
echo "* CTQC: true negatives: " $(cat $dir/CTQC_results.json | grep equivalent | grep false | wc -l)
echo "* CTQC: false positives: " $(cat $dir/CTQC_results.json | grep equivalent | grep true | wc -l)
echo "--------------------------------"
echo "* QCEC: true negatives: " $(cat $dir/QCEC_results.json | grep equivalence | grep "not_equivalent" | wc -l)
echo "* QCEC: false positives: " $(cat $dir/QCEC_results.json | grep equivalence | grep \"equivalent\" | wc -l)
echo "* QCEC: false positives: " $(cat $dir/QCEC_results.json | grep equivalence | grep global | wc -l)
echo "* QCEC: no information: " $(cat $dir/QCEC_results.json | grep conclusion | wc -l)
echo "--------------------------------"
echo "* Quokka: true negatives: " $(cat $dir/QuokkaSharp_results.json | grep equivalence | grep false | wc -l)
echo "* Quokka: false positives: " $(cat $dir/QuokkaSharp_results.json | grep equivalence | grep true | wc -l)
echo "--------------------------------"