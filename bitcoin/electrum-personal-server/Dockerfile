FROM ubuntu:20.04

RUN apt-get update && apt-get install wget python3-pip -y && mkdir /opt/eps

WORKDIR /opt/eps

RUN wget https://github.com/chris-belcher/electrum-personal-server/archive/eps-v0.2.1.1.tar.gz &&\
    tar -zxvf eps-v0.2.1.1.tar.gz &&\
    rm -f eps-v0.2.1.1.tar.gz &&\
    cd electrum-personal-server-eps-v0.2.1.1 &&\
    pip3 install --user .

ENV PATH="/root/.local/bin:${PATH}"

ENTRYPOINT sleep 5 && electrum-personal-server config.ini
