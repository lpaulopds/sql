#!/usr/bin/env bash

##
### Espera 20 segundos para executar binário sqlservr
##
sleep 20

##
### Inicia container
##
exec /opt/mssql/bin/sqlservr
