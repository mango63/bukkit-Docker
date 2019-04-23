FROM base:latest AS jdk
ARG bukkit_version=1.13.2
ENV BUKKIT_VERSION=${bukkit_version}
ARG java_version=8
ENV JAVA_VERSION=${java_version}
# todo: collapse these to single command
RUN apt-get install -y software-properties-common \ 
    && apt-add-repository ppa:openjdk-r/ppa && \
       apt-get update
RUN echo "yes" | apt-get install -y openjdk-${JAVA_VERSION}-jdk
RUN adduser bukkit && mkdir /bukkit && chown bukkit:bukkit /bukkit -R
WORKDIR /bukkit

FROM jdk AS build
WORKDIR /build
RUN apt-get install git -y && chown bukkit:bukkit . -R
USER bukkit
RUN wget -O BuildTools.jar \
    https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar && \
    java -jar BuildTools.jar --rev $BUKKIT_VERSION

FROM jdk as final
ADD server.properties commands.yml start.sh advertise.py eula.txt /bukkit/
COPY plugins plugins/
COPY --from=build /build/craftbukkit-*.jar .
RUN apt-get install nano
RUN chown bukkit:bukkit * -R
USER bukkit

# This fails,
# RUN java -Xms1G -Xmx1G -jar minecraft_server.1.10.2.jar nogui
# TODO: create server.properties, and an eula.txt
CMD ["./start.sh"]
