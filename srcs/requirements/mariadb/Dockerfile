FROM debian:buster

RUN apt update \
	&& apt upgrade -y \
	&& apt install mariadb-server -y \
	&& apt clean

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/configure.sh /tmp/configure.sh

CMD ["sh", "/tmp/configure.sh"]
