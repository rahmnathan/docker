FROM jenkins/jnlp-slave:3.27-1

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.16.3/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    wget https://get.helm.sh/helm-v2.15.2-linux-amd64.tar.gz && \
    tar -zxvf helm-v2.15.2-linux-amd64.tar.gz && \
    rm -f helm-v2.15.2-linux-amd64.tar.gz && \
    mv ./kubectl ./linux-amd64/kubectl && \
    chmod +x ./linux-amd64/helm

ENV PATH /home/jenkins/linux-amd64/:$PATH