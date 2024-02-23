#!/usr/bin/env bash

#### Copy files configuration
cp /home/oracle/sql/listener.ora $ORACLE_HOME/network/admin/samples/
cp /home/oracle/sql/tnsnames.ora $ORACLE_HOME/network/admin/samples/
cp /home/oracle/sql/sqlnet.ora $ORACLE_HOME/network/admin/samples/
cp /home/oracle/sql/initORCL.ora $ORACLE_HOME/dbs/

#### Define user and group for files
chown oracle:oinstall $ORACLE_HOME/network/admin/samples/*.ora
chown oracle:oinstall $ORACLE_HOME/dbs/initORCL.ora

#### Start container
exec /usr/sbin/init
