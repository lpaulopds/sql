FROM mcr.microsoft.com/mssql/server:2022-latest
## OS PRETTY NAME - Ubuntu 22.04.3 LTS

##
### Define variáveis de ambiente
##
ENV SA_PASSWORD password123!
ENV ACCEPT_EULA Y
ENV MSSQL_PID Express

##
### Diretório de trabalho
##
WORKDIR /home/mssql/sql

##
### Copia arquivos do diretório MSSQL para o container
##
COPY . /home/mssql/sql

##
### Define usuário para executar comandos
##
USER root

##
### Atualiza e instala apt packages
### Mantém cache do container no compose up
##
RUN apt-get update && \
    apt-get install -y net-tools

##
### Executa entry point file
##
CMD /bin/bash ./scripts-init/entrypoint.sh
