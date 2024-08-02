#!/usr/bin/bash
set -ueox pipefail

if [ ! -d "SWIFT" ] ; then
    git clone git@github.com:climateactionproject-shree/SWIFT.git
fi

cd SWIFT
export CC=x86_64-w64-mingw32-g++
./autogen.sh
./configure
make
