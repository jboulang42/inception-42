FROM debian:buster

RUN apt update -y
RUN apt upgrade -y
RUN apt install -y mariadb-server
RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld
RUN chown -R mysql:mysql /var/lib/mysql
COPY conf/mysqld.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/install.sh /usr/local/bin
RUN chmod +x /usr/local/bin/install.sh
EXPOSE 3306
ENTRYPOINT ["/usr/local/bin/install.sh"]