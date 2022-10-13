FROM ubuntu:20.04

LABEL image.version="1.0.0" \
      image.name="rev9en/minecraft" \
      image.description="Docker image with Minecraft Server Java Edition" \
      image.date="2021-05-17" \
      maintainer="Evgen Rusakov" \
      url.docker="https://hub.docker.com/r/rev9en/minecraft" \
      url.source="https://github.com/revgen/docker/docker-minecraft"

ARG MINECRAFT_USER=mcuser
ARG MINECRAFT_PASS=mcuser
ARG MINECRAFT_DIR=/opt/minecraft-server
ARG MINECRAFT_MEMORY=2G

ENV DEBIAN_FRONTEND noninteractive
ENV MINECRAFT_USER ${MINECRAFT_USER}
ENV MINECRAFT_PASS ${MINECRAFT_PASS}
ENV MINECRAFT_DIR ${MINECRAFT_DIR}
ENV MINECRAFT_MEMORY ${MINECRAFT_MEMORY}

#    && apt-get install -y openjdk-11-jre-headless \
RUN apt-get update \
    && apt-get install -y openssh-server supervisor sudo \
    && apt-get install -y default-jre \
    && apt-get install -y python3-pip vim.tiny mc \
    && ln -sfv /usr/bin/vim.tiny /usr/bin/vim \
    && apt-get install htop telnet \
    && pip3 install mcstatus \
    && sudo apt purge -y python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash -G sudo ${MINECRAFT_USER} \
    && echo "${MINECRAFT_USER}:${MINECRAFT_PASS}" | chpasswd \
    && mkdir ${MINECRAFT_DIR} \
    && chown ${MINECRAFT_USER}:${MINECRAFT_USER} ${MINECRAFT_DIR} \
    && chmod 0775 ${MINECRAFT_DIR}

RUN mkdir -p /var/run/sshd /var/log/supervisor /var/log/minecraft-status \
    && sed -i 's/PermitRootLogin without-password/PermitRootLogin no/' /etc/ssh/sshd_config \
    && echo "JAVA_HOME=/usr" >> /etc/environment \
    && echo "EULA=true" >> /etc/environment \
    && echo "MINECRAFT_DIR=${MINECRAFT_DIR}" >> /etc/environment \
    && echo "MINECRAFT_USER=${MINECRAFT_USER}" >> /etc/environment \
    && echo "MINECRAFT_MEMORY=${MINECRAFT_MEMORY}" >> /etc/environment \
    && echo "MINECRAFT_PORT=25565" >> /etc/environment
    


COPY root-fs/ /

EXPOSE 22 80 25565

CMD ["/entrypoint.sh"]

