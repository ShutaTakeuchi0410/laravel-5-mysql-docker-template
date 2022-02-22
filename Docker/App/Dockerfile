FROM php:7.4-apache

ADD php.ini /usr/local/etc/php/
ADD 000-default.conf /etc/apache2/sites-enabled/

RUN cd /usr/bin && curl -s http://getcomposer.org/installer | php && ln -s /usr/bin/composer.phar /usr/bin/composer

RUN apt-get update \
&& apt-get install -y \
git \
zip \
unzip \
vim \
libpng-dev \
libpq-dev \
&& docker-php-ext-install pdo_mysql

# コンテナ内における日本語対応
RUN apt-get update && \
    apt-get install -y locales && \
    echo "ja_JP UTF-8" > /etc/locale.gen && \
    locale-gen && \
    echo "export LANG=ja_JP.UTF-8" >> ~/.bashrc

RUN mv /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled
RUN /bin/sh -c a2enmod rewrite

RUN docker-php-ext-install sockets