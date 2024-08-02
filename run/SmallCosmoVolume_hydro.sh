#!/usr/bin/bash
set -ueox pipefail

./scripts/configure/linux/vanilla.sh

cd SWIFT/examples/SmallCosmoVolume/SmallCosmoVolume_hydro
python3 -m venv venv
source venv/bin/activate
pip install -r ../../../../requirements/SmallCosmoVolume_hydro.txt

# Get the initial conditions if they are not present.
if [ ! -e small_cosmo_volume.hdf5 ]
then
    echo "Fetching initial conditions file..."
    ./getIC.sh
fi

start=$(date +%s)
../../../swift --cosmology --self-gravity --hydro --threads=32 small_cosmo_volume.yml
end=$(date +%s)
echo "run completed in " $(( end - start ))  "seconds"

python3 plotProjection.py 31
