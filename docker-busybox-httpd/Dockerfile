FROM alpine:3.8

LABEL image.version="1.0.0" \
      image.name="rev9en/busybox-httpd" \
      image.description="Docker image with Busybox httpd" \
      image.date="2024-02-16" \
      maintainer="Evgen Rusakov" \
      url.docker="https://hub.docker.com/r/rev9en/busybox-httpd" \
      url.source="https://github.com/revgen/docker/docker-busybox-httpd"

RUN apk add --no-cache tini busybox-extras

COPY root-fs/ /

EXPOSE 80

WORKDIR /var/www/html

ENTRYPOINT ["/sbin/tini", "-g", "--"]
CMD [ "httpd", "-f", "-h", "/var/www/html", "-p", "80", "-c", "/etc/httpd.conf" ]

HEALTHCHECK --interval=5s --timeout=1500ms --start-period=10s --retries=3 CMD ["/docker-healthcheck.sh"]
