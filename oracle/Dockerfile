FROM oraclelinux:9
## OS PRETTY NAME - Oracle Linux Server 9.3

#
## Define variáveis de ambiente
#
ENV ORACLE_SID XE
ENV ORACLE_PDB XE
ENV ORACLE_PWD 12345678
ENV ORACLE_CHARACTERSET AL32UTF8
ENV ORACLE_DOCKER_INSTALL true
ENV ORACLE_HOME /opt/oracle/product/19c/dbhome_1

#
## Diretório de trabalho
#
WORKDIR /home/oracle/sql

#
## Copia arquivos de inicialização
#
COPY ./scripts-init/entrypoint.sh /home/oracle/sql/

#
## Atualiza e instala pacotes
#
# RUN yum update && \
    # yum install -y libaio1 && \
    # yum install -y libaio-dev && \
    # yum install -y libfreetype6-dev && \
    # yum install -y libjpeg62-turbo-dev && \
    # yum install -y libpng-dev && \
    # yum install -y wget

#
## Atualiza e instala preinstall oracle database 19c
#
RUN yum update && \
    yum install -y oracle-database-preinstall-19c.x86_64 

#
## Copia Oracle database rpm para /tmp do SO
#
COPY ./scripts-init/oracle-database-ee-19c-1.0-1.x86_64.rpm /tmp

#
## Atualiza e instala Oracle database 19c RPM
#
RUN yum update && \
    yum install -y /tmp/oracle-database-ee-19c-1.0-1.x86_64.rpm

#
## Espera 10 segundos após instalação do banco de dados
## e remove arquivo RPM do /tmp
#
RUN sleep 10 && \
    rm /tmp/oracle-database-ee-19c-1.0-1.x86_64.rpm

#
## Executa entry point file
#
CMD /bin/bash entrypoint.sh
