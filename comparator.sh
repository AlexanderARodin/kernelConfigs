#!/bin/sh
set -e

PARSER=$1
FILE_1=$2

for KEY in $(cat ../kernelConfigs/fullKeyList); do
  echo $KEY
  "$PARSER" -s $KEY --file "$FILE_1"
done 
