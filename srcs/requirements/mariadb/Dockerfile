FROM debian:bullseye

RUN apt update \
	&& apt upgrade -y \
	&& apt install mariadb-server -y \
	&& apt clean

COPY conf/my.cnf /etc/mysql/my.cnf

RUN chown mysql:mysql /etc/mysql/my.cnf \
	&& chmod 600 /etc/mysql/my.cnf

COPY tools/configure.sh /tmp/configure.sh

CMD ["sh", "/tmp/configure.sh"]