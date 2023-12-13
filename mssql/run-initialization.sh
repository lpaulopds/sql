#!/usr/bin/env bash
sleep 20
apt-get update

##
### Executa queries no container
##
# /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P password123! -i init.sql
