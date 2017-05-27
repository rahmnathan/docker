FROM jboss/wildfly

MAINTAINER nathan

ADD LocalMovies.war /opt/jboss/wildfly/standalone/deployments/localmovies.war
ADD standalone.xml /opt/jboss/wildfly/standalone/configuration/standalone.xml
ADD ssl-gen.sh /opt/jboss/wildfly/standalone/configuration/ssl-gen.sh
RUN /opt/jboss/wildfly/standalone/configuration/ssl-gen.sh

ADD keycloak-wildfly-adapter-dist-3.1.0.Final.tar.gz /opt/jboss/wildfly/
