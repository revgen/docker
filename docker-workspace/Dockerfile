FROM rev9en/xwindow:1.0.0

LABEL image.version="1.0.0" \
      image.name="rev9en/workspace" \
      image.description="Virtual workspace" \
      image.date="2023-06-03" \
      maintainer="Evgen Rusakov" \
      url.docker="https://hub.docker.com/r/rev9en/workspace" \
      url.source="https://github.com/revgen/docker/docker-workspace"

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt update && \
    \
    apt install -y openssh-server elinks git tig p7zip-full jq mc htop && \
    \
    apt install -y firefox-esr keepassxc && \
    \
    apt clean && \
    rm -rf /var/cache/* /var/log/apt/* /var/lib/apt/lists/* && \
    rm -rf /tmp/* /var/tmp/* /var/log/* /var/cache/*

COPY root-fs/ /

RUN cat /etc/supervisor/conf.d/supervisord.conf.extra >> /etc/supervisor/conf.d/supervisord.conf && \
    rm -f /etc/supervisor/conf.d/supervisord.conf.extra && \
    mkdir -p /var/log/supervisor/ && \
    mkdir -p /run/sshd && \
    rsync -av /home/${MAINUSER}/ /home/${MAINUSER}.orig/ && \
    mv /entrypoint.sh /entrypoint.sh.orig && \
    grep -v "^exec" /entrypoint.sh.orig > /entrypoint.sh && \
    echo "rsync -av /home/${MAINUSER}.orig/ /home/${MAINUSER}/" >> /entrypoint.sh && \
    echo "chown ${MAINUSER}:${MAINUSER} -R /home/${MAINUSER}/" >> /entrypoint.sh && \
    rm -rf /var/run/dbus
    mkdir -p /var/run/dbus/
    exec /usr/bin/dbus-daemon --system &

    grep "^exec" /entrypoint.sh.orig >> /entrypoint.sh && \
    chmod +x /entrypoint.sh

EXPOSE 3389 22 80