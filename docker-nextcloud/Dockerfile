FROM nextcloud:25-apache

LABEL image.version="1.0.8" \
      image.name="rev9en/nextcloud" \
      image.description="Docker image with Nextcloud" \
      image.date="2023-05-20" \
      maintainer="Evgen Rusakov" \
      url.docker="https://hub.docker.com/r/rev9en/nextcloud" \
      url.source="https://github.com/revgen/docker/docker-nextcloud"

COPY entrypoint_ext.sh /tmp/

RUN mv /entrypoint.sh /entrypoint.sh.orig && \
      head -n 1 /entrypoint.sh.orig > /entrypoint.sh && \
      grep -v '^#!' /tmp/entrypoint_ext.sh >> /entrypoint.sh && \
      sed 's/rsync /rsync -v /g' /entrypoint.sh.orig | tail -n +2 >> /entrypoint.sh && \
      chmod +x /entrypoint.sh && \
      rm -f /tmp/entrypoint_ext.sh && \
      \
      echo '#!/bin/sh' > /usr/local/bin/nextcloud-cli && \
      echo 'runuser -u www-data -- '/var/www/html/occ' "${@}"' >> /usr/local/bin/nextcloud-cli && \
      chmod +x /usr/local/bin/nextcloud-cli && \
      ln -s /usr/local/bin/nextcloud-cli /usr/local/bin/nextcloud
