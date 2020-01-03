#!/bin/bash

# Copy phpmyadmin && wordpress resources to root dir and default to nginx available-site's

cp -R  /usr/bin/phpmyadmin /var/www/html/phpmyadmin
cp  /usr/bin/default /etc/nginx/sites-available/default
cp -R /usr/bin/wp /var/www/html/wp

# Give permissions

chown -R www-data:www-data /var/www/html

# SSL configuration

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MA/ST=Khouribga/L=Khouribga/O=Organisation_NAME/CN=SERVER_NAME"

# Start services 

service mysql start

# Create a db for wordpress and set the password for root user

mysql -uroot -e "CREATE DATABASE wp";
mysql -uroot -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('passwd')";

service php7.3-fpm start
service nginx start

