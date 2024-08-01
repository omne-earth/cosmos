#!/usr/bin/bash
set -ueox pipefail

./scripts/configure-swift.sh

cd SWIFT/examples/SmallCosmoVolume/SmallCosmoVolume_DM
python3 -m venv venv
source venv/bin/activate
pip install -r ../../../../requirements/SmallCosmoVolume_DM.txt

./getIC.sh

../../../swift --cosmology --self-gravity --threads=32 small_cosmo_volume_dm.yml

python3 plotProjection.py 31
