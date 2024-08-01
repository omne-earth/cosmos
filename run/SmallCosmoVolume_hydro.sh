#!/usr/bin/bash
set -ueox pipefail

cd SWIFT/examples/SmallCosmoVolume/SmallCosmoVolume_hydro
python3 -m venv venv
source venv/bin/activate
pip install -r ../../../../requirements/SmallCosmoVolume_hydro.txt

./getIC.sh

../../../swift --cosmology --self-gravity --hydro --threads=32 small_cosmo_volume.yml

python3 plotProjection.py 31
