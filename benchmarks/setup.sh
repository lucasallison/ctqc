#!/bin/sh

if [ ! -d ".gpmc" ]; then
    mkdir .gpmc
    cd .gpmc
    git clone https://git.trs.css.i.nagoya-u.ac.jp/k-hasimt/GPMC.git
    cd GPMC  
    sed -i "1s/^/set(CMAKE_CXX_STANDARD 17)\n\n/" CMakeLists.txt
    ./build.sh r
    cd ../..
	echo "GPMC_BINARY_PATH=\"$PWD/.gpmc/GPMC/bin/gpmc -mode=1\"" > simulators/scripts/.env
fi

echo "Decrompressing MQT benchmark circuits..."
if [ ! -d "mqt_benchmarks/transp_circuits" ]; then
    tar -xvzf mqt_benchmarks/transp_circuits.tar.gz -C mqt_benchmarks
fi

echo "Decrompressing KetGPT benchmark circuits..."
if [ ! -d "ketgpt_benchmarks/transp_circuits" ]; then
    # tar -xvzf ketgpt_benchmarks/transp_circuits.tar.gz -C ketgpt_benchmarks
    echo "Ignoring unused benchmark"
fi

echo "Decrompressing QuokkaSharp benchmark circuits..."
if [ ! -d "quokka_sharp_benchmarks/algorithm" ]; then
    # tar -xvzf quokka_sharp_benchmarks/algorithm.tar.gz -C quokka_sharp_benchmarks
    echo "Ignoring unused benchmark"
fi

echo "Building CTQC..."
cargo build --release
cp ../target/release/ctqc simulators/ctqc_bin
echo "CTQC_BINARY_PATH=\"$PWD/simulators/ctqc_bin\"" > simulators/.env

echo "Creating virtual environment and installing dependencies..."
if [ ! -d ".venv" ]; then
    python3 -m venv .venv
fi
. .venv/bin/activate
pip install -r requirements.txt