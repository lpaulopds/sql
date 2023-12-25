#!/usr/bin/env bash

##
### Permissão padrão
##
chmod 1770 /var/run/mysqld/

##
### Inicia container
##
exec /usr/sbin/mysqld
