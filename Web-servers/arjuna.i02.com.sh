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
    DocumentRoot /var/www/arjuna.i02
    ServerName arjuna.i02.com
    ServerAlias www.arjuna.i02.com
    
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
    
</VirtualHost>' | tee /etc/apache2/sites-available/arjuna.i02.com.conf



a2ensite arjuna.i02.com

curl -L -o "/var/www/arjuna.zip" "https://drive.google.com/uc?export=download&id=17tAM_XDKYWDvF-JJix1x7txvTBEax7vX" && \
sleep 1 && \
unzip "/var/www/arjuna.zip" -d "/var/www" && \
sleep 1 && \
mv "/var/www/arjuna.yyy.com" "/var/www/arjuna.i02" && \
sleep 1 && \
rm "/var/www/arjuna.zip"


service apache2 start

