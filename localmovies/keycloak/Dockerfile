FROM jboss/keycloak

MAINTAINER nathan

ADD keystore.jks /opt/jboss/keycloak/standalone/configuration/keystore.jks
ADD standalone.xml /opt/jboss/keycloak/standalone/configuration/standalone.xml
ADD export.json /export.json

ENTRYPOINT /opt/jboss/keycloak/bin/standalone.sh -Dkeycloak.migration.action=import -Dkeycloak.migration.provider=singleFile -Dkeycloak.migration.file=/export.json -Dkeycloak.migration.strategy=OVERWRITE_EXISTING
