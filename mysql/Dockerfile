FROM mysql:8.1.0
## OS PRETTY NAME - Oracle Linux Server 8.8

### Define variáveis de ambiente
ENV MYSQL_ROOT_PASSWORD 12345678
ENV MYSQL_USER root

### Diretório de trabalho
WORKDIR /home/mysql/sql

### Copia arquivos do diretório mysql para o container
# COPY ./Dockerfile /home/mysql/sql
# COPY ./scripts-conf/ /home/mysql/sql/scripts-conf/ 
COPY ./scripts-init/entrypoint.sh /docker-entrypoint-initdb.d/

### Install package management system [yum]
### Install packages
### Mantém cache do container no compose up
RUN microdnf install yum && \
    dnf install -y nano && \
    dnf install -y man-db.x86_64

### Executa entry point file
CMD /bin/bash /docker-entrypoint-initdb.d/entrypoint.sh
