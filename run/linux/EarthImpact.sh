#!/usr/bin/bash
set -ueox pipefail

scripts/configure/linux/planetary.sh

cd SWIFT/examples/Planetary/EarthImpact
python3 -m venv venv
source venv/bin/activate
pip install -r ../../../../requirements/EarthImpact.txt

# Get the initial conditions if they are not present.
if [ ! -e earth_impact.hdf5 ]
then
    echo "Fetching initial conditions file..."
    ./get_init_cond.sh
fi

# Run SWIFT
start=$(date +%s)
../../../swift --hydro --self-gravity --threads=32 earth_impact.yml
end=$(date +%s)
echo "run completed in " $(( end - start ))  "seconds"

# # Plot the snapshots
python3 plot_solution.py

# # Make a simple animation
./make_anim.sh

