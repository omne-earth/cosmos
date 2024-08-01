#!/usr/bin/bash
set -ueox pipefail

cd SWIFT/examples/HydroTests/SodShock_3D
python3 -m venv venv
source venv/bin/activate
pip install -r ../../../../requirements/SodShock_3D.txt

./getGlass.sh
python3 makeIC.py

../../../swift --hydro --threads=32 sodShock.yml

python3 plotSolution.py 1
echo "Output:"
echo ${PWD}/SodShock.png
