FROM php:5-apache

RUN apt-get update \
 && apt-get install -y git zlib1g-dev libicu-dev g++ \
 && docker-php-ext-install zip intl\
 && a2enmod rewrite \
 && sed -i 's!/var/www/html!/var/www/public!g' /etc/apache2/sites-enabled/000-default.conf \
 && mv /var/www/html /var/www/public \
 && curl -sS https://getcomposer.org/installer \
  | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www
