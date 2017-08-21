FROM openjdk:8-jre-slim

MAINTAINER nathan

ADD ssl-gen.sh /ssl-gen.sh
RUN /ssl-gen.sh
RUN apt update && \
    apt -y install ffmpeg && \
    apt clean
ADD localmovies.jar localmovies.jar
ADD application.properties application.properties

EXPOSE 5432
ENTRYPOINT java -Xms64m -Xmx3G -XX:MetaspaceSize=96M -XX:MaxMetaspaceSize=3G -Djava.net.preferIPv4Stack=true -Djava.awt.headless=true -jar localmovies.jar