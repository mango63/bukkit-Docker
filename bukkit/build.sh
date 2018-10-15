#!/bin/bash

. ../common.sh

[[ -z $VERSION ]] && VERSION=1.13.1

[[ -f craftbukkit-$VERSION.jar ]]  || wget https://cdn.getbukkit.org/craftbukkit/craftbukkit-$VERSION.jar


docker_build bukkit
