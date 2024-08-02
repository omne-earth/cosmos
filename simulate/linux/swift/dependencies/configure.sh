#!/usr/bin/bash
set -ueox pipefail

if [ ! -d "$1" ] ; then
    git clone git@github.com:climateactionproject-shree/SWIFT.git $1
fi

cd $1
./autogen.sh
case "$2" in
    "planetary")
        ./configure --with-hydro=planetary --with-equation-of-state=planetary ;;
    "default")
        ./configure ;;
    *)
        echo "please provide a valid configuration scheme" && exit 1;;
esac
make
