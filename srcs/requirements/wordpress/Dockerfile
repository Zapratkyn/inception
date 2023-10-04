FROM debian:oldstable

RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y wget \
	php7.4 \
	php-fpm \
	php-mysql \
	mariadb-client \
	&& apt-get clean

RUN mkdir -p /run/php/

#RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

#RUN cd /var/www \
#	&& tar -xzf wordpress-6.0-fr_FR.tar.gz \
#	&& rm wordpress-6.0-fr_FR.tar.gz \
#	&& chown -R root:root /var/www/wordpress

#COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

COPY tools/auto_config.sh /tmp/auto_config.sh

ENTRYPOINT ["sh", "/tmp/auto_config.sh"]

#WORKDIR /var/www/html/

EXPOSE 9000

#CMD ["/usr/sbin/php-fpm7.4", "-F"]
