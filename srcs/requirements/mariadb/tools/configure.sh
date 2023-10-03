#!/bin/sh

if [ -d /var/lib/mysql/$SQL_DATABASE ]
then
	echo "DB $SQL_DATABASE already exists..."
else

	service mysql start --datadir=/var/lib/mysql

	mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
	mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
	mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
	mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
	mysql -e "FLUSH PRIVILEGES;"

fi


mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
exec mysqld_safe
