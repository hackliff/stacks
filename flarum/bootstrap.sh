#! /bin/sh

debian_install_init() {
  export DEBIAN_FRONTEND=noninteractive
  apt-get update
  apt-get install -y \
    git \
    nginx \
    zip unzip \
    php5-curl \
    php5-fpm \
    php5-gd \
    php5-mysql
}

install_composer() {
  curl -s http://getcomposer.org/installer | php
  mv composer.phar /usr/bin/composer
  chmod +x /usr/bin/composer
}

bootstrap_flarum() {
  mkdir /var/www
  composer create-project flarum/flarum /var/www/flarum --stability=beta

  rm -rf /etc/nginx/sites-enabled/*

  chmod -R 775 /var/www/flarum
  chown -R www-data /var/www/
}

debian_install_init
bootstrap_flarum
