#!/bin/sh
#mysqld_safe
#while ! mysqladmin ping -h "$MARIADB_HOST" ; do
#sleep 1
#done
mysql_install_db --basedir=/usr --datadir=/var/lib/mysql

if [ -d "/var/lib/mysql/$MARIADB_DB" ] 
then
	echo "Database exists!\n" 
else
	service mysql start
	sleep 7
	mysql_secure_installation <<_EOF_

Y	
$MARIADB_ROOT_PWD
$MARIADB_ROOT_PWD
Y
Y
Y
Y
_EOF_

	echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MARIADB_ROOT_PWD'; FLUSH PRIVILEGES;" | mysql -uroot
	echo "CREATE USER '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_USER_PWD'; CREATE DATABASE IF NOT EXISTS $MARIADB_DB; GRANT ALL ON $MARIADB_DB.* TO '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_USER_PWD'; FLUSH PRIVILEGES;" | mysql -u root
	mysqladmin -uroot -p$MARIADB_ROOT_PWD -S /var/run/mysqld/mysqld.sock shutdown
	sleep 5
fi
exec mysqld_safe