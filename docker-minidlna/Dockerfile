FROM alpine:3.8

LABEL image.version="1.0.1" \
      image.name="rev9en/minidlna" \
      image.description="Docker image with minidlna" \
      image.date="2019-03-23" \
      maintainer="Evgen Rusakov" \
      url.docker="https://hub.docker.com/r/rev9en/minidlna" \
      url.source="https://github.com/revgen/docker/docker-minidlna"

RUN apk --no-cache add minidlna && \
    mkdir -p /media/Music && \
    mkdir -p /media/Pictures && \
    mkdir -p /media/Video && \
    mkdir -p /media/Downloads

COPY root-fs/ /

EXPOSE 1900/udp
EXPOSE 8200

ENTRYPOINT ["/usr/sbin/minidlnad", "-S"]
