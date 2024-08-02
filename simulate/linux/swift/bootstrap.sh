#!/usr/bin/bash
# set -ueox pipefail

script_name_raw=$(basename "$0")
script_name_delimited=${script_name_raw//.//}

example_directory=$(echo ${script_name_delimited} | cut -d "/" -f 1)
folder_name=$(echo ${script_name_delimited} | cut -d "/" -f 2)
example_name=$(echo ${script_name_delimited} | cut -d "/" -f 3)
requirements_filename=${script_name_raw/.sh/.txt}
module_name="SWIFT.${example_name}.$1"

$3/dependencies/configure.sh "${module_name}" $2
cd "${module_name}/${example_directory}/${folder_name}/${example_name}"

python3 -m venv venv
source venv/bin/activate

pip install -r ../../../../simulate/linux/swift/requirements/${requirements_filename}
