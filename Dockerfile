
FROM debian:jessie

MAINTAINER Rafa Couto <caligari@treboada.net> 

EXPOSE 80

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -qy --no-install-recommends \
        supervisor \
        icinga \
        nagios-nrpe-plugin \
        apache2 \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /etc/icinga

ENV ICINGA_ADMIN_PASS="admin-pass"

ADD assets/etc_icinga /etc/icinga
ADD assets/supervisor /opt/supervisor
ADD assets/icinga /opt/icinga

VOLUME /etc/icinga /var/lib/icinga

CMD ["/usr/bin/python", "/usr/bin/supervisord", "--configuration=/opt/supervisor/supervisord.conf"]

