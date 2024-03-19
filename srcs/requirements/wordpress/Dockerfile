FROM debian:buster

RUN apt update -y
RUN apt upgrade -y
RUN apt install -y wget
RUN apt install -y curl bash vim php-fpm php-mysqli php-curl php-json php-iconv php-phar php-mysql
RUN apt install -y mariadb-client
RUN mkdir -p /var/www/wordpress
RUN		curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
			--output /usr/bin/wp
RUN chmod +x /usr/bin/wp
WORKDIR /var/www/wordpress
COPY conf/wp-config /conf/wp-config
COPY conf/www.conf /etc/php/7.3/fpm/pool.d
COPY tools/install.sh /usr/bin/
RUN chmod +x /usr/bin/install.sh
RUN mkdir -p /run/php/
RUN chown www-data:www-data /etc/php/7.3/fpm/pool.d/www.conf
RUN chmod 644 /etc/php/7.3/fpm/pool.d/www.conf
RUN chmod 755 /etc/php/7.3/fpm/pool.d
RUN mkdir -p /var/log
RUN chown www-data:www-data /var/log
RUN chmod -R 755 /var/log
RUN chown -R www-data:www-data /run/php
RUN chmod -R 755 /run/php
RUN chown -R www-data:www-data /var/www/wordpress
RUN chmod -R 755 /var/www/wordpress
EXPOSE 9000
ENTRYPOINT ["/usr/bin/install.sh"]
CMD ["php-fpm7.3", "-F"]