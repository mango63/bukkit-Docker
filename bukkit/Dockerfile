FROM base:latest AS jdk
ARG bukkit_version=latest
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
#RUN wget https://mvn.intellectualsites.com/service/local/repositories/releases/content/com/plotsquared/PlotSquared-Bukkit/5.13.3/PlotSquared-Bukkit-5.13.3.jar
#RUN wget https://mvn.intellectualsites.com/service/local/repositories/releases/content/com/plotsquared/PlotSquared-Core/5.13.3/PlotSquared-Core-5.13.3.jar
#RUN wget -O p2.zip https://ci.athion.net/job/PlotSquared-Releases/lastSuccessfulBuild/artifact/target/*zip*/target.zip
#RUN unzip p2.zip
RUN wget https://ci.athion.net/job/Plot2Dynmap/lastSuccessfulBuild/artifact/build/libs/Plot2Dynmap-5.2.jar
RUN wget -O ess.zip https://ci.ender.zone/job/EssentialsX/lastSuccessfulBuild/artifact/jars/*zip*/jars.zip
RUN unzip ess.zip
RUN wget -O join.zip https://ci.codemc.io/job/SirBlobman/job/JoinCommands/lastSuccessfulBuild/artifact/target/*zip*/target.zip
RUN unzip join.zip
RUN wget -O mv.zip http://ci.onarandombox.com/job/Multiverse-Core/lastSuccessfulBuild/artifact/target/*zip*/target.zip
RUN unzip mv.zip
#RUN wget https://jenkins.addstar.com.au/job/PermissionsEx/33/artifact/build/libs/permissionsex-bukkit-2.0-SNAPSHOT.jar
RUN wget -O proto.zip https://ci.dmulloy2.net/job/ProtocolLib/lastSuccessfulBuild/artifact/target/*zip*/target.zip
RUN unzip proto.zip
RUN wget -O luckPerm.zip https://ci.lucko.me/view/LuckPerms/job/LuckPerms/lastSuccessfulBuild/artifact/bukkit/build/libs/*zip*/libs.zip
RUN unzip luckPerm.zip
#RUN wget http://repo.mikeprimm.com/us/dynmap/DynmapCoreAPI/3.1-beta-2/DynmapCoreAPI-3.1-beta-2-all.jar


FROM jdk as final
ADD server.properties commands.yml start.sh advertise.py eula.txt /bukkit/
COPY plugins plugins/
COPY --from=build /build/spigot-*.jar .
#COPY --from=build /build/Dynmap*.jar plugins/
#COPY --from=build /build/PlotSquared-*.jar plugins/
COPY --from=build /build/Plot2Dynmap-*.jar plugins/
COPY --from=build /build/target/ProtocolLib*.jar plugins/
#COPY --from=build /build/permissionsex-bukkit-2.0-SNAPSHOT.jar plugins/
COPY --from=build /build/target/Multiverse-Core-*-SNAPSHOT.jar plugins/
COPY --from=build /build/target/JoinCommands-*.jar plugins/
COPY --from=build /build/jars/EssentialsX-*.jar plugins/
COPY --from=build /build/jars/EssentialsXAntiBuild*.jar plugins/
COPY --from=build /build/jars/EssentialsXChat*.jar plugins/
COPY --from=build /build/jars/EssentialsXProtect*.jar plugins/
COPY --from=build /build/jars/EssentialsXSpawn*.jar plugins/
COPY --from=build /build/libs/LuckPerms-Bukkit*.jar plugins/

RUN apt-get install nano
RUN chown bukkit:bukkit * -R
USER bukkit

# This fails,
# RUN java -Xms1G -Xmx1G -jar minecraft_server.1.10.2.jar nogui
# TODO: create server.properties, and an eula.txt
CMD ["./start.sh"]
