FROM openjdk:8-alpine

MAINTAINER nathan

ADD localmovies.jar localmovies.jar
ADD keystore.jks keystore.jks
ADD application.properties application.properties
EXPOSE 5432
ENTRYPOINT java -jar localmovies.jar
