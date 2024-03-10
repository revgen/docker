FROM alpine:3.19 AS base

LABEL image.version="1.0.0" \
      image.name="rev9en/hugo" \
      image.description="Hugo in doker container" \
      image.date="2024-03-10" \
      maintainer="Evgen Rusakov" \
      url.docker="https://hub.docker.com/r/rev9en/hugo" \
      url.source="https://github.com/revgen/docker/docker-hugo"

RUN apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community hugo

WORKDIR /site

ENTRYPOINT [ "hugo" ]
