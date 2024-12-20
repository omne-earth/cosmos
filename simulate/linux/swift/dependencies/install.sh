#!/usr/bin/bash
set -ueox pipefail

SCRIPT_DIR="$( dirname -- "${BASH_SOURCE[0]}" )"
OS=$1

./${SCRIPT_DIR}/main/${OS}.sh
./${SCRIPT_DIR}/grackle/${OS}.sh

curl https://pyenv.run | bash
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
echo 'export PATH="/usr/lib64/openmpi/bin:$PATH"' >> ~/.bashrc
