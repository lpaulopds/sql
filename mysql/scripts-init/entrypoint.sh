#!/usr/bin/env bash

# set -m 
# ls -la /
rpm -ivh rpm-packages/rpm-4.14.3-26.el8.src.rpm
exec /usr/sbin/mysqld
# tail -f /var/log/mysqld.log
