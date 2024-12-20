#!/usr/bin/bash
set -ueox pipefail
source "$(echo $0 | sed 's|\(.*\)/.*|\1|')/bootstrap.sh" ${1:-default} "default" $(dirname -- "$0") 3.13

set -ueox pipefail
# Get the initial conditions if they are not present.
if [ ! -e glassCube_32.hdf5 ] || [ ! -e glassCube_64.hdf5 ];
then
    echo "Fetching initial conditions file..."
    ./getGlass.sh
    python3 makeIC.py
fi

start=$(date +%s)
../../../swift --hydro --threads=4 sodShock.yml
end=$(date +%s)
echo "run completed in " $(( end - start ))  "seconds"

python3 plotSolution.py 1
echo "Output:"
echo ${PWD}/SodShock.png
