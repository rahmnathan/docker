FROM debian:stable-slim
ENV TINI_VERSION v0.19.0
RUN set -eux; \
    dpkgArch="$(dpkg --print-architecture)"; \
    case "${dpkgArch##*-}" in \
        "amd64") tiniArch="tini-static-$dpkgArch"; hbrdArch="x86_64";;\
	      "arm64") tiniArch="tini-static-$dpkgArch"; hbrdArch="aarch64";;\
        "armhf") tiniArch="tini-static-$dpkgArch"; hbrdArch="armv7l";;\
        *) echo >&2 "tini-static does not support ${dpkgArch}"; exit 1 ;; \
    esac; \
    apt-get update &&\
    apt-get install apt-utils wget iptables -y &&\
    wget https://gitlab.com/AirVPN/AirVPN-Suite/-/raw/master/binary/AirVPN-Suite-$hbrdArch-1.1.0.tar.gz &&\
    tar -zxvf AirVPN-Suite-$hbrdArch-1.1.0.tar.gz &&\
    mv /AirVPN-Suite/bin/hummingbird /usr/bin/hummingbird &&\
    rm -f AirVPN-Suite-$hbrdArch-1.1.0.tar.gz &&\
    rm -r /AirVPN-Suite &&\
    wget -O /tini "https://github.com/krallin/tini/releases/download/$TINI_VERSION/$tiniArch" &&\
    chmod +x /tini



COPY entrypoint.sh /entrypoint.sh
COPY healthcheck.sh /healthcheck.sh

HEALTHCHECK --interval=5s --timeout=1s --start-period=5s \
    CMD /healthcheck.sh

ENTRYPOINT ["/tini", "--", "/entrypoint.sh"]
