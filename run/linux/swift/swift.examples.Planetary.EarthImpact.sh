#!/usr/bin/bash
# set -ueox pipefail

script_path_raw=$0
script_directory=$(echo ${script_path_raw} | sed 's|\(.*\)/.*|\1|')
source "${script_directory}/bootstrap.sh" $1

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

