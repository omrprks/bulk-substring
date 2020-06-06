#!/usr/bin/env sh

set -euf -o pipefail

function quiet_pushd {
  command pushd ${1} > /dev/null
}

function quiet_popd {
  command popd > /dev/null
}

function colorize {
  local green="\033[1;32m"
  local red="\033[1;31m"

  local END="\033[0m"

  echo "${!1}${2}${END}"
}

function assert_string {
  if [ "$1" != "$2" ]; then
    echo $(colorize red [FAIL]) Test failed to run
    echo Expected Output: ${2}
    echo Actual Output: ${1}
    exit 1
  fi
}

tmp_dir=$(mktemp -d -t bulk-substring-$(date +%Y-%m-%d-%H-%M-%S))

expected_output="no1 no2 no3 no4 no5"

bulk_substring=$(pwd)/bulk-substring.sh

quiet_pushd ${tmp_dir}

touch yes{1,2,3,4,5}

${bulk_substring} yes no

output=$(ls -p | grep -v / | sed 's/\n/ /g' | xargs)

quiet_popd

rm -rf ${tmp_dir}

assert_string "${output}" "${expected_output}"

echo $(colorize green [PASS]) $(basename ${0})
