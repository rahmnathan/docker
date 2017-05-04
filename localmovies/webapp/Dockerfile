FROM tomcat:8-alpine

MAINTAINER nathan

RUN rm -rf /usr/local/tomcat/webapps/*
ADD LocalMovies.war /usr/local/tomcat/webapps/ROOT.war
ADD keystore.jks /usr/local/tomcat/keystore.jks
ADD server.xml /usr/local/tomcat/conf/server.xml
ADD adapters /usr/local/tomcat/lib/
