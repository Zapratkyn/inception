FROM debian:oldstable

RUN apt update \
	&& apt upgrade -y \
	&& apt install mariadb-server -y \
	&& apt clean

RUN mkdir -p /var/run/mysqld

COPY conf/mariadb.cnf /etc/mysql/

COPY tools/configure.sh /tmp/configure.sh

CMD ["sh", "/tmp/configure.sh"]
