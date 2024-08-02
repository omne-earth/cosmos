#!/usr/bin/bash
set -ueox pipefail

./scripts/configure/linux/vanilla.sh

cd SWIFT/examples/HydroTests/SodShock_3D
python3 -m venv venv
source venv/bin/activate
pip install -r ../../../../requirements/SodShock_3D.txt

# Get the initial conditions if they are not present.
if [ ! -e glassCube_32.hdf5 ] || [ ! -e glassCube_64.hdf5 ];
then
    echo "Fetching initial conditions file..."
    ./getGlass.sh
    python3 makeIC.py
fi

start=$(date +%s)
../../../swift --hydro --threads=32 sodShock.yml
end=$(date +%s)
echo "run completed in " $(( end - start ))  "seconds"

python3 plotSolution.py 1
echo "Output:"
echo ${PWD}/SodShock.png
