#!/bin/sh

echo "Decrompressing KetGPT benchmark circuits..."
if [ ! -d "ketgpt_benchmarks/transp_circuits" ]; then
    tar -xvzf ketgpt_benchmarks/transp_circuits.tar.gz -C ketgpt_benchmarks
fi

echo "Decrompressing QuokkaSharp benchmark circuits..."
if [ ! -d "quokka_sharp_benchmarks/algorithm" ]; then
    tar -xvzf quokka_sharp_benchmarks/algorithm.tar.gz -C quokka_sharp_benchmarks
fi

echo "Building CTQC..."
cargo build --release
cp ../target/release/ctqc simulators/ctqc_bin

echo "Creating virtual environment and installing dependencies..."
if [ ! -d ".venv" ]; then
    python3 -m venv .venv
fi
pip install -r requirements.txt
source .venv/bin/activate

echo "Running benchmarks..."
python benchmark.py
