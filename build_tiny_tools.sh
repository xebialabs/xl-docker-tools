#!/bin/bash

containerOrganization="xebialabsunsupported"
branchName="ENG-9236"

if [[ $# -eq 0 ]] ; then
    printf "\e[31mProvide in a first parameter a version (SemVer compatible) to release !\e[m\n"
    echo "For example:"
    printf "\e[1;32m./build_tiny_tools.sh 22.0.0-114.1255 \e[0m"
    echo ""
    printf "\e[1;32m./build_tiny_tools.sh 22.0.0-114.1255 acierto\e[0m"
    echo ""
    printf "\e[1;32m./build_tiny_tools.sh 22.0.0-114.1255 acierto ENG-8769\e[0m"
    echo ""
    printf "Second example is about how to push the image to a non-default organization"
    echo ""
    printf "Third example shows how to push from the branch, even if you want to use the default organization, for a non-default branch you have to specify name for an organization."
    echo ""
    exit 1
fi

if [[ $# > 1 ]] ; then
  containerOrganization=$2
fi

if [[ $# > 2 ]] ; then
  branchName=$3
fi

mkdir build_tiny_tools
cd build_tiny_tools
git clone git@github.com:xebialabs/xl-docker-tools.git -b $branchName
cd xl-docker-tools/tiny-tools
export TINY_TOOLS_IMG="docker.io/$containerOrganization/tiny-tools:$1"
docker build --tag $TINY_TOOLS_IMG .
docker push $TINY_TOOLS_IMG
cd ../../..
rm -rf build_tiny_tools