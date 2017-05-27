#!/usr/bin/env bash

keytool -genkey -keyalg RSA -dname "cn=Nathan Rahm, ou=localmovies, o=localmovies, c=US" -alias selfsigned -keystore /opt/jboss/keycloak/standalone/configuration/keystore.jks -storepass changeit -validity 360 -keysize 2048 -keypass changeit
