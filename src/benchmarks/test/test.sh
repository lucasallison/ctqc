rm circ/c.qasm
python ./random_qasm.py
rm -r o_circ/
python ../scripts/optimize_qasm.py -q circ -o o_circ -opt 2
rm -r z_circ/
python ../scripts/qasm_to_ctqc.py -q o_circ -o z_circ
# RUST_LOG=ctqc=debug cargo run -- -f z_circ/ctqc/origin/c.ctqc -e z_circ/ctqc/opt/c.ctqc -c 1
cargo run -- -f z_circ/ctqc/origin/c.ctqc -e z_circ/ctqc/opt/c.ctqc -p -c 1