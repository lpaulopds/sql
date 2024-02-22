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

#### Querys for debug
## $ show pdbs
## $ SELECT name FROM v$controlfile;
## $ SELECT instance_name, status FROM v$instance;
## $ ALTER SYSTEM REGISTER;
## $ SELECT name FROM v$controlfile;
## $ SELECT name FROM v$database;
## $ show parameter control_files;
## $ alter system set control_files='/u01/app/oracle/oradata/MSDB/control01.ctl' scope=spfile;
## $ SHOW PARAMETER spfile;
## $ STARTUP NOMOUNT PFILE='$ORACLE_HOME/dbs/initORCL.ora';
## $ SELECT name FROM v$database;
## $ SELECT open_mode FROM v$database;

#### Location startup logs and errors
## $ORACLE_HOME/diag/rdbms/orcl/ORCL/trace/alert_ORCL.log
## $ cat /opt/oracle/cfgtoollogs/dbca/trace.log_2024-02-13_03-10-54AM | grep "Could not" | more
## $ ls /opt/oracle/oraInventory/logs
## [FATAL] Error while executing "/opt/oracle/product/19c/dbhome_1/ord/im/admin/ordlib.sql". Refer to "/opt/oracle/cfgtoollogs/dbca/ORCLCDB/ordlib0.log" for more details. Error in Process: /opt/oracle/product/19c/dbhome_1/perl/bin/perl
## /opt/oracle/cfgtoollogs/dbca/ORCLCDB/ORCLCDB.log

#### Logs LISTENER
## $ cat /opt/oracle/diag/tnslsnr/68d8fe29e777/listener/alert/log.xml

#### Configure default database
## /etc/init.d/oracledb_ORCLCDB-19c configure


cp /home/oracle/sql/listener.ora $ORACLE_HOME/network/admin/samples/
cp /home/oracle/sql/tnsnames.ora $ORACLE_HOME/network/admin/samples/
cp /home/oracle/sql/sqlnet.ora $ORACLE_HOME/network/admin/samples/
cp /home/oracle/sql/initORCL.ora $ORACLE_HOME/dbs/

cp /home/oracle/sql/oracledb_ORCLCDB-19c /etc/init.d/oracledb_ORCL-19c

chown oracle:oinstall $ORACLE_HOME/network/admin/samples/*.ora
chown oracle:oinstall $ORACLE_HOME/dbs/initORCL.ora

chown oracle:oinstall /etc/init.d/oracledb_ORCL-19c
mv /home/oracle/sql/oracledb_ORCLCDB-19c /etc/sysconfig/oracledb_ORCL-19c.conf

##
### Inicia container
##
exec /usr/sbin/init
