FROM oraclelinux:9
## OS PRETTY NAME - Oracle Linux Server 9.3

##
### Define variáveis de ambiente
##
ENV ORACLE_SID XE
ENV ORACLE_PDB XE
ENV ORACLE_PWD 12345678
ENV ORACLE_CHARACTERSET AL32UTF8 

##
### Diretório de trabalho
##
WORKDIR /home/oracle/sql

##
### Copia arquivos de inicialização
##
COPY ./scripts-init/entrypoint.sh /home/oracle/sql/

##
### Atualiza e instala pacotes
### Mantém cache do container no compose up
##
RUN yum update && \
    # yum install -y libaio1 && \
    # yum install -y libaio-dev && \
    # yum install -y libfreetype6-dev && \
    # yum install -y libjpeg62-turbo-dev && \
    # yum install -y libpng-dev && \
    yum install -y wget

##
### Executa entry point file
##
CMD /bin/bash entrypoint.sh
