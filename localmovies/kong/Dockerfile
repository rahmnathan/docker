FROM kong:latest

MAINTAINER nathan

ADD kong.conf /etc/kong/kong.conf
ADD my-cert.pem /etc/kong/my-cert.pem
ADD my-key.pem /etc/kong/my-key.pem
ADD kong-entry.sh /etc/kong/kong-entry.sh

ENTRYPOINT /etc/kong/kong-entry.sh
