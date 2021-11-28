#!/bin/bash
#This finds the internal DNS IP and attempts to ping it.
#The implementation is a bit silly, but it works without curl
#interval must be longer than the timeout declared by the healthcheck invocation
ping -i 10 -c 1 $(grep -Eo "(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)" /etc/resolv.conf)
