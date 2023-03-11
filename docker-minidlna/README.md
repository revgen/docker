# [docker-minidlna][github-repo]

[![Build Docker Image](https://github.com/revgen/docker/actions/workflows/docker-minidlna.yml/badge.svg)](https://github.com/revgen/docker/actions/workflows/docker-minidlna.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Repository contains source code and data for Docker Image with [minidlna][minidlna-site].

The image is currently available on [hub.docker.com][minidlna-hub].

## Usage

Launch docker container with minidlna:
```bash
docker run -d -p 1883:1883 -p 1900:1900/udp --net=host --restart always \
    -v /mnt/media-storage/Video:/media/Videos \
    -v /mnt/media-storage/Images:/media/Pictures \
    -v /mnt/media-storage/Music:/media/Music \
    -v /mnt/media-storage/Downloads:/media/Downloads \
    --name=minidlna rev9en/minidlna
```

See all logs:
```bash
docker logs minidlna -f
```


[minidlna-site]: https://help.ubuntu.com/community/MiniDLNA
[minidlna-hub]: https://hub.docker.com/r/rev9en/minidlna/
[github-repo]: https://github.com/revgen/docker/tree/master/docker-minidlna/
