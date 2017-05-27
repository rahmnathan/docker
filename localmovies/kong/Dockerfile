FROM kong:latest

MAINTAINER nathan

ENV KONG_DATABASE postgres
ENV KONG_PG_HOST postgres
ADD kong.conf /etc/kong/kong.conf
ADD my-cert.pem /etc/kong/my-cert.pem
ADD my-key.pem /etc/kong/my-key.pem
