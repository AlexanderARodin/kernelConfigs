#!/bin/sh
set -e

PARSER=./scripts/config
FILE_1=$1

for KEY in $(cat ../kernelConfigs/fullKeyList); do
  echo
  echo $KEY
  echo "f: $FILE_1"
  "$PARSER" --file "$FILE_1" -s $KEY
  echo
done 
