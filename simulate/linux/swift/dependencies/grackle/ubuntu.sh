#!/usr/bin/bash
set -ueox pipefail

# Clone grackle repository and make configure
rm -rf ${HOME}/tmp/grackle
mkdir -p ${HOME}/tmp/grackle
cd ${HOME}/tmp
git clone --recurse-submodules https://github.com/grackle-project/grackle
cd ${HOME}/tmp/grackle
./configure

# Build grackle for linux-gnu
cd src/clib
make machine-linux-gnu
make show-config
make

# Install to user directory and copy to main libs
THIS_HOME=${HOME}
sudo rm -rf ${THIS_HOME}/local
mkdir ${THIS_HOME}/local
make install
sudo chown -R root:root ${THIS_HOME}/local/lib/*
sudo mv -f /home/shree/local/lib/* /lib/x86_64-linux-gnu/
sudo rm -rf ${THIS_HOME}/local
sudo rm -rf ${HOME}/tmp/grackle
sudo rm -rf ${HOME}/tmp
