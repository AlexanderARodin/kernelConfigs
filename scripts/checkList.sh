#!/bin/sh
set -e

cd ./linux-5.15.85

UNDEF_LIST="E: "
exec >&9

ENUM="../kernelConfigs/scripts/enum-keys.sh"
LISTDIR="../kernelConfigs/list"

$ENUM < "$LISTDIR/$1-applyList" | \
	while read LINE; do
		RESULT=$( ./scripts/config -s $LINE )
		if [ 'undef' = $RESULT ]; then
			echo -n "XXXX" >&9
			echo "-------"
		fi
		echo "$RESULT\t<--$LINE"
	done

