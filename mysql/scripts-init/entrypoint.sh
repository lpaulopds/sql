#!/usr/bin/env bash

##
### Permissão padrão
##
chown -R mysql:mysql /var/lib/mysql

##
### Inicia container
##
exec /usr/sbin/mysqld
