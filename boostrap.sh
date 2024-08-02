#!/usr/bin/bash
set -ueox pipefail

./scripts/configure/linux/install-dependencies.sh
./scripts/install-grackle.sh
./scripts/configure-swift.sh
