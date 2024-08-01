#!/usr/bin/bash
set -ueox pipefail

./scripts/configure-swift.sh

cd SWIFT/examples/SmallCosmoVolume/SmallCosmoVolume_hydro
python3 -m venv venv
source venv/bin/activate
pip install -r ../../../../requirements/SmallCosmoVolume_hydro.txt

./getIC.sh

start=$(date +%s)
../../../swift --cosmology --self-gravity --hydro --threads=32 small_cosmo_volume.yml
end=$(date +%s)
echo "run completed in " $(( end - start ))  "seconds"

python3 plotProjection.py 31
