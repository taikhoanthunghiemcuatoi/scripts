#!/bin/bash

echo "This script is used to get OS platform"

platform="unknown"
unamestr=`uname`
if [ "$unamestr" == "Linux" ]; then
	platform="Linux"
elif [ "$unamestr" == "Darwin" ]; then
	platform="OSX"
elif [ "$unamestr" == "FreeBSD" ]; then
	platform="FreeBSD"
fi
echo "Platform: $platform"
