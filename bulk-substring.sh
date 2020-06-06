#!/usr/bin/env sh

function error {
  local errorString=$1

  echo ${errorString}
  exit 1
}

[ $# -lt 2 ] && error "Invalid arguments"

MATCH=$1
REPLACE=$2

FILES=$(ls *${MATCH}* 2>/dev/null)

if [ $? != "0" ]; then
  error "No matches found"
fi

for file in ${FILES}; do
  echo ${file} | sed -e "s/\(.*\)${MATCH}\(.*\)/mv '&' '\1${REPLACE}\2'/" | sh
done
