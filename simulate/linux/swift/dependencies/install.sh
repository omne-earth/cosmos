#!/usr/bin/bash
set -ueox pipefail
SCRIPT_DIR="$( dirname -- "${BASH_SOURCE[0]}" )"

./${SCRIPT_DIR}/main.sh
./${SCRIPT_DIR}/grackle.sh