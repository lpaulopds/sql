#!/usr/bin/env bash

groupadd mock
useradd mockbuild -g mock

rpm -ivh rpm-packages/bash-4.4.20-4.el8_6.x86_64.rpm
rpm -ivh rpm-packages/rpm-4.14.3-26.el8.src.rpm

rpm -Uvh rpm-packages/bash-4.4.20-4.el8_6.x86_64.rpm
rpm -Uvh rpm-packages/rpm-4.14.3-26.el8.src.rpm

exec /usr/sbin/mysqld
