#!/bin/sh
set -e

cd ./linux-5.15.85

ENUM="../kernelConfigs/scripts/enum-keys.sh"
LISTDIR="../kernelConfigs/list"

$ENUM < "$LISTDIR/$1-applyList" | \
	while read LINE; do
		RESULT=$( ./scripts/config -s $LINE )
		if [ 'undef' = $RESULT ]; then
      	echo "UNDEF\t<--$LINE"
			exit 1
		else
			echo "$RESULT\t<--$LINE"
		fi
	done
