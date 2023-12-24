#!/usr/bin/env bash

##
### Instala packages
##
# dnf install -y nano
# dnf install -y man-db.x86_64

##
### Inicia container
##
chmod 1770 /var/run/mysqld/
exec /usr/sbin/mysqld
