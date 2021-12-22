#!/bin/bash -e

usage () {
	echo -e "Usage: git push-branch <branch>\n"
	exit $1
}

if [ $# -le 0 ]; then
	# set branch to current branch
	branch=$(git branch | grep '*' | cut -d' ' -f2)
else
	branch="$1"
fi

git push -u origin "$branch"

exit 0
