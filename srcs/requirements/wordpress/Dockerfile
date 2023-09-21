FROM debian:buster

RUN apt-get update \
	&& apt-get upgrade \
	&& apt-get install -y wget \
	php7.3 \
	php-fpm \
	php-mysql \
	mariadb-client \
	&& apt-get clean

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

RUN cd /var/www \
	&& tar -xzf wordpress-6.0-fr_FR.tar.gz \
	&& rm wordpress-6.0-fr_FR.tar.gz \
	&& chown -R root:root /var/www/wordpress

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin.wp

COPY tools/auto_config.sh /tmp/

ENTRYPOINT ["sh", "/tmp/auto_config.sh"]
