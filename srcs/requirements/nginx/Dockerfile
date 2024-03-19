FROM debian:buster

RUN apt update -y
RUN apt upgrade -y
RUN apt install -y nginx
RUN apt install -y openssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/key.crt \ 
		-keyout /etc/nginx/ssl/key.key \
		-subj "/C=CA/ST=QC/L=Quebec City/O=42 School/OU=fboulang/CN=fboulang/"

COPY ./conf/nginx.conf /etc/nginx/conf.d

RUN mkdir -p /run/nginx
RUN mkdir -p /var/www/wordpress
RUN chmod 755 /var/www/wordpress
RUN chown -R www-data:www-data /var/www/wordpress

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]