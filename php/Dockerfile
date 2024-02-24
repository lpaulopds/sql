FROM php:8.2-apache
## OS PRETTY NAME - Debian GNU/Linux 12 (bookworm)

### Diretório de trabalho
WORKDIR /var/www

### Atualiza sistema e instala programas necessários
# RUN apt-get update
    # apt-get install -y build-essential && \
    # apt-get install -y apt-transport-https && \
    # apt-get install -y curl && \
    # apt-get install -y net-tools && \
    # apt-get install -y libtool && \
    # apt-get install -y icu-devtools && \
    # apt-get install -y zip && \
    # apt-get install -y unzip && \
    # apt-get install -y locales && \
    # apt-get install -y openssl && \
    # apt-get install -y nano && \
    # apt-get install -y libaio1 && \
    # apt-get install -y libaio-dev && \
    # apt-get install -y libfreetype6-dev && \
    # apt-get install -y libjpeg62-turbo-dev && \
    # apt-get install -y libpng-dev && \
    # apt-get install -y psmisc && \
    # apt-get install -y systemctl && \
    # apt-get install -y wget

COPY ./php.ini /usr/local/etc/php/php.ini
COPY ./apache/etc/apache2.conf /etc/apache2/apache2.conf
COPY ./apache/etc/security.conf /etc/apache2/conf-available/security.conf
COPY ./apache/vhost/000-default.conf /etc/apache2/sites-available/000-default.conf

### Atualiza sistema e instala composer
RUN apt-get update && \
    curl -sS https://getcomposer.org/installer | \
        php -- --install-dir=/usr/local/bin --filename=composer

### Atualiza sistema e instala extensões para persistência de dados
RUN apt-get update && apt-get install -y libpq-dev && \
    docker-php-ext-install pdo pgsql pdo_pgsql pdo_mysql && \
    docker-php-ext-enable pdo pgsql pdo_pgsql pdo_mysql

### Habilita módulos apache
RUN a2enmod rewrite && \
    a2enmod headers && \
    a2enmod proxy && \ 
    a2enmod proxy_http

### Reinicia serviço do apache2
RUN service apache2 restart

### Executa entry point file
CMD /bin/bash php/scripts-init/entrypoint.sh
