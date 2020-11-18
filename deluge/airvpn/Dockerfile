FROM ubuntu:20.10

RUN apt update &&\
    apt install wget iptables -y &&\
    wget https://airvpn.org/mirrors/eddie.website/repository/hummingbird/1.0.2/hummingbird-linux-x86_64-1.0.2.tar.gz &&\
    tar -zxvf hummingbird-linux-x86_64-1.0.2.tar.gz &&\
    rm -f hummingbird-linux-x86_64-1.0.2.tar.gz

COPY entrypoint.sh ./entrypoint.sh

ENTRYPOINT ./entrypoint.sh