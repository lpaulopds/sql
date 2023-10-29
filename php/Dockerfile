FROM php:8.2-apache

##
### Diretório de trabalho da app web
##
WORKDIR /var/www

##
### Atualiza sistema e instala programas necessários
##
RUN apt-get update && \
    apt-get -y install nano && \
    apt-get -y install net-tools && \
    apt-get -y install curl

##
### Atualiza sistema e instala composer
##
RUN apt-get update && \
    curl -sS https://getcomposer.org/installer | \
        php -- --install-dir=/usr/local/bin --filename=composer

##
### Atualiza sistema e instala extensões para persistência de dados
##
RUN apt-get update && apt-get install -y libpq-dev && \
    docker-php-ext-install pdo pgsql pdo_pgsql pdo_mysql && \
    docker-php-ext-enable pdo pgsql pdo_pgsql pdo_mysql

##
### Habilita módulos apache e reinicia serviço
##
RUN a2enmod rewrite && \
    a2enmod headers && \
    a2enmod proxy && \ 
    a2enmod proxy_http

RUN service apache2 restart

##  ------------------------------------
### Códigos para reutilização e excluir
##  ------------------------------------

# RUN rm -f /etc/apt/preferences.d/no-debian-php

# RUN apt-get update && \
#     apt-get -y install postgresql && \
#     apt-get -y install postgresql-all

# RUN apt-get update && apt-get install -y libpq-dev
# RUN docker-php-ext-configure pgsql -with-pgsql=/usr/bin/pg_config
# RUN docker-php-ext-install pdo pdo_pgsql

# RUN apt-get update && \
#     apt-get -y install libapache2-mod-php8.2 && \
#     apt-get -y install libpq-dev && \
#     apt-get -y install php8.2-pgsql && \
#     apt-get -y install php8.2-mysql && \
#     # apt-get -y install postgresql-dev && \
#     apt-get update && \
#     docker-php-ext-configure pgsql -with-pgsql && \
#     docker-php-ext-install pdo pdo_pgsql pgsql pdo_mysql && \
#     docker-php-ext-enable pdo pdo_pgsql pgsql pdo_mysql

# RUN mv $PHP_INI_DIR/php.ini-development $PHP_INI_DIR/php.ini

# RUN sed -i 's/;extension=pgsql/extension=pgsql/' $PHP_INI_DIR/php.ini
# RUN sed -i 's/;extension=pdo_pgsql/extension=pdo_pgsql/' $PHP_INI_DIR/php.ini
# RUN sed -i 's/;extension=pdo_mysql/extension=pdo_mysql/' $PHP_INI_DIR/php.ini

# RUN apt-get update && \
#     apt-get -y install apt-transport-https && \
#     apt-get -y install php-common && \
#     apt-get -y install postgresql && \
#     apt-get -y install php-pgsql && \
#     apt-get -y install php8.2-pgsql

# RUN apt-get update && \
#     apt-get install -y libpq-dev && \
#     docker-php-ext-configure pdo && \
#     docker-php-ext-configure pgsql && \
#     docker-php-ext-configure pdo_mysql && \
#     docker-php-ext-configure pdo_pgsql --with-pdo-pgsql=/usr/bin/pg_config && \
#     docker-php-ext-install pdo pgsql pdo_mysql pdo_pgsql && \
#     docker-php-ext-enable pdo && \
#     docker-php-ext-enable pdo_mysql && \
#     docker-php-ext-enable pgsql && \
#     docker-php-ext-enable pdo_pgsql

# RUN phpenmod pdo pgsql pdo_pgsql pdo_mysql

# RUN sed -i 's/;extension=pgsql/extension=pgsql/' $PHP_INI_DIR/php.ini
# RUN sed -i 's/;extension=pdo_pgsql/extension=pdo_pgsql/' $PHP_INI_DIR/php.ini
# RUN sed -i 's/;extension=pdo_mysql/extension=pdo_mysql/' $PHP_INI_DIR/php.ini

# RUN apt-get update && \
#         # apt-get upgrade -y && \
#         # apt-get install -y libicu-dev && \
#         # apt-get install -y autoconf && \
#         # apt-get install -y automake && \
#         # apt-get install -y libtool && \
#         # apt-get install -y gettext && \
#         # apt-get install -y m4 && \
#         # apt-get install -y icu-devtools && \
#         # apt-get install -y rename && \
#         # apt-get install -y net-tools && \
#         # apt-get install -y zip && \
#         # apt-get install -y unzip && \
#         # apt-get install -y gzip && \
#         # apt-get install -y openssl && \
#         # apt-get install -y build-essential && \
#         # apt-get install -y locales && \
#         # apt-get install -y apt-transport-https

# RUN docker-php-ext-enable pgsql /usr/local/lib/php/extensions/no-debug-non-zts-20220829
# RUN docker-php-ext-enable pdo_mysql /usr/local/lib/php/extensions/no-debug-non-zts-20220829
# RUN docker-php-ext-enable pdo_pgsql /usr/local/lib/php/extensions/no-debug-non-zts-20220829

# RUN docker-php-ext-install pdo pdo=/usr/src/php/ext/pdo && \
#         docker-php-ext-install pgsql -with-pgsql=/usr/src/php/ext/pgsql
#         docker-php-ext-install pdo_pgsql -with-pdo-pgsql=/usr/src/php/ext/pdo_pgsql

# RUN mv $PHP_INI_DIR/php.ini-development $PHP_INI_DIR/php.ini
# RUN chown root:root $PHP_INI_DIR/php.ini
# RUN chmod 644 $PHP_INI_DIR/php.ini

# RUN sed -i 's/;extension=pgsql/extension=pgsql/' $PHP_INI_DIR/php.ini
# RUN sed -i 's/;extension=pdo_pgsql/extension=pdo_pgsql/' $PHP_INI_DIR/php.ini
# RUN sed -i 's/;extension=pdo_mysql/extension=pdo_mysql/' $PHP_INI_DIR/php.ini

# RUN a2enmod rewrite && \
#         a2enmod headers && \
#         a2enmod proxy && \ 
#         a2enmod proxy_http 

# RUN chmod +r /usr/local/etc/php/php.ini-development
# RUN rm /usr/local/etc/php/php.ini-development && \
#         /usr/local/etc/php/php.ini-production

# RUN service apache2 restart
