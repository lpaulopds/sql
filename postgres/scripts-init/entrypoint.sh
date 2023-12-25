#!/usr/bin/env bash

##
### Permissão padrão
##
chmod  0750 /var/lib/postgresql/data/

##
### Inicia container definindo usuário seguro
##
su -c "exec /usr/lib/postgresql/16/bin/postgres" postgres
