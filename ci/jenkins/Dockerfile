FROM jenkins/jenkins:lts

USER root

RUN mkdir /etc/android-sdk 
WORKDIR /etc/android-sdk
RUN wget https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip && \ 
    unzip sdk-tools-linux-3859397.zip && \
    rm -f sdk-tools-linux-3859397.zip

ENV ANDROID_HOME /etc/android-sdk/tools

# Add license files from your local installation
ADD android-sdk-preview-license $ANDROID_HOME/licenses/android-sdk-preview-license
ADD android-sdk-license $ANDROID_HOME/licenses/android-sdk-license
