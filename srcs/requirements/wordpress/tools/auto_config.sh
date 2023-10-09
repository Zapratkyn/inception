#!bin/bash

sleep 5

sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 9000|g" /etc/php/7.4/fpm/pool.d/www.conf

ls -la

if [ ! -f ./wp-config.php ]; then

	wp core download --allow-root --path=/var/www/wordpress/

	wp config create --allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb --path='/var/www/wordpress'

	wp core install --allow-root --url=$DOMAIN_NAME --title=$SITE_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL

	wp user create --allow-root $USER1_LOGIN $USER1_MAIL --user_pass=$USER1_PASSWORD

else
	echo "Wordpress is already installed and configured"
fi

if [ ! -d /run/php ] 
then
	mkdir ./run/php
fi

php-fpm7.4 --nodaemonize
