#!/bin/bash

. ../common.sh

[[ -z $VERSION ]] && VERSION=1.13.2

build(){
     git config --global --unset core.autocrlf
     java -jar BuildTools.jar --rev $VERSION
}



#[[ -f craftbukkit-$VERSION.jar ]]  || wget https://cdn.getbukkit.org/craftbukkit/craftbukkit-$VERSION.jar

[[ -f BuildTools.jar ]]  || wget -O BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
[[ ! `ls craftbukkit*.jar` ]] && build

docker_build bukkit
