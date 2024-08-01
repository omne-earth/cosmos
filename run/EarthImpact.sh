#!/usr/bin/bash
set -ueox pipefail

scripts/configure-swift-planetary.sh

cd SWIFT/examples/Planetary/EarthImpact
python3 -m venv venv
source venv/bin/activate
pip install -r ../../../../requirements/EarthImpact.txt

# Get the initial conditions if they are not present.
if [ ! -e earth_impact.hdf5 ]
then
    echo "Fetching initial conditions file for the Earth impact example..."
    ./get_init_cond.sh
fi

# Run SWIFT
../../../swift -s -G -t 32 earth_impact.yml 2>&1 | tee output.log

# # Plot the snapshots
# python3 plot_solution.py

# # Make a simple animation
# ./make_anim.sh

