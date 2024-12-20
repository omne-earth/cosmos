#!/usr/bin/bash
set -ueox pipefail
source "$(echo $0 | sed 's|\(.*\)/.*|\1|')/bootstrap.sh" ${1:-default} "default" $(dirname -- "$0") 3.12

# Get the initial conditions if they are not present.
if [ ! -e small_cosmo_volume.hdf5 ]
then
    echo "Fetching initial conditions file..."
    ./getIC.sh
fi

start=$(date +%s)
../../../swift --cosmology --self-gravity --threads=6 small_cosmo_volume_dm.yml
end=$(date +%s)
echo "run completed in " $(( end - start ))  "seconds"

python3 plotProjection.py 31
