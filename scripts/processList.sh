#!/bin/sh
set -e

cd ./linux-5.15.85

ENUM="../kernelConfigs/scripts/enum.sh"
LISTDIR="../kernelConfigs/list"

$ENUM < "$LISTDIR/$1" | \
	while read LINE; do
		echo "--> apply: $LINE"
		./scripts/config $LINE
	done
  
  
  
  
cd ./linux-5.15.85

ENUM="../kernelConfigs/scripts/enum-keys.sh"
LISTDIR="../kernelConfigs/list"

$ENUM < "$LISTDIR/$1" | \
	while read LINE; do
		RESULT=$( ./scripts/config -s $LINE )
		echo "$RESULT\t<--$LINE"
	done
