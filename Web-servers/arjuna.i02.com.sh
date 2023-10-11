#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install lynx -y
apt-get install apache2 -y
apt-get install php -y
apt-get install unzip -y


echo "php php/timezone string Asia/Jakarta" | debconf-set-selections
unset DEBIAN_FRONTEND


curl -L -o "/var/www/arjuna.zip" "https://drive.google.com/uc?export=download&id=17tAM_XDKYWDvF-JJix1x7txvTBEax7vX" && unzip "/var/www/arjuna.zip" && rm "/var/www/arjuna.zip" && mv "/var/www/arjuna.yyy.com" "/var/www/arjuna.i02.com"

service apache2 start

