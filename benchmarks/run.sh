#!/bin/sh

cargo build --release
cp ../target/release/ctqc simulators/ctqc_bin
source .venv/bin/activate
python benchmark.py
