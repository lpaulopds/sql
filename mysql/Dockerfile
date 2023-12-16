FROM mysql:8.1.0

##
### Diretório de trabalho
##
WORKDIR /home/mysql/sql

##
### Define variáveis de ambiente
##
ENV MYSQL_ROOT_PASSWORD 12345678
ENV MYSQL_USER root

##
### Copia arquivos do diretório mysql para o container
##
COPY ./Dockerfile /home/lpaulopds/sql
COPY ./scripts-conf/ /home/lpaulopds/sql/scripts-conf/ 
COPY ./rpm-packages/ /home/lpaulopds/sql/rpm-packages/
COPY ./scripts-init/entrypoint.sh /docker-entrypoint-initdb.d/

##
### Executa padrão entrypoint
##
CMD /bin/bash /docker-entrypoint-initdb.d/entrypoint.sh
