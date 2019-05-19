FROM ubuntu:19.04

RUN apt-get update &&\
    apt-get install -y curl ssh gnupg2 apt-utils net-tools sudo wget iproute2 iptables &&\
    wget -qO - https://eddie.website/repository/keys/eddie_maintainer_gpg.key|sudo apt-key add - &&\
    echo -n deb http://eddie.website/repository/apt stable main >> /etc/apt/sources.list &&\
    apt-get update &&\
    DEBIAN_FRONTEND=noninteractive apt-get install eddie-ui -y

ENTRYPOINT eddie-ui -cli -login=$USERNAME -password=$PASSWORD -connect -netlock -dns.mode=none -ipv6.mode=none