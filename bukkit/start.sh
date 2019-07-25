#!/bin/bash

# Start server advertiser
HOSTNAME=$( grep -o -P '(?<=motd=).*' server.properties )
[[ -z "$HOSTNAME" ]] && HOSTNAME="A minecraft server"

python3 advertise.py "$HOSTNAME" &

# Start server itself

exec java -Xms6G -Xmx6G -jar spigot-${BUKKIT_VERSION}.jar nogui
