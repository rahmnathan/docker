#!/bin/bash

rm /etc/airvpn/hummingbird.lock
/usr/bin/hummingbird --recover-network &> /dev/null

touch ./airvpn_log
/usr/bin/hummingbird -p tcp --persist-tun --network-lock off /config.ovpn &> airvpn_log &

sleep 3

echo "nameserver $(grep -oP "(?<=\[DNS\]\s\[)[\d\.]*" airvpn_log)" > /etc/resolv.conf
echo "nameserver $(grep -oP "(?<=\[DNS6\]\s\[)[a-zA-Z\d\:]*" airvpn_log)" >> /etc/resolv.conf

tail -f -n 1000 airvpn_log
