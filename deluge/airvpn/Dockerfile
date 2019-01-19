FROM ubuntu:18.10

RUN apt-get update &&\
    apt-get install -y curl ssh net-tools sudo wget iproute2 iptables &&\
    wget -O eddie.tar.gz "https://airvpn.org/mirrors/eddie.website/download/?platform=linux&arch=x64&ui=cli&format=portable.tar.gz&version=2.16.3&r=0.4659868066822894" &&\
    tar -zxvf eddie.tar.gz &&\
    rm -f eddie.tar.gz &&\
    mv eddie-cli_2.16.3_linux_x64_portable /airvpn

WORKDIR /airvpn
ENTRYPOINT ./eddie-cli -login=$USERNAME -password=$PASSWORD -connect -netlock -dns.mode=none -ipv6.mode=none