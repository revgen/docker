FROM debian:bullseye

LABEL image.version="1.0.0" \
      image.name="rev9en/xwindow" \
      image.description="Docker image with xwindow setup and rdp access" \
      image.date="2023-06-03" \
      maintainer="Evgen Rusakov" \
      url.docker="https://hub.docker.com/r/rev9en/xwindow" \
      url.source="https://github.com/revgen/docker/docker-xwindow"

ARG MAINUSER=dev
ENV MAINUSER=${MAINUSER}

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt update && \
    \
    apt install -y supervisor procps bash-completion curl wget rsync sudo vim-tiny && \
    ln -s $(which vim.tiny) /usr/bin/vim && \
    \
    apt install -y locales && \
    sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen && \
    locale-gen && \
    echo "export LC_ALL=\"en_US.UTF-8\"" >> /etc/profile && \
    echo "export LANG=\"en_US.UTF-8\"" >> /etc/profile && \
    echo "export LANGUAGE=\"en_US.UTF-8\"" >> /etc/profile && \
    \
    apt install -y fluxbox wmctrl xdotool xvfb x11-xserver-utils xxkb && \
    apt install -y xrdp && \
    \
    echo "====[ Clean unused resources ]====" && \
    apt purge -y xfonts-75dpi && \
    apt purge -y xfonts-100dpi && \
    \
    ls /usr/share/i18n/locales/ | grep -v "_[A-Z][A-Z]$" | \
        while read file; do rm -rf "/usr/share/i18n/locales/${file}"; done &&  \
    \
    rm -rf /usr/share/yudit && \
    rm -rf /usr/share/doc/* && \
    rm -rf /usr/share/man/* && \
    find /usr/share/locale -type d -maxdepth 1 -mindepth 1 ! -iname "en" -exec rm -rf "{}" \; && \
    find /usr/share/icons/ -mindepth 1 -maxdepth 1 ! -iname "default" -exec rm -rf "{}" \; && \
    find /usr/share/fonts/X11/misc/ -iname "*iso*.pcf.gz" -exec sudo rm -f '{}' \; &&  \
    find /usr/share/fonts/X11/misc/ -iname "*ja.pcf.gz" -exec sudo rm -f '{}' \; &&  \
    find /usr/share/fonts/X11/misc/ -iname "*ko.pcf.gz" -exec sudo rm -f '{}' \; &&  \
    find /usr/share/fonts/X11/misc/ -iname "*koi8*.pcf.gz" -exec sudo rm -f '{}' \; &&  \
    find /usr/share/fonts/X11/misc/ ! -iname "*x*.pcf.gz" -and ! -name "*unicode*.pcf.gz" \
        -and -iname "*.gz" -exec sudo rm -f "{}" \; &&  \
    \
    apt clean && \
    rm -rf /var/cache/* /var/log/apt/* /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/log/*

COPY root-fs/ /

RUN useradd -m -s /bin/bash ${MAINUSER} &&\
    mkdir -p /home/${MAINUSER} &&\
    chown ${MAINUSER}:${MAINUSER} /home/${MAINUSER} && \
    echo "${MAINUSER}:${MAINUSER}1234" | chpasswd && \
    echo "${MAINUSER}            ALL = (ALL) NOPASSWD: ALL" > /etc/sudoers.d/nopwsudo && \
    \
    mkdir -p /home/${MAINUSER}/.fluxbox/ && \
    mkdir -p /home/${MAINUSER}/.local/bin && \
    \
    rsync -av /home/default/ "/home/${MAINUSER}/" && \
    \
    cp -v /etc/X11/fluxbox/keys /home/${MAINUSER}/.fluxbox/keys && \
    cat "/home/${MAINUSER}/.fluxbox/keys.extra" >> /home/${MAINUSER}/.fluxbox/keys && \
    rm -f "/home/${MAINUSER}/.fluxbox/keys.extra" && \
    \
    cat "/home/${MAINUSER}/.bashrc.extra" >> /home/${MAINUSER}/.bashrc && \
    rm -f "/home/${MAINUSER}/.bashrc.extra" && \
    \
    chmod +x /home/${MAINUSER}/.fluxbox/startup && \
    chown "${MAINUSER}:${MAINUSER}" -R "/home/${MAINUSER}" && \
    \
    groupmod -g 220 dialout

EXPOSE 5900 3389

ENTRYPOINT ["/entrypoint.sh"]
