#!/bin/bash
set -ueox pipefail

# build dependencies
sudo dnf install -y @development-tools

# main dependencies
sudo dnf install -y libtool
sudo dnf install -y hdf5 hdf5-devel
sudo dnf install -y openmpi openmpi-devel
sudo dnf install -y fftw fftw-devel
sudo dnf install -y metis metis-devel

sudo dnf install -y gsl gsl-devel

# optional dependencies
sudo dnf install -y numactl
sudo dnf install -y gperftools
sudo dnf install -y healpix
sudo dnf install -y cfitsio

# grackle dependencies
sudo dnf install -y gfortran

# post-run dependencies
sudo dnf install -y python3

# publish dependencies
sudo dnf install -y texlive-scheme-full

# animation dependencies
sudo dnf install -y ffmpeg
