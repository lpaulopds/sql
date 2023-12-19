#!/usr/bin/env bash

##
### Permissão padrão
##
chmod  0750 /var/lib/postgresql/data/

##
### Instala apt packages
##
# apt-get update 
# apt-get upgrade -y && \
# apt-get install -y git && \
# apt-get install -y nano && \
# apt-get install -y net-tools && \
# apt-get install -y unzip && \
# apt-get install -y gzip && \
# apt-get install -y apt-transport-https && \
# apt-get install -y libicu-dev && \
# apt-get install -y icu-devtools && \
# apt-get install -y curl && \
# apt-get install -y openssl
# apt-get install -y build-essential && \
# apt-get install -y locales

##
### Inicia container definindo usuário seguro
##
su -c "exec /usr/lib/postgresql/16/bin/postgres" postgres
