#!/bin/bash
SECONDS=0
. ../common.sh

[[ -z $VERSION ]] && VERSION=1.13.2

docker_build bukkit
echo "Built in ${SECONDS} seconds"