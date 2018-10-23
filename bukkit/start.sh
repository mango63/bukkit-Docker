#!/bin/sh

# Start server advertiser
HOSTNAME=$( grep -o -P '(?<=motd=).*' server.properties )
[[ -z "$HOSTNAME" ]] && HOSTNAME="A minecraft server"

python3 advertise.py "$HOSTNAME" &

# Start server itself

exec java -Xms4G -Xmx4G -jar craftbukkit-1.13.2.jar nogui
