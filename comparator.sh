#!/bin/sh
set -e

PARSER=""

for KEY in $(cat ./fullKeyList); do
  echo "$KEY"
done 
