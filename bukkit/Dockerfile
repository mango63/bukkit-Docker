FROM base:latest AS jdk
ARG bukkit_version=1.17
ENV BUKKIT_VERSION=${bukkit_version}
ARG java_version=16
ENV JAVA_VERSION=${java_version}
# todo: collapse these to single command
RUN sed --in-place --regexp-extended "s/(\/\/)(archive\.ubuntu)/\1au.\2/" /etc/apt/sources.list \
    && apt-get install -y software-properties-common \ 
    && apt-add-repository ppa:openjdk-r/ppa && \
       apt-get update
RUN apt-get install -y ca-certificates-java
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
RUN wget https://ci.athion.net/job/Plot2Dynmap/lastSuccessfulBuild/artifact/build/libs/Plot2Dynmap-5.2.jar
RUN wget -O ess.zip https://ci.ender.zone/job/EssentialsX/lastSuccessfulBuild/artifact/jars/*zip*/jars.zip
RUN unzip ess.zip
RUN wget -O join.zip https://jenkins.sirblobman.xyz/job/SirBlobman/job/Join%20Commands/lastSuccessfulBuild/artifact/target/*zip*/target.zip
RUN unzip join.zip
RUN wget -O mv.zip http://ci.onarandombox.com/job/Multiverse-Core/lastSuccessfulBuild/artifact/target/*zip*/target.zip
RUN unzip mv.zip
RUN wget -O proto.zip https://ci.dmulloy2.net/job/ProtocolLib/lastSuccessfulBuild/artifact/target/*zip*/target.zip
RUN unzip proto.zip
RUN wget -O luckPerm.zip https://ci.lucko.me/view/LuckPerms/job/LuckPerms/lastSuccessfulBuild/artifact/bukkit/loader/build/libs/*zip*/libs.zip
RUN unzip luckPerm.zip
RUN wget https://dynmap.us/releases/Dynmap-3.2-beta-1-spigot.jar
#RUN wget https://github.com/kangarko/ChatControl-Pro/releases/download/8.10.5/ChatControl-8.10.5.jar
## Moved to Premium version see README for more details

FROM jdk as final
ADD server.properties commands.yml start.sh advertise.py /bukkit/
COPY plugins plugins/
#COPY --from=build /build/ChatControl-*.jar plugins/
COPY --from=build /build/spigot-*.jar .
COPY --from=build /build/Dynmap*.jar plugins/
COPY --from=build /build/Plot2Dynmap-*.jar plugins/
COPY --from=build /build/target/ProtocolLib*.jar plugins/
COPY --from=build /build/target/Multiverse-Core-*-SNAPSHOT.jar plugins/
COPY --from=build /build/target/JoinCommands-*.jar plugins/
COPY --from=build /build/jars/EssentialsX-*.jar plugins/
COPY --from=build /build/jars/EssentialsXAntiBuild*.jar plugins/
COPY --from=build /build/jars/EssentialsXChat*.jar plugins/
COPY --from=build /build/jars/EssentialsXProtect*.jar plugins/
COPY --from=build /build/jars/EssentialsXSpawn*.jar plugins/
COPY --from=build /build/libs/LuckPerms-Bukkit*.jar plugins/
RUN echo "eula=true" > eula.txt

RUN apt-get install nano
RUN chown bukkit:bukkit * -R
USER bukkit

# This fails,
# RUN java -Xms1G -Xmx1G -jar minecraft_server.1.10.2.jar nogui
# TODO: create server.properties, and an eula.txt
CMD ["./start.sh"]
