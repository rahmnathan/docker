FROM jboss/keycloak

ADD standalone.xml /opt/jboss/keycloak/standalone/configuration/standalone.xml
ADD localmovies-realm.json /localmovies-realm.json

ENTRYPOINT /opt/jboss/keycloak/bin/standalone.sh -Dkeycloak.migration.action=import -Dkeycloak.migration.provider=singleFile -Dkeycloak.migration.file=/localmovies-realm.json -Dkeycloak.migration.strategy=OVERWRITE_EXISTING