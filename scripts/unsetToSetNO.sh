#!/bin/sh

while IFS= read -r line; do
	 lineWithConfig=$(echo $line | grep 'CONFIG_')
	 if [ -z "$lineWithConfig" ]; then
		  #echo "xxxxxxxxx $line"
		  true
	 else
		commentedConfig=$(echo $lineWithConfig | grep '^# CONFIG_' | grep ' is not set')
	 	if [ -z "$commentedConfig" ]; then
	 		echo "$lineWithConfig"
	  else
			#echo "- $commentedConfig"
			uncommentedConfig=$(echo $commentedConfig | sed 's/#\ CONFIG_/CONFIG_/')
			finalConfig=$(echo $uncommentedConfig | sed 's/\ is\ not\ set/=n/')
			echo "$finalConfig"
		fi
	 fi
done
