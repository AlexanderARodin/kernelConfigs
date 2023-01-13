#!/bin/bash
set -e

function perform_task {

	echo "--> apply: $LINE"
#	./scripts/config $LINE
}

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
				perfom_task
			fi
		fi
	fi
done < $1
