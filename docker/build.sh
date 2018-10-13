
#!/bin/bash

. ../common.sh

[[ -z $VERSION ]] && VERSION=1.13.1

[[ -f craftbukkit-$VERSION.jar ]]  || wget https://cdn.getbukkit.org/craftbukkit/craftbukkit-$VERSION.jar

[[ -f plugins.zip ]] ||  wget https://github.com/mango63/plugins/raw/master/plugins.zip

[[ -f commands.yml ]] ||  wget https://github.com/mango63/plugins/raw/master/commands.yml

[[ -f server.properties ]] ||  wget https://github.com/mango63/plugins/raw/master/server.properties

docker_build bukkit
