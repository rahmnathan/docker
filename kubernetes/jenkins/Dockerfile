FROM jenkins/inbound-agent:latest

USER root
RUN apt-get update && apt-get install wget ffmpeg unzip curl -y
RUN curl -fsSL https://get.docker.com | sh
USER jenkins

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.18.3/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    wget https://get.helm.sh/helm-v3.3.0-linux-amd64.tar.gz && \
    tar -zxvf helm-v3.3.0-linux-amd64.tar.gz && \
    rm -f helm-v3.3.0-linux-amd64.tar.gz && \
    mv ./kubectl ./linux-amd64/kubectl && \
    chmod +x ./linux-amd64/helm && \
    wget https://dl.google.com/android/repository/commandlinetools-linux-6200805_latest.zip && \
    unzip commandlinetools-linux-6200805_latest.zip &&\
    rm -f commandlinetools-linux-6200805_latest.zip &&\
    mkdir android-home &&\
    mv tools/ ./android-home/tools &&\
    wget https://mirrors.ocf.berkeley.edu/apache//jmeter/binaries/apache-jmeter-5.6.3.tgz &&\
    tar -zxvf apache-jmeter-5.6.3.tgz &&\
    rm -f apache-jmeter-5.6.3.tgz

ENV ANDROID_HOME=/home/jenkins/android-home
ENV SDK_MANAGER_ROOT=$ANDROID_HOME/tools
ENV PATH=/home/jenkins/linux-amd64/:/home/jenkins/apache-jmeter-5.6.3/bin/:$SDK_MANAGER_ROOT/bin:$PATH

RUN yes | sdkmanager --sdk_root=$SDK_MANAGER_ROOT --licenses &&\
    sdkmanager --sdk_root=$SDK_MANAGER_ROOT "platforms;android-29" "build-tools;29.0.3"

RUN mv $SDK_MANAGER_ROOT/licenses $ANDROID_HOME/licenses