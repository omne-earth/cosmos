#!/usr/bin/bash
set -ueox pipefail

git clone git@github.com:climateactionproject-shree/SWIFT.git
cd SWIFT
./autogen.sh
./configure
make
