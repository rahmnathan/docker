#!/bin/bash

touch ./airvpn_log
./hummingbird-linux-x86_64-1.0.2/hummingbird /config.ovpn -N off &> airvpn_log &

sleep 20

echo "nameserver $(grep -oP "(?<=\[DNS\]\s\[)[\d\.]*" airvpn_log)" > /etc/resolv.conf
echo "nameserver $(grep -oP "(?<=\[DNS6\]\s\[)[a-zA-Z\d\:]*" airvpn_log)" >> /etc/resolv.conf

tail -f -n 1000 airvpn_log
