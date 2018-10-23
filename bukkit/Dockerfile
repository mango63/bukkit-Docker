FROM base:latest

# todo: collapse these to single command
RUN apt-get install -y software-properties-common
RUN apt-get install nano
RUN apt-add-repository ppa:webupd8team/java
RUN apt-get update
RUN echo "yes" | apt-get install -y oracle-java8-installer
#RUN echo "yes" | apt-get install git openjdk-8-jre-headless

RUN adduser bukkit && mkdir /bukkit && chown bukkit:bukkit /bukkit
WORKDIR /bukkit
#ADD BuildTools.jar /bukkit/
#RUN java -jar BuildTools.jar --rev 1.13.2
ADD server.properties commands.yml craftbukkit-*.jar start.sh advertise.py eula.txt /bukkit/

COPY plugins plugins/

# This fails,
# RUN java -Xms1G -Xmx1G -jar minecraft_server.1.10.2.jar nogui
# TODO: create server.properties, and an eula.txt
CMD ["./start.sh"]


