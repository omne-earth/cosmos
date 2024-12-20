#!/usr/bin/bash
set -ueox pipefail
project_dir=$(pwd)
simulation_dir=$(dirname "$0")

source "$(echo $0 | sed 's|\(.*\)/.*|\1|')/bootstrap.sh" ${1:-default} "default" $(dirname -- "$0") 3.12
run_dir=$(pwd)

# Get the initial conditions if they are not present.
if [ ! -e small_cosmo_volume.hdf5 ]
then
    echo "Fetching initial conditions file..."
    ./getIC.sh
fi

start=$(date +%s)
../../../swift --cosmology --self-gravity --hydro --threads=6 small_cosmo_volume.yml
end=$(date +%s)
echo "run completed in " $(( end - start ))  "seconds"

cd $project_dir
cd $simulation_dir
last_snapshot_index=$(ls $run_dir/snapshots | grep hdf5 | tail -1 | cut -f2 -d '_' | cut -f1 -d '.'| xargs echo | sed 's/^0*//')
N=$((last_snapshot_index))

cd $run_dir
for i in $(seq 1 ${N%.*});
do
    python3 plotProjection.py $i
done
