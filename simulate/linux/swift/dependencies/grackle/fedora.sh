#!/usr/bin/bash
set -ueox pipefail

# Clone grackle repository and make configure
rm -rf ${HOME}/tmp/grackle/
mkdir -p ${HOME}/tmp/grackle/
cd ${HOME}/tmp
git clone --recurse-submodules git@github.com:action-project/grackle.git
cd ${HOME}/tmp/grackle/
./configure

# Build grackle for linux-gnu
cd src/clib
make machine-fedora
make show-config
make

# Install to user directory and copy to main libs
THIS_HOME=${HOME}
sudo rm -rf ${THIS_HOME}/local/
mkdir ${THIS_HOME}/local/
make install
sudo chown -R root:root ${THIS_HOME}/local/lib/*
sudo cp -f ${THIS_HOME}/local/lib/* /usr/lib64/
sudo rm -rf ${HOME}/tmp/grackle/
sudo rm -rf ${HOME}/tmp/
