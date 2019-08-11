FROM ubuntu:19.04

RUN apt-get update &&\
    apt-get install -y software-properties-common &&\
    add-apt-repository ppa:deluge-team/stable &&\
    apt-get update &&\
    apt-get install -y deluged deluge-console deluge-web &&\
    deluged &&\
    pkill deluged

ADD auth /root/.config/deluge/auth
ADD deluge-entry.sh /deluge-entry.sh

EXPOSE 58846

ENTRYPOINT /deluge-entry.sh
