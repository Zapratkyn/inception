FROM debian:bullseye

RUN apt update \
	&& apt upgrade -y \
	&& apt install mariadb-server -y \
	&& apt install systemctl -y \
	&& apt clean

RUN mkdir -p /var/run/mysqld \
	&& chown -R mysql:mysql /var/run/mysqld \
	&& chown -R mysql:mysql /etc/mysql

EXPOSE 3306

COPY conf/mariadb.cnf /etc/mysql/

COPY tools/configure.sh /tmp/configure.sh

CMD ["sh", "/tmp/configure.sh"]
