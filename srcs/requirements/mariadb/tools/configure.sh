#!/bin/sh

if [ -d /var/lib/mysql/$SQL_DATABASE ]
then
	echo "DB $SQL_DATABASE already exists..."
else

	service mysql start --datadir=/var/lib/mysql

	echo "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;" | mysql -u root
	echo "CREATE USER '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';" | mysql -u root
	echo "GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'%';" | mysql -u root
	echo "FLUSH PRIVILEGES;" | mariadb -u root

	mysqladmin -u root password $SQL_PASSWORD

	service mysql stop --datadir=/var/lib/mysql

fi

mysqld_safe --datadir=/var/lib/mysql
