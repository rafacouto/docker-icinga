# docker-icinga

Icinga is an open source computer system and network monitoring application.

## Get the docker image

### Pull a pre-built image

    docker pull caligari/icinga:latest

Available [image tags here](https://hub.docker.com/r/caligari/icinga/tags/).


### From Dockerfile

    git clone git@github.com:rafacouto/docker-icinga.git
    docker build -t caligari/icinga:latest ./docker-icinga

## Usage

Start Icinga app and access via web interface with user _icingaadmin_ and password _mySecret_:

    docker run -d -p 80:80 -e ICINGA_ADMIN_PASS="mySecret" \
        caligari/icinga


## Docker variables

    docker run \
        -e ICINGA_ADMIN_PASS="changeMe!" \
        caligari/icinga

- __ICINGA_ADMIN_PASS__ Password to use the web interface.


## Docker volumes

- __/etc/icinga__ Icinga configuration. Refer to [Icinga manual](https://docs.icinga.com/latest/en/ch03.html) to setup.
- __/var/lib/icinga__ Icinga state file, cluster log, local CA and configuration files (cluster, api).
- __/var/cache/icinga__ status.dat/objects.cache, icinga2.debug files.

