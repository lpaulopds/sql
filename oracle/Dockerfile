FROM oraclelinux:9

LABEL maintainer="luizpaulopds@outlook.com.br"

RUN yum update && \
    # yum install -y libaio1 && \
    # yum install -y libaio-dev && \
    # yum install -y libfreetype6-dev && \
    # yum install -y libjpeg62-turbo-dev && \
    # yum install -y libpng-dev && \
    yum install -y wget

ENV ORACLE_SID XE
ENV ORACLE_PDB XE
ENV ORACLE_PWD 12345678
ENV ORACLE_CHARACTERSET AL32UTF8 

CMD tail -f /dev/null

# RUN wget https://download.oracle.com/otn_software/linux/instantclient/1921000/instantclient-basic-linux.x64-19.21.0.0.0dbru.zip
