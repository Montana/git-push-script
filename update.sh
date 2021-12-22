#!/bin/bash

usage () {
	echo -e "Usage: git update\n"
	exit $1
}

if [ "$1" == "-h" ]; then
	usage 0
fi

git submodule update --init --recursive &
