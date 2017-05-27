FROM openjdk:8-alpine

MAINTAINER nathan

ADD localmovies.jar localmovies.jar
ADD application.properties application.properties
ADD ssl-gen.sh /ssl-gen.sh
RUN /ssl-gen.sh

ENTRYPOINT java -jar localmovies.jar
