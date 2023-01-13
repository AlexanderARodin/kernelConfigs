#!/bin/sh
set -e

cd ./linux-5.15.85

UNDEF_LIST=""

ENUM="../kernelConfigs/scripts/enum-keys.sh"
LISTDIR="../kernelConfigs/list"

$ENUM < "$LISTDIR/$1-applyList" | \
	while read LINE; do
		RESULT=$( ./scripts/config -s $LINE )
		if [ 'undef' = $RESULT ]; then
      	UNDEF_LIST="$UNDEF_LIST $LINE"
		fi
		echo "$RESULT\t<--$LINE"
	done

echo $UNDEF_LIST
