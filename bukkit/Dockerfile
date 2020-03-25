FROM base:latest AS jdk
ARG bukkit_version=1.15.2
ENV BUKKIT_VERSION=${bukkit_version}
ARG java_version=8
ENV JAVA_VERSION=${java_version}
# todo: collapse these to single command
RUN sed --in-place --regexp-extended "s/(\/\/)(archive\.ubuntu)/\1au.\2/" /etc/apt/sources.list \
    && apt-get install -y software-properties-common \ 
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
RUN wget -O p2.zip https://ci.athion.net/job/PlotSquared-Releases/lastSuccessfulBuild/artifact/target/*zip*/target.zip
RUN unzip p2.zip
RUN wget https://ci.athion.net/job/Plot2Dynmap/lastSuccessfulBuild/artifact/target/libs/Plot2Dynmap.jar
RUN wget -O ess.zip https://ci.ender.zone/job/EssentialsX/843/artifact/*zip*/archive.zip
RUN unzip ess.zip
RUN wget -O join.zip https://ci.codemc.io/job/SirBlobman/job/JoinCommands/lastSuccessfulBuild/artifact/target/*zip*/target.zip
RUN unzip join.zip
RUN wget -O mv.zip http://ci.onarandombox.com/view/Multiverse/job/Multiverse-Core/lastSuccessfulBuild/artifact/target/*zip*/target.zip
RUN unzip mv.zip
#RUN wget https://jenkins.addstar.com.au/job/PermissionsEx/33/artifact/build/libs/permissionsex-bukkit-2.0-SNAPSHOT.jar
RUN wget https://ci.dmulloy2.net/job/ProtocolLib/440/artifact/target/ProtocolLib.jar
RUN wget -O luckPerm.zip https://ci.lucko.me/view/LuckPerms/job/LuckPerms/lastSuccessfulBuild/artifact/bukkit/build/libs/*zip*/libs.zip
RUN unzip luckPerm.zip

FROM jdk as final
ADD server.properties commands.yml start.sh advertise.py eula.txt /bukkit/
COPY plugins plugins/
COPY --from=build /build/spigot-*.jar .
COPY --from=build /build/ProtocolLib.jar plugins/
#COPY --from=build /build/permissionsex-bukkit-2.0-SNAPSHOT.jar plugins/
COPY --from=build /build/target/Multiverse-Core-4.1.1-SNAPSHOT.jar plugins/
COPY --from=build /build/target/JoinCommands-*.jar plugins/
COPY --from=build /build/archive/Essentials/target/EssentialsX*.jar plugins/
COPY --from=build /build/archive/EssentialsAntiBuild/target/EssentialsX*.jar plugins/
COPY --from=build /build/archive/EssentialsChat/target/EssentialsX*.jar plugins/
COPY --from=build /build/archive/EssentialsProtect/target/EssentialsX*.jar plugins/
COPY --from=build /build/archive/EssentialsSpawn/target/EssentialsX*.jar plugins/
COPY --from=build /build/Plot2Dynmap.jar plugins/
COPY --from=build /build/target/PlotSquared-Bukkit-*.jar plugins/
COPY --from=build /build/libs/LuckPerms-Bukkit*.jar plugins/

RUN apt-get install nano
RUN chown bukkit:bukkit * -R
USER bukkit

# This fails,
# RUN java -Xms1G -Xmx1G -jar minecraft_server.1.10.2.jar nogui
# TODO: create server.properties, and an eula.txt
CMD ["./start.sh"]
