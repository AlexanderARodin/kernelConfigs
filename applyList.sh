#!/bin/sh
set -e

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
