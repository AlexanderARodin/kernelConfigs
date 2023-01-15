#!/bin/sh
set -e


cd ./linux-5.15.85

LISTDIR="../kernelConfigs/list"
if   [ '--apply' = $1 ]; then
	ENUM="../kernelConfigs/scripts/enum.sh"
elif [ '--check' = $1 ]; then
	ENUM="../kernelConfigs/scripts/enum-keys.sh"
else
	echo "unsupported command: $1" > 2
	exit 1
fi

FILES=$2
if [ '--all' = "$FILES" ]; then
	FILES=$( ls "$LISTDIR" )
fi

for item in $FILES; do
	$ENUM < "$LISTDIR/$item" | \
		while read LINE; do
			if [ '--apply' = $1 ]; then
				echo "--> apply: $LINE"
				./scripts/config $LINE
			else
				RESULT=$( ./scripts/config -s $LINE )
				echo "$RESULT\t<--$LINE"
			fi
		done
done



#
