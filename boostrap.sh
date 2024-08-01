#!/usr/bin/bash
set -ueox pipefail

./scripts/install-dependencies.sh
./scripts/install-grackle.sh
./scripts/configure-swift.sh
