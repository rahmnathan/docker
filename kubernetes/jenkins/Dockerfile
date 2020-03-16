FROM jenkins/jnlp-slave:4.0.1-1

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.16.3/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    wget https://get.helm.sh/helm-v2.15.2-linux-amd64.tar.gz && \
    tar -zxvf helm-v2.15.2-linux-amd64.tar.gz && \
    rm -f helm-v2.15.2-linux-amd64.tar.gz && \
    mv ./kubectl ./linux-amd64/kubectl && \
    chmod +x ./linux-amd64/helm && \
    wget https://dl.google.com/android/repository/commandlinetools-linux-6200805_latest.zip && \
    unzip commandlinetools-linux-6200805_latest.zip &&\
    rm -f commandlinetools-linux-6200805_latest.zip &&\
    mkdir android-home &&\
    mv tools/ ./android-home/tools

ENV ANDROID_HOME /home/jenkins/android-home
ENV SDK_MANAGER_ROOT $ANDROID_HOME/tools
ENV PATH /home/jenkins/linux-amd64/:$SDK_MANAGER_ROOT/bin:$PATH

RUN yes | sdkmanager --sdk_root=$SDK_MANAGER_ROOT --licenses &&\
    sdkmanager --sdk_root=$SDK_MANAGER_ROOT "platforms;android-29" "build-tools;29.0.3"

RUN mv $SDK_MANAGER_ROOT/licenses $ANDROID_HOME/licenses