#!/usr/bin/env bash

# set -m
# /opt/mssql/bin/sqlservr & ./run-initialization.sh
# fg

##
### Espera carregamento do sistema
##
sleep 20

##
### Atualiza e instala apt packages
##
# apt-get update

##
### Inicia container
##
/opt/mssql/bin/sqlservr 
