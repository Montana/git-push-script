#!/bin/bash -e

usage () {
	echo -e "Usage: git spush [<files>|all]\n"
	exit $1
}

if [ $# -le 0 ]; then
	echo -e "Err: missing argument!\n"
	usage 1
fi

if [ "$1" == "all" ]; then
	git add -A
else
	if grep -w '\-m' <<< "$@" &>/dev/null; then
		files=$(sed -e 's/-m.*$//g' <<< "$@")
		msg=$(sed -e 's/^.*-m//g' <<< "$@")
	else
		files="$@"
	fi
	git add "$files"
fi

if [ -n "$msg" ]; then
	git commit -m "$msg"
else
	git commit
fi

exit 0
