#! /bin/sh

bootstrap_flarum() {
  export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y \
      git \
      nginx \
      zip unzip \
      php5-curl \
      php5-fpm \
      php5-gd \
      php5-mysql

  curl -sS https://getcomposer.org/installer | php
  mv composer.phar /usr/local/bin/composer

  mkdir /var/www
  composer create-project flarum/flarum /var/www/flarum --stability=beta

  rm -rf /etc/nginx/sites-enabled/*

  chmod -R 775 /var/www/flarum
  chown -R www-data /var/www/
}

bootstrap_flarum
