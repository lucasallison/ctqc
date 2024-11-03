#!/bin/sh

if [ ! -d ".gpmc" ]; then
    mkdir .gpmc
    cd .gpmc
    git clone https://git.trs.css.i.nagoya-u.ac.jp/k-hasimt/GPMC.git
    cd GPMC  
    sed -i "1s/^/set(CMAKE_CXX_STANDARD 17)\n\n/" CMakeLists.txt
    sed -i -e "262,266d" core/Main.cc
    ./build.sh r
    cd ../..
    echo "GPMC_BINARY_PATH=\"$PWD/.gpmc/GPMC/bin/gpmc -mode=1\"" > simulators/scripts/.env
    echo "TIMEOUT=900" >> simulators/scripts/.env
fi

echo "Building CTQC..."
cargo build --release
cp ../target/release/ctqc simulators/ctqc_bin
echo "CTQC_BINARY_PATH=\"$PWD/simulators/ctqc_bin\"" > simulators/.env

echo "Creating virtual environment and installing dependencies..."
if [ ! -d ".venv" ]; then
    python3 -m venv .venv
    pip install -r requirements.txt
fi

. .venv/bin/activate
