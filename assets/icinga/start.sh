#!/bin/bash

# http password
/usr/bin/htpasswd -c -b /etc/icinga/htpasswd.users "$ICINGA_ADMIN_USER" "$ICINGA_ADMIN_PASS"
/bin/sed -i "s/icingaadmin/$ICINGA_ADMIN_USER/g" /etc/icinga/cgi.cfg

# main process
/usr/sbin/icinga /etc/icinga/icinga.cfg

