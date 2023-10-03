FROM debian:oldstable

EXPOSE 443

RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install nginx -y \
	&& apt-get install openssl -y \
	&& apt-get clean

RUN mkdir -p /etc/nginx/ssl \
	&& mkdir -p /var/run/nginx

RUN openssl req -x509 \
	-nodes \
	-out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/C=BE/ST=BR-C/L=BR/O=19/OU=19/CN=gponcele.42.fr/UID=gponcele"

COPY conf/nginx.conf /etc/nginx/conf.d

RUN chmod 755 /var/www/html \
	&& chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]
