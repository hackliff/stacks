#!/bin/sh

echo "Starting flarum..."

echo "Starting php"
/etc/init.d/php5-fpm start

echo "Starting nginx"
/etc/init.d/nginx start

echo "Tailing nginx access logs..."
tail -f /var/log/nginx/access.log
