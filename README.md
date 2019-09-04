# docker-netatalk

Dockerized minimal netatalk daemon service with authentication.

## Usage

- Replace all variables wrapped in % % to use following examples.
- %CONFIG_DIR% saves afp.conf, the container will generate a default config if it is not present.
- %DATA_DIR% maps to an AFP `/Share` shard.
- %TIMEMACHINE_DIR% maps to an AFP `/Time Machine` shard with time machine enabled.
- %USER% (default: afp) and %PASSWORD% (default: afp) specifies username and password when connecting to the afp server.
- %PUID% (default: 1000) specifies the uid and gid of the data owner.

### Docker Run

```
$ docker run -d --name afp \
    -p 548:548/tcp \
    -v %CONFIG_DIR%:/conf \
    -v %DATA_DIR%:/data \
    -v %TIMEMACHINE_DIR%:/timemachine \
    -e USER=%USER% \
    -e PASSWORD=%PASSWORD% \
    -e PUID=%PUID% \
  mushanyoung/netatalk:latest
```

### Docker Compose

```
services:
  afp:
    container_name: afp
    image: mushanyoung/netatalk:latest
    restart: unless-stopped
    network_mode: "bridge"
    ports:
      - "548:548/tcp"
    volumes:
      - /%CONFIG_DIR%:/conf
      - /%DATA_DIR%:/data
      - /%TIMEMACHINE_DIR%:/timemachine
    environment:
      USER: %USER%
      PASSWORD: %PASSWORD%
      PUID: %PUID%
```
