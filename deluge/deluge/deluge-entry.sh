#!/usr/bin/env bash

deluged
sleep 5
deluge-console "config -s allow_remote True"
deluge-console "config allow_remote"
pkill deluged 
deluged
deluge-web
tail -f /dev/null
