#!/bin/bash
# Cai dat apache2
sudo apt update -y
sudo apt install apache2
sudo systemctl stop apache2
sudo systemctl start apache2
sudo systemctl enable apache2

# Cai dat MariaDB
sudo wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
sudo rpm -ivh mysql-community-release-el7-5.noarch.rpm
sudo yum install mysql-server
sudo systemctl start mysqld
## Cai dat lai mat khau va quyen root
mysql_secure_installation <<SECURESQL
y
vnpt1234
vnpt1234
y
n
y
y
SECURESQL

## Tao database va user

mysql -u root -p<<SECURESQL
create database wordpress;
create user 'binh43'@'localhost' identified by 'vnpt1234';
GRANT ALL PRIVILEGES ON wordpress.* TO 'binh43'@'localhost';
flush privileges;
exit
SECURESQL
echo "Hoan thanh tao databases va user"

# Cai dat PHP
sudo apt install php libapache2-mod-php -y
sudo apt install php-cli -y
sudo apt install php-cgi -y
sudo apt install php-mysql -y
sudo apt install php-pgsql -y
cd /var/www/html/
touch info.php
echo "<?php phpinfo(); ?>" | sudo tee -a /var/www/html/info.php
sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/wordpress.conf
# thay đổi thông tin `html` sang `wordpress``
sudo sed -i "s/html/wordpress/g" /etc/apache2/sites-available/wordpress.conf
# Thêm thông tin `ServerName localhost`` dưới dòng `DocumentRoot \/var\/www\/wordpress`
sudo sed -i '/DocumentRoot \/var\/www\/wordpress/a \   ServerName localhost ' /etc/apache2/sites-available/000-default.conf
sudo a2ensite wordpress.conf
sudo a2dissite 000-default.conf
echo "Hoàn tất quá trình cài đặt php"

# Cai dat wordpress

cd /var/www/html
wget -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz
sudo tar -xzvf /tmp/wordpress.tar.gz -C /var/www
sudo chown -R www-data:www-data /var/www/wordpress/
sudo chmod -R 755 /var/www/wordpress/



## Sua ten database trong file cau hinh wp-config.php
sudo sed -i "s/database_name_here/wordpress/g" /var/www/wordpress/wp-config.php

## Sua ten user vào trong file cau hinh wp-config.php
sudo sed -i "s/username_here/binh43/g" /var/www/wordpress/wp-config.php

## Sua mat khau user vào trong file cau hinh wp-config.php
sudo sed -i "s/password_here/vnpt1234/g" /var/www/wordpress/wp-config.php


sudo a2ensite wordpress.conf
sudo a2enmod rewrite
sudo systemctl restart apache2.service