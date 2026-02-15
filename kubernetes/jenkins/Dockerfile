FROM jenkins/inbound-agent:latest

USER root
RUN apt-get update && apt-get install apt-utils wget ffmpeg unzip curl -y
RUN curl -fsSL https://get.docker.com | sh
USER jenkins

RUN curl -LO https://dl.k8s.io/v1.34.1/bin/linux/386/kubectl && \
    chmod +x ./kubectl && \
    wget https://get.helm.sh/helm-v3.19.0-linux-amd64.tar.gz && \
    tar -zxvf helm-v3.19.0-linux-amd64.tar.gz && \
    rm -f helm-v3.19.0-linux-amd64.tar.gz && \
    mv ./kubectl ./linux-amd64/kubectl && \
    chmod +x ./linux-amd64/helm && \
    wget https://dl.google.com/android/repository/commandlinetools-linux-13114758_latest.zip && \
    unzip commandlinetools-linux-13114758_latest.zip &&\
    rm -f commandlinetools-linux-13114758_latest.zip &&\
    mkdir android-home &&\
    mv cmdline-tools/ ./android-home/tools &&\
    wget https://mirrors.ocf.berkeley.edu/apache//jmeter/binaries/apache-jmeter-5.6.3.tgz &&\
    tar -zxvf apache-jmeter-5.6.3.tgz &&\
    rm -f apache-jmeter-5.6.3.tgz &&\
    mkdir ./sops &&\
    curl -LO https://github.com/getsops/sops/releases/download/v3.11.0/sops-v3.11.0.linux.amd64 &&\
    mv sops-v3.11.0.linux.amd64 ./sops/sops  &&\
    chmod +x ./sops/sops

ENV SOPS_HOME=/home/jenkins/sops
ENV ANDROID_HOME=/home/jenkins/android-home
ENV SDK_MANAGER_ROOT=$ANDROID_HOME/tools
ENV PATH=/home/jenkins/linux-amd64:/home/jenkins/apache-jmeter-5.6.3/bin:$SDK_MANAGER_ROOT/bin:$SOPS_HOME:$PATH

RUN yes | sdkmanager --sdk_root=$SDK_MANAGER_ROOT --licenses &&\
    sdkmanager --sdk_root=$SDK_MANAGER_ROOT "platforms;android-29" "build-tools;29.0.3"

RUN mv $SDK_MANAGER_ROOT/licenses $ANDROID_HOME/licenses