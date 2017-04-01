#!/bin/bash

# http password
/usr/bin/htpasswd -c -b /etc/icinga/htpasswd.users "$ICINGA_ADMIN_USER" "$ICINGA_ADMIN_PASS"
/bin/sed -i "s/icingaadmin/$ICINGA_ADMIN_USER/g" /etc/icinga/cgi.cfg

# spool directory
if [ ! -d /var/lib/icinga/spool/checkresults ] ; then
  mkdir -p /var/lib/icinga/spool/checkresults
  chown -R nagios /var/lib/icinga
  chown -R nagios /var/cache/icinga
fi

# main process
/usr/sbin/icinga /etc/icinga/icinga.cfg

