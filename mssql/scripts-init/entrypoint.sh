#!/usr/bin/env bash

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
