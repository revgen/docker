FROM nextcloud:25-apache

LABEL image.version="1.0.5" \
      image.name="rev9en/nextcloud" \
      image.description="Docker image with Nextcloud" \
      image.date="2023-05-20" \
      maintainer="Evgen Rusakov" \
      url.docker="https://hub.docker.com/r/rev9en/nextcloud" \
      url.source="https://github.com/revgen/docker/docker-nextcloud"

COPY entrypoint2.sh /

ENTRYPOINT ["/entrypoint2.sh"]
CMD ["apache2-foreground"]
