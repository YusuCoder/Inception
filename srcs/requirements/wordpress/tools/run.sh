#!/bin/sh

if [ -z "$PHP_PORT" ]; then
  echo "PHP_PORT not set. Defaulting to 9000"
  PHP_PORT=9000
fi

sed -i "s|PHP_PORT|${PHP_PORT}|g" /etc/php/7.3/fpm/pool.d/www.conf

mkdir -p /run/php
chown -R www-data:www-data /run/php

# Waiting for MariaDB to be ready
until mysqladmin ping -h"$MYSQL_HOST" --silent; do
  echo "Waiting for MariaDB to be ready..."
  sleep 2
done

if [ -f "$WP_PATH/wp-config.php" ]; then
  echo "WordPress already configured."
else
  echo "Downloading and setting up WordPress..."
  wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar
  mv wp-cli.phar /usr/local/bin/wp

  wp core download --path=$WP_PATH --allow-root
  wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST --path=$WP_PATH --skip-check --allow-root
  wp core install --path=$WP_PATH --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_USER --admin_password=$WP_PASSWORD --admin_email=$WP_EMAIL --skip-email --allow-root
  wp theme install teluro --path=$WP_PATH --activate --allow-root
  wp user create leon leon@le.on --role=author --path=$WP_PATH --user_pass=leon --allow-root
fi

exec /usr/sbin/php-fpm7.3 -F
