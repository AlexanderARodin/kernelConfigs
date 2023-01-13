#!/bin/sh
set -e

cd ./linux-5.15.85

ENUM="../kernelConfigs/scripts/enum-keys.sh"
LISTDIR="../kernelConfigs/list"

$ENUM < "$LISTDIR/$1-applyList" | \
	while read LINE; do
		echo "--> apply: $LINE"
		./scripts/config -s $LINE
	done
