# [docker-minecraft](https://github.com/revgen/docker/docker-minecraft/)

Docker image with [Minecraft Server Java Edition](https://www.minecraft.net/en-us/download/server).


The image is currently available on [hub.docker.com](https://hub.docker.com/r/rev9en/minecraft/) and contains:
* Ubuntu 20.04
* Latest Java for Ubuntu 20.04
* Minecraft Server Java Edition
* Small Web Http Api Server to provide server status.

## Usage


### Prepeare a working directory

You need to create/use a working directory where the server will be storing all files.

Example of this directory:
```
./minecraft-server
├── banned-ips.json
├── banned-players.json
├── eula.txt
├── home
├── logs
├── ops.json
├── server.jar
├── server.properties
├── supervisord.log
├── usercache.json
├── whitelist.json
└── world
```

> Note: if your directory is empty, a latest server.jar file will be downloaded from the mojang.com site.

### Manage a docker container

#### Launch a container as a service

```bash
docker run -d --restart always --name minecraft  \
    --cpus=2 --memory=5G --memory-swap=7G \
    -v "<minecraft working directory>:/opt/minecraft-server" \
    -e MINECRAFT_MEMORY_INIT=2G \
    -e MINECRAFT_MEMORY=4G \
    -e TZ=America/New_York \
    -p 25580:80 -p 25522:22 -p 25565:25565 \
    rev9en/minecraft || exit 1
```

After the launch you can:
* connect into the docker container using ssh: ```ssh mcuser@server-address -p 25522``` (default password: mcuser)
* see current status of the server in your browser: http://server-address:25580
* connect to the Minecraft server on the default port 25565

> Example output from the web server:
```json
{
  "name": "minecraft server status",
  "status": "OK",
  "address": "localhost:25565",
  "ip": "172.10.10.10",
  "version": "1.16.5",
  "description": "Hardcore Server",
  "external_ip": "172.10.10.10",
  "external_port_open": true,
  "players_count": 2,
  "players_max": 10,
  "latency": 5.8,
  "ping": 2.018
}
```

#### Stop a container
```bash
docker stop minecraft
```

#### See the logs
```bash
docker logs minecraft - f
```
