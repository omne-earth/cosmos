#!/usr/bin/bash
set -ueox pipefail

script_name_raw=$(basename "$0")
script_name_delimited=${script_name_raw//.//}

example_directory=$(echo ${script_name_delimited} | cut -d "/" -f 2)
folder_name=$(echo ${script_name_delimited} | cut -d "/" -f 3)
example_name=$(echo ${script_name_delimited} | cut -d "/" -f 4)
requirements_filename=${script_name_raw/.sh/.txt}

if [ "$#" -lt 1 ]
then
    module_name="SWIFT.${example_name}"
else
    module_name="SWIFT.${example_name}.$1"
fi

./scripts/linux/swift/configure.sh "${module_name}" "planetary"
cd "${module_name}/${example_directory}/${folder_name}/${example_name}"

python3 -m venv venv
source venv/bin/activate
pip install -r ../../../../requirements/${requirements_filename}
