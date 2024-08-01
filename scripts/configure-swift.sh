#!/usr/bin/bash
set -ueox pipefail

git clone https://github.com/SWIFTSIM/SWIFT.git
cd SWIFT
./autogen.sh
./configure
make
