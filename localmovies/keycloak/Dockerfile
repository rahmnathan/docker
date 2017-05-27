FROM jboss/keycloak

MAINTAINER nathan

#ADD keystore.jks /opt/jboss/keycloak/standalone/configuration/keystore.jks
ADD standalone.xml /opt/jboss/keycloak/standalone/configuration/standalone.xml
ADD ssl-gen.sh /opt/jboss/keycloak/standalone/configuration/ssl-gen.sh
ADD localmovies-realm.json /localmovies-realm.json
RUN /opt/jboss/keycloak/standalone/configuration/ssl-gen.sh

ENTRYPOINT /opt/jboss/keycloak/bin/standalone.sh -Dkeycloak.migration.action=import -Dkeycloak.migration.provider=singleFile -Dkeycloak.migration.file=/localmovies-realm.json -Dkeycloak.migration.strategy=OVERWRITE_EXISTING
