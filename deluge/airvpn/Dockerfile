FROM ubuntu:20.04

RUN apt update &&\
    apt install wget curl iptables -y &&\
    wget https://airvpn.org/mirrors/eddie.website/repository/hummingbird/1.1.0/hummingbird-linux-x86_64-1.1.0.tar.gz &&\
    tar -zxvf hummingbird-linux-x86_64-1.1.0.tar.gz &&\
    rm -f hummingbird-linux-x86_64-1.1.0.tar.gz

ENTRYPOINT ./hummingbird-linux-x86_64-1.1.0/hummingbird /config.ovpn --network-lock off