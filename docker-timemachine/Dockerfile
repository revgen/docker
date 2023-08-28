FROM ubuntu:20.04

LABEL image.version="1.0.1" \
      image.name="rev9en/timemachine" \
      image.description="Docker image with timemachine (samba version)" \
      image.date="2023-02-26" \
      maintainer="Evgen Rusakov" \
      url.docker="https://hub.docker.com/r/rev9en/timemachine" \
      url.source="https://github.com/revgen/docker/docker-timemachine"

ENV PGID=0 \
    PUID=0 \
    SMB_NAME='Time Machine Server' \
    SMB_USER=tm_user \
    SMB_PASSWORD=secret \
    SMB_MAX_SIZE_MB=0 \
    SMB_PORTS=445

COPY root-fs/ /

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y gettext-base samba avahi-daemon supervisor vim-tiny && \
    \
    mkdir -p /var/log/supervisor && \
    \
    apt autoremove -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

VOLUME ["/share"]

EXPOSE 445 5353

CMD ["/start-timemachine.sh"]
