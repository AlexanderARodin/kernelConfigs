#!/bin/sh
set -e

ENUM="./kernelConfigs/scripts/enum.sh"
LISTDIR="./kernelConfigs/list"

$ENUM < "$LISTDIR/$1" | while read LINE; do
	echo "--> $LINE"
done

exit 0



echo "\n[PROCESS LIST]"
while IFS= read -r LINE; do
	if [ 'x' = "x$LINE" ]; then
		true
	else
		FIRST=$(echo "$LINE" | cut -c 1)
		if [ '#' = $FIRST ]; then
			true
		else
			if [ '-' = $FIRST ]; then
				echo "--> apply: $LINE"
				#./scripts/config $LINE
			fi
		fi
	fi
done < $1
