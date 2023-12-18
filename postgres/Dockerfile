FROM postgres

##
### Diretório de trabalho
##
# WORKDIR /home/postges/sql

##
### Copia arquivos de inicialização
##
COPY ./scripts-init/init.sql /docker-entrypoint-initdb.d/
COPY ./scripts-init/entrypoint.sh /docker-entrypoint-initdb.d/

##
### Configura variáveis de ambiente para usuário e linguagem
##
ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD postgres
ENV LC_ALL POSIX

##
### Executa entrypoint file
##
CMD /bin/bash /docker-entrypoint-initdb.d/entrypoint.sh
