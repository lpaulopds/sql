FROM oraclelinux:9
## OS PRETTY NAME - Oracle Linux Server 9.3

#
## Define variáveis de ambiente
#
ENV ORACLE_SID ORCL
ENV ORACLE_PDB ORCL1
ENV ORACLE_PWD 12345678
ENV ORACLE_CHARACTERSET AL32UTF8
ENV ORACLE_DOCKER_INSTALL true
ENV ORACLE_HOME /opt/oracle/product/19c/dbhome_1
ENV ORACLE_NETWORK /opt/oracle/product/19c/dbhome_1/network/admin/samples
ENV LD_LIBRARY_PATH /opt/oracle/product/19c/dbhome_1/lib
ENV PATH $PATH:$ORACLE_HOME/bin

#
## Diretório de trabalho
#
WORKDIR /home/oracle/sql

#
## Copia arquivos de inicialização
#
COPY ./scripts-init/entrypoint.sh /home/oracle/sql/

COPY ./scripts-config/network-admin/listener.ora /home/oracle/sql/listener.ora
COPY ./scripts-config/network-admin/tnsnames.ora /home/oracle/sql/tnsnames.ora
COPY ./scripts-config/network-admin/sqlnet.ora /home/oracle/sql/sqlnet.ora
COPY ./scripts-config/network-admin/initORCL.ora /home/oracle/sql/initORCL.ora
# COPY ./scripts-config/config-db/oracledb_ORCLCDB-19c /home/oracle/sql/oracledb_ORCLCDB-19c

#
## Atualiza e instala pacotes
#
# RUN yum update && \
    # yum install -y libaio1 && \
    # yum install -y libaio-dev && \
    # yum install -y libfreetype6-dev && \
    # yum install -y libjpeg62-turbo-dev && \
    # yum install -y libpng-dev && \
    # yum install -y wget && \
    # yum install -y ldd

#
## Atualiza e instala preinstall oracle database 19c
#
RUN yum update && \
    yum install -y oracle-database-preinstall-19c.x86_64 

#
## Copia Oracle database rpm para /tmp do SO
#
COPY ./scripts-config/oracle-database-ee-19c-1.0-1.x86_64.rpm /tmp

RUN yum update && \
    yum install -y libaio.x86_64 && \
    yum install -y bc.x86_64 && \
    yum install -y net-tools.x86_64

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
