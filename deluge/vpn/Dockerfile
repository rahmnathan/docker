FROM debian:jessie-slim

MAINTAINER nathan

RUN apt-get update &&\
    apt-get install -y curl ssh net-tools sudo wget &&\
    wget -O eddie.tar.gz "https://eddie.website/download/?platform=linux&arch=x64&ui=cli&format=portable.tar.gz&version=2.12.4&r=0.4036926314049216" &&\
    tar -zxvf eddie.tar.gz &&\
    rm -f eddie.tar.gz &&\
    mv eddie-cli_2.12.4_linux_x64_portable /vpn

ADD vpn-entry.sh /vpn-entry.sh

ENTRYPOINT /vpn-entry.sh -s
