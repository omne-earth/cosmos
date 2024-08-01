#!/usr/bin/bash
set -ueox pipefail

if [ ! -d "SWIFT" ] ; then
    git clone git@github.com:climateactionproject-shree/SWIFT.git
fi

cd SWIFT
./autogen.sh
./configure --with-hydro=planetary --with-equation-of-state=planetary
make
