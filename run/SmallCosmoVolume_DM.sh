#!/usr/bin/bash
set -ueox pipefail

./scripts/configure/linux/vanilla.sh

cd SWIFT/examples/SmallCosmoVolume/SmallCosmoVolume_DM
python3 -m venv venv
source venv/bin/activate
pip install -r ../../../../requirements/SmallCosmoVolume_DM.txt

./getIC.sh

start=$(date +%s)
../../../swift --cosmology --self-gravity --threads=32 small_cosmo_volume_dm.yml
end=$(date +%s)
echo "run completed in " $(( end - start ))  "seconds"

python3 plotProjection.py 31
