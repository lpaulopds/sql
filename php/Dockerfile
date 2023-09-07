FROM php:8.2.0-apache
WORKDIR /var/www
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git && \
    apt-get install -y nano && \
    apt-get install -y net-tools && \
    apt-get install -y unzip && \
    apt-get install -y gzip && \
    apt-get install -y openssl && \
    apt-get install -y --reinstall libpq-dev
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN docker-php-ext-install pdo pdo_mysql pdo_pgsql pgsql
RUN a2enmod rewrite && \
    a2enmod headers && \
    a2enmod proxy && \ 
    a2enmod proxy_http