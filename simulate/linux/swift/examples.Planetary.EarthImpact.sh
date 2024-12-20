#!/usr/bin/bash
set -ueox pipefail
source "$(echo $0 | sed 's|\(.*\)/.*|\1|')/bootstrap.sh" ${1:-default} "planetary" $(dirname -- "$0") 3.9

# Get the initial conditions if they are not present.
if [[ ! -e earth_impact.hdf5 ]]; then
    echo "Fetching initial conditions file..."
    ./get_init_cond.sh
fi

# Run SWIFT
start=$(date +%s)
../../../swift --hydro --self-gravity --threads=16 earth_impact.yml
end=$(date +%s)
echo "run completed in " $(( end - start ))  "seconds"

# # Plot the snapshots
python3 plot_solution.py

# # Make a simple animation
./make_anim.sh

