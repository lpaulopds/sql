#!/usr/bin/env bash

#
## Atenção!
## No primeiro Build do container, executar sem o padrão
## entry point, para isso, comente a linha
## do Dockerfile com o comando [CMD]. Dessa maneira
## todos os arquivos do database serão criados corretamente.
#

### Permissão padrão
chmod 0750 /var/lib/postgresql/data/

### Inicia container definindo usuário seguro
su -c "exec /usr/lib/postgresql/16/bin/postgres" postgres
