FROM debian:stable-slim

RUN apt-get update &&\
    apt-get install apt-utils wget iptables -y &&\
    wget https://gitlab.com/AirVPN/hummingbird/-/raw/master/binary/hummingbird-linux-x86_64-1.1.0.tar.gz &&\
    tar -zxvf hummingbird-linux-x86_64-1.1.0.tar.gz &&\
    rm -f hummingbird-linux-x86_64-1.1.0.tar.gz

COPY entrypoint.sh ./entrypoint.sh

ENTRYPOINT ./entrypoint.sh