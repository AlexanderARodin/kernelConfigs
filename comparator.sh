#!/bin/sh
set -e

PARSER=""

for KEY in $(cat ./fullKeyList); do
  echo $KEY
  ./scripts/config -s $KEY --file "$1"
done 
