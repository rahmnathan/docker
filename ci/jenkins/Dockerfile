FROM jenkins/jenkins:lts

USER root

RUN mkdir /etc/android-sdk 
WORKDIR /etc/android-sdk
RUN wget https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip && \ 
    unzip sdk-tools-linux-3859397.zip && \
    rm -f sdk-tools-linux-3859397.zip

ENV ANDROID_HOME /etc/android-sdk/tools

RUN yes | $ANDROID_HOME/bin/sdkmanager --licenses
