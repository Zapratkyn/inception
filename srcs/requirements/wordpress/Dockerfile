FROM debian:bullseye

RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y wget \
	php \
	php-fpm \
	php-mysql \
	mariadb-client \
	&& apt-get clean

RUN mkdir -p /run/php/

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

COPY tools/auto_config.sh /tmp/auto_config.sh

RUN chmod +x /tmp/auto_config.sh

WORKDIR /var/www/wordpress/

CMD ["sh", "/tmp/auto_config.sh"]