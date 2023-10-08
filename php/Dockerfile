FROM php:8.2-apache

WORKDIR /var/www

RUN apt-get update && \
        # apt-get upgrade -y && \
        # apt-get install -y libicu-dev && \
        # apt-get install -y icu-devtools && \
        # apt-get install -y php8.2-pgsql && \
        # apt-get install -y git && \
        # apt-get install -y rename && \
        apt-get install -y nano
        # apt-get install -y net-tools && \
        # apt-get install -y zip && \
        # apt-get install -y unzip && \
        # apt-get install -y gzip && \
        # apt-get install -y openssl && \
        # apt-get install -y build-essential && \
        # apt-get install -y curl && \
        # apt-get install -y postgresql-all && \
        # apt-get install -y locales && \
        # apt-get install -y apt-transport-https

RUN curl -sS https://getcomposer.org/installer | \
        php -- --install-dir=/usr/local/bin --filename=composer
# RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql 
# RUN docker-php-ext-install pdo && docker-php-ext-enable pdo

# RUN mv $PHP_INI_DIR/php.ini-development /usr/local/etc/php/php.ini

# RUN chown root:root /usr/local/etc/php/php.ini

# RUN chmod 644 /usr/local/etc/php/php.ini

RUN docker-php-ext-install pdo_mysql && \
        docker-php-ext-enable pdo_mysql

# RUN docker-php-ext-install pgsql && \
#        docker-php-ext-enable pgsql

# RUN docker-php-ext-install pdo_pgsql && \
#        docker-php-ext-enable pdo_pgsql

RUN apt-get install -y libpq-dev && \
        docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql && \
        docker-php-ext-install pdo pgsql pdo_pgsql && \ 
        docker-php-ext-enable pdo pgsql pdo_pgsql

RUN a2enmod rewrite && \
        a2enmod headers && \
        a2enmod proxy && \ 
        a2enmod proxy_http 

# RUN chmod +r /usr/local/etc/php/php.ini-development
# RUN rm /usr/local/etc/php/php.ini-development && \
#         /usr/local/etc/php/php.ini-production

RUN service apache2 restart
