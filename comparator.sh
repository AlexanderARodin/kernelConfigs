#!/bin/sh
set -e

PARSER=./scripts/config
FILE_1=$1
FILE_2=$2

for KEY in $(cat ../kernelConfigs/fullKeyList); do
  RES1=$("$PARSER" --file "$FILE_1" -s $KEY)
  RES2=$("$PARSER" --file "$FILE_2" -s $KEY)
  echo "$RES1 \t$RES2 \t <--$KEY"
done 
