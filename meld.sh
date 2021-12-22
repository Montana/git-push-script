#!/bin/bash

usage () {
	echo -e "Usage: git meld <...>\n"
	echo -e "  See help for 'git difftool' and 'git diff'"
	exit $1
}

if [ "$1" == "-h" ]; then
	usage 0
fi

git difftool -y -t meld "$@" &
