#!/usr/bin/env bash

rpm -ivh rpm-packages/rpm-4.14.3-26.el8.src.rpm
exec /usr/sbin/mysqld

