FROM postgres:16
## OS PRETTY NAME - Debian GNU/Linux 12 (bookworm)

### Configura variáveis de ambiente para usuário e linguagem
ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD postgres
ENV LC_ALL POSIX

### Diretório de trabalho
WORKDIR /home/postgres/sql

### Copia arquivos de inicialização
COPY ./scripts-init/init.sql /docker-entrypoint-initdb.d/
COPY ./scripts-init/entrypoint.sh /docker-entrypoint-initdb.d/

### Instala apt packages
### Mantém cache do container no compose up
RUN apt-get update && \
    apt-get install -y build-essential && \
    # apt-get install -y apt-transport-https && \
    apt-get install -y curl && \
    apt-get install -y net-tools && \
    apt-get install -y zip && \
    apt-get install -y unzip && \
    apt-get install -y nano && \
    apt-get install -y systemctl && \
    apt-get install -y tcpdump && \
    apt-get install -y git && \
    # apt-get install -y tshark && \
    # apt-get install -y termshark && \
    # apt-get install -y libtool && \
    # apt-get install -y icu-devtools && \
    # apt-get install -y locales && \
    # apt-get install -y openssl && \
    # apt-get install -y libaio1 && \
    # apt-get install -y libaio-dev && \
    # apt-get install -y libfreetype6-dev && \
    # apt-get install -y libjpeg62-turbo-dev && \
    # apt-get install -y libpng-dev && \
    # apt-get install -y psmisc && \
    apt-get install -y wget

### Executa entry point file
CMD /bin/bash /docker-entrypoint-initdb.d/entrypoint.sh
