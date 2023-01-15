#!/bin/sh
set -e

if

cd ./linux-5.15.85

LISTDIR="../kernelConfigs/list"
if [ '--apply' = $1 ]; then
	ENUM="../kernelConfigs/scripts/enum.sh"
elif [ '--check' = $1 ]; then
	ENUM="../kernelConfigs/scripts/enum-keys.sh"
else
	echo "unsupported command: $1" > 2
	exit 1
fi

exit 0
$ENUM < "$LISTDIR/$2" | \
	while read LINE; do
		if [ '--apply' = $1 ]; then
			echo "--> apply: $LINE"
			./scripts/config $LINE
		else
			RESULT=$( ./scripts/config -s $LINE )
			echo "$RESULT\t<--$LINE"
		fi
	done
	

