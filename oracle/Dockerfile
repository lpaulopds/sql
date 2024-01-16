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
## Mantém cache do container no compose up
#
RUN yum update && \
    # yum install -y libaio1 && \
    # yum install -y libaio-dev && \
    # yum install -y libfreetype6-dev && \
    # yum install -y libjpeg62-turbo-dev && \
    # yum install -y libpng-dev && \
    yum install -y oracle-database-preinstall-19c.x86_64 && \
    yum install -y oracle-instantclient-release-el9.x86_64
    # && \
    # yum install -y wget

COPY ./scripts-init/oracle-database-ee-19c-1.0-1.x86_64.rpm /tmp

RUN yum update && \
    yum install -y /tmp/oracle-database-ee-19c-1.0-1.x86_64.rpm

RUN sleep 10 && \
    rm /tmp/oracle-database-ee-19c-1.0-1.x86_64.rpm

#
## Executa entry point file
#
CMD /bin/bash entrypoint.sh
