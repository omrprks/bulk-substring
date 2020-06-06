#!/usr/bin/env sh

MATCH=$1
REPLACE=$2

FILES=$(ls *${MATCH}* 2>/dev/null)

if [ $? != "0" ]; then
  echo No matches found
  exit 1
fi

for file in ${FILES}; do
  echo ${file} | sed -e "s/\(.*\)${MATCH}\(.*\)/mv '&' '\1${REPLACE}\2'/" | sh
done
