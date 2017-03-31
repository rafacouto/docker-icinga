
FROM debian:jessie

MAINTAINER Rafa Couto <caligari@treboada.net> 

EXPOSE 80

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -qy --no-install-recommends \
        supervisor \
        icinga \
        nagios-nrpe-plugin \
        apache2 \
    && rm -rf /var/lib/apt/lists/*

ENV ICINGA_ADMIN_USER="admin" ICINGA_ADMIN_PASS="admin-pass"

COPY assets/supervisor /opt/supervisor
COPY assets/icinga /opt/icinga

VOLUME ["/etc/icinga/config", "/var/lib/icinga", "/var/cache/icinga"]

CMD ["/usr/bin/python", "/usr/bin/supervisord", "--configuration=/opt/supervisor/supervisord.conf"]

