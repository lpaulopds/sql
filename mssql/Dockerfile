FROM mcr.microsoft.com/mssql/server:2022-latest

##
### Diretório de trabalho
##
WORKDIR /home/mssql/sql

##
### Copia arquivos para o container
##
COPY . /home/mssql/sql

##
### Define variáveis de ambiente
##
ENV SA_PASSWORD password123!
ENV ACCEPT_EULA Y
ENV MSSQL_PID Express

##
### Define usuário para executar comandos
##
USER root

##
### Altera ponto de entrada
##
CMD /bin/bash ./scripts-init/entrypoint.sh
