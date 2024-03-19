#!/bin/sh



sleep 30

if [ ! -f "wp-config.php" ]; then
wget http://wordpress.org/latest.tar.gz
tar xfz latest.tar.gz
mv wordpress/* .
rm -rf latest.tar.gz
rm -rf wordpress

cp /conf/wp-config ./wp-config.php
wp core install --allow-root --url="$WP_URL" --title="$WP_TITLE" --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PWD" --admin_email="$WP_ADMIN_EMAIL" --skip-email
wp plugin update --all --allow-root
wp theme install twentytwenty --activate --allow-root
wp user create $WP_USER $WP_USER_EMAIL --allow-root --role=contributor --user_pass=$WP_USER_PWD
wp post generate --count=1 --post_author="OldGodRher" --post_title="THE FESTIVAL IS UPON US!" --allow-root --post_content << _EOF_
The Festival of Termina begins! Good luck!
_EOF_
fi
#php-fpm7.3 --nodaemonize

exec "$@"