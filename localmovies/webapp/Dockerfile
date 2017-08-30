FROM openjdk:8-jre-alpine

MAINTAINER nathan

ADD keystore.jks keystore.jks
ADD localmovies-webapp.jar localmovies-webapp.jar

ENTRYPOINT java -Djava.net.preferIPv4Stack=true -Djava.net.preferIPv4Addresses=true -jar localmovies-webapp.jar
