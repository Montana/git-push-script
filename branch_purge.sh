#!/bin/bash 

usage () {
	echo -e "Usage: git purge-branch <branch>\n"
	exit $1
}

if [ $# -le 0 ]; then
	echo -e "Err: missing argument!\n"
	usage 1
fi

git branch -D "$1"
git push origin --delete "$1"
git remote prune origin

exit 0
