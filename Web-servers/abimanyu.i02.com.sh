#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install lynx -y
apt-get install apache2 -y
apt-get install php -y
apt-get install unzip -y


echo "php php/timezone string Asia/Jakarta" | debconf-set-selections
unset DEBIAN_FRONTEND



echo '<VirtualHost *:80>
    
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/abimanyu.i02
    ServerName abimanyu.i02.com
    ServerAlias www.abimanyu.i02.com
    
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
    
</VirtualHost>' | tee /etc/apache2/sites-available/abimanyu.i02.com.conf



a2ensite abimanyu.i02.com

curl -L -o "/var/www/abimanyu.zip" "https://drive.google.com/uc?export=download&id=1a4V23hwK9S7hQEDEcv9FL14UkkrHc-Zc" && \
sleep 1 && \
unzip "/var/www/abimanyu.zip" -d "/var/www" && \
sleep 1 && \
mv "/var/www/abimanyu.yyy.com" "/var/www/abimanyu.i02" && \
sleep 1 && \
rm "/var/www/abimanyu.zip"


service apache2 start