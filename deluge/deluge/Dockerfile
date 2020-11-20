FROM ubuntu:20.10

RUN apt-get update &&\
    apt-get install -y software-properties-common &&\
    add-apt-repository ppa:deluge-team/stable &&\
    apt-get update &&\
    apt-get install -y deluged deluge-console deluge-web &&\
    deluged &&\
    pkill deluged

ADD deluge-entry.sh /deluge-entry.sh

ENTRYPOINT /deluge-entry.sh
