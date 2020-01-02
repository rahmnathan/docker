FROM ubuntu:19.04

RUN apt update &&\
    apt install wget -y &&\
    wget https://eddie.website/repository/eddie/hummingbird-1.0/hummingbird-linux-x86_64-1.0.tar.gz &&\
    tar -zxvf hummingbird-linux-x86_64-1.0.tar.gz &&\
    rm -f hummingbird-linux-x86_64-1.0.tar.gz

ENTRYPOINT ./hummingbird-linux-x86_64-1.0/hummingbird /config.ovpn