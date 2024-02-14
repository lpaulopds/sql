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
##   $ shutdown abort
##   $ startup
##   $ show con_name
##   $ show parameter

## $ show pdbs
## $ lsnrctl status
## $ SELECT name FROM v$controlfile;
## $ SELECT instance_name, status FROM v$instance;

#### Location startup logs
## $ORACLE_HOME/diag/rdbms/orcl/ORCL/trace/alert_ORCL.log
## $ cat /opt/oracle/cfgtoollogs/dbca/trace.log_2024-02-13_03-10-54AM | grep "Could not" | more
## $ ls /opt/oracle/oraInventory/logs

#### Configure default database
## /etc/init.d/oracledb_ORCLCDB-19c configure


cp /home/oracle/sql/listener.ora $ORACLE_HOME/network/admin/samples/
cp /home/oracle/sql/tnsnames.ora $ORACLE_HOME/network/admin/samples/
cp /home/oracle/sql/sqlnet.ora $ORACLE_HOME/network/admin/samples/
cp /home/oracle/sql/initORCL.ora $ORACLE_HOME/dbs/

chown oracle:oinstall $ORACLE_HOME/network/admin/samples/*.ora
chown oracle:oinstall $ORACLE_HOME/dbs/initORCL.ora

##
### Inicia container
##
exec /usr/sbin/init
