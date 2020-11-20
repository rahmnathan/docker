FROM ubuntu:20.10

RUN apt update &&\
    apt install wget iptables -y &&\
    wget https://gitlab.com/AirVPN/hummingbird/-/raw/master/binary/hummingbird-linux-x86_64-1.1.0.tar.gz &&\
    tar -zxvf hummingbird-linux-x86_64-1.1.0.tar.gz &&\
    rm -f hummingbird-linux-x86_64-1.1.0.tar.gz

COPY entrypoint.sh ./entrypoint.sh

ENTRYPOINT ./entrypoint.sh