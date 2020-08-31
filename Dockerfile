FROM php:7.0-apache
RUN yes | pecl install xdebug-2.6.1 \
    && apt-get update \
    && apt-get install -y nano git zip

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY 99-xdebug.ini /usr/local/etc/php/conf.d