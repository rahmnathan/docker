#!/bin/sh

kong migrations up -c /etc/kong/kong.conf

kong start -c /etc/kong/kong.conf

tail -F /usr/local/kong/logs/*.log
