#!/usr/bin/env bash

#### Iniciando com Oracle Database 19c
#### Execute o sqlplus com o usuário oracle
##   $ su oracle

#### Conecte ao database com nolog 
##   $ $ORACLE_HOME/bin/sqlplus /nolog

#### Conecte ao banco com o usuário sysdba como alias
##   $ connect / as sysdba
##   $ connect sys/sys as sysdba

#### Inicia o database
##   $ startup
##   $ shutdown abort

## $ show pdbs
## $ lsnrctl status


cp /home/oracle/sql/*.ora $ORACLE_HOME/network/admin/samples
chown oracle:oinstall $ORACLE_HOME/network/admin/samples/*.ora

##
### Inicia container
##
exec /usr/sbin/init
