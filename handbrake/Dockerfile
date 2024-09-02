FROM ubuntu:24.04

RUN apt-get update && \
    apt-get -y install apt-utils ffmpeg handbrake-cli software-properties-common wget tar && \
    apt-get clean

RUN groupadd handbrake && useradd handbrake -g handbrake

ENTRYPOINT [ "HandBrakeCLI" ]