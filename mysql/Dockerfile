FROM mysql:8.1.0

##
### Diretório de trabalho
##
WORKDIR /home/lpaulopds/sql

##
### Copia arquivos para o container
##
COPY . /home/lpaulopds/sql

##
### Define variáveis de ambiente
##
ENV MYSQL_ROOT_PASSWORD 12345678

##
### Atualiza sistema e instala programas
##
RUN apt-get update
#         apt-get upgrade -y && \
#         apt-get install -y git && \
#         apt-get install -y nano && \
#         apt-get install -y net-tools && \
#         apt-get install -y unzip && \
#         apt-get install -y gzip
