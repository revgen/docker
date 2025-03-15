FROM alpine:3.20.6

ARG NAME="smtprelayserver"
ARG VERSION="0.0.1"

LABEL version="${VERSION}"
LABEL description="Simple smtp relay server"
LABEL created="2025-01-13"
LABEL maintainer="Evgen Rusakov"
LABEL url.docker="https://hub.docker.com/r/rev9en/smtprelayserver"
LABEL url.source="https://github.com/revgen/docker/docker-smtprelayserver"

RUN \
    apk add --no-cache postfix cyrus-sasl cyrus-sasl-login cyrus-sasl-crammd5 && \
    postconf -ev 'inet_interfaces = all' && \
    postconf -ev 'mydestination = localhost' && \
    postconf -ev 'myorigin = $mydomain' && \
    postconf -ev 'smtp_host_lookup = native,dns' && \
    postconf -ev 'smtp_use_tls = yes' && \
    postconf -ev 'maillog_file = /dev/stdout' && \
    postconf -Mv "postlog/unix-dgram=postlog   unix-dgram n  -       n       -       1       postlogd" && \
    newaliases

COPY entrypoint.sh /

EXPOSE 25
ENTRYPOINT [ "/entrypoint.sh" ]