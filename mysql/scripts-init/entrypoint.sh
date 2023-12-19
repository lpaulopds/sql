#!/usr/bin/env bash

##
### Cria grupo e usuário para administrar rpm packages
##
groupadd mock
useradd mockbuild -g mock

##
### Download pacotes rpm
##
curl -O https://yum.oracle.com/repo/OracleLinux/OL8/8/baseos/base/x86_64/getPackage/nano-2.9.8-1.el8.x86_64.rpm
curl -O https://yum.oracle.com/repo/OracleLinux/OL8/8/baseos/base/x86_64/getPackage/yum-4.7.0-16.0.1.el8_8.noarch.rpm
# curl -O https://yum.oracle.com/repo/OracleLinux/OL8/8/baseos/base/x86_64/getPackage/bash-4.4.20-4.el8_6.x86_64.rpm
# curl -O https://yum.oracle.com/repo/OracleLinux/OL8/8/baseos/base/x86_64/getPackage/rpm-4.14.3-26.el8.x86_64.rpm

##
### Move rpm packages para diretório definido
## 
mkdir rpm-packages/
mv *.rpm rpm-packages/

##
### Instala rpm packages manualmente
##
# rpm -ivh rpm-packages/rpm-4.14.3-26.el8.x86_64.rpm
# rpm -ivh rpm-packages/bash-4.4.20-4.el8_6.x86_64.rpm
rpm -ivh rpm-packages/nano-2.9.8-1.el8.x86_64.rpm
rpm -ivh rpm-packages/yum-4.7.0-16.0.1.el8_8.noarch.rpm

##
### Atualiza rpm packages recém instalados
##
# rpm -Uvh rpm-packages/rpm-4.14.3-26.el8.x86_64.rpm
# rpm -Uvh rpm-packages/bash-4.4.20-4.el8_6.x86_64.rpm
rpm -Uvh rpm-packages/nano-2.9.8-1.el8.x86_64.rpm
rpm -Uvh rpm-packages/yum-4.7.0-16.0.1.el8_8.noarch.rpm

##
### Inicia container
##
chmod 1770 /var/run/mysqld/
exec /usr/sbin/mysqld
