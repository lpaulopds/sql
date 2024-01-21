#!/usr/bin/env bash

cp /home/oracle/sql/*.ora $ORACLE_HOME/network/admin/samples
chown oracle:oinstall $ORACLE_HOME/network/admin/samples/*.ora
# su -c "$ORACLE_HOME/bin/lsnrctl start" oracle

##
### Inicia container
##
exec /usr/sbin/init
