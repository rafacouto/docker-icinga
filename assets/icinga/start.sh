#!/bin/bash

# http password
echo "$ICINGA_ADMIN_PASS" | \
    /usr/bin/htpasswd -i /etc/icinga/htpasswd.users icingaadmin

# main process
/usr/sbin/icinga /etc/icinga/icinga.cfg

