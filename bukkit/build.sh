#!/bin/bash

. ../common.sh

[[ -z $VERSION ]] && VERSION=1.13.2

build(){
     git config --global --unset core.autocrlf
     java -jar BuildTools.jar --rev $VERSION
}



[[ -f craftbukkit-$VERSION.jar ]]  || wget https://www.dropbox.com/s/f1ps12q9ec4sg9i/craftbukkit-$VERSION.jar

#[[ -f BuildTools.jar ]]  || wget -O BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
#[[ ! `ls craftbukkit*.jar` ]] && build

docker_build bukkit
