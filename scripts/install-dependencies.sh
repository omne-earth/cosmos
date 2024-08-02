#!/usr/bin/bash
set -ueox pipefail

sudo apt update -y
sudo apt upgrade -y

# build dependencies
sudo apt install -y autoconf make build-essential mingw-w64

# main dependencies
sudo apt install -y libhdf5-serial-dev
sudo apt install -y openmpi-bin libopenmpi-dev
sudo apt install -y libtool libtool-bin 
sudo apt install -y libfftw3-dev libfftw3-doc
sudo apt install -y libparmetis-dev
sudo apt install -y libgsl-dev

# optional dependencies
sudo apt install -y libnuma-dev
sudo apt install -y python3
sudo apt install -y google-perftools
sudo apt install -y libhealpix-dev
sudo apt install -y libcfitsio-dev

# post-run dependencies
sudo apt install -y python3 python3-venv

# publish dependencies
sudo apt install -y texlive-full

# animation dependencies
sudo apt install -y ffmpeg
