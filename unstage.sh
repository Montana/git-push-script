#!/bin/bash -e

usage () {
	echo -e "Usage: git unstage <files>\n"
	exit $1
}

if [ $# -le 0 ]; then
	paths="."  # set current directory if nothing specified
else
	paths="$@"
fi

git reset HEAD $paths

exit 0
