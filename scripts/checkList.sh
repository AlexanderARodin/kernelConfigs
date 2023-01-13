#!/bin/sh
set -e

cd ./linux-5.15.85

UNDEF_LIST="E: "

ENUM="../kernelConfigs/scripts/enum-keys.sh"
LISTDIR="../kernelConfigs/list"

$ENUM < "$LISTDIR/$1-applyList" | \
	while read LINE; do
		RESULT=$( ./scripts/config -s $LINE )
     	$UNDEF_LIST="UUUUU"
		if [ 'undef' = $RESULT ]; then
      	UNDEF_LIST="$UNDEF_LIST $LINE"
			echo "-------"
		fi
		echo "$RESULT\t<--$LINE"
	done

echo $UNDEF_LIST
