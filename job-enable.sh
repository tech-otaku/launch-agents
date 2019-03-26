#!/usr/bin/env bash

# No `Disable` key - job is enabled
# `Disable` key is `false` - job is enabled
# `Disable` key is `true` - job is disabled

if [ -z $1 ]; then
	printf "\nERROR: Usage is service-disable.sh </path/to/file.plist>\n\n"
	exit 1
fi

if ! [ -f $1 ]; then
	printf "\nERROR: $1 doesn't exist.\n\n"
	exit 1
fi

grep -q Disabled "$1"

if [ $? -eq 0 ]; then
	perl -0pi -w -e 's/Disabled<\/key>(\s*)<true/Disabled<\/key>$1<false/g' $1
fi
