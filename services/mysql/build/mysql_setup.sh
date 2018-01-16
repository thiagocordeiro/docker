#!/bin/bash

sed -i "s/bind-address/#bind-address/" /etc/mysql/mysql.conf.d/mysqld.cnf
sed -i "s/\[mysqld\]/\[mysqld\]\nsql_mode = NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES/" /etc/mysql/mysql.conf.d/mysqld.cnf

mkdir -p /var/lib/mysql /var/run/mysqld
chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

/etc/init.d/mysql start

mysqladmin -u root password "root"
mysql -u root -proot -e "DELETE FROM mysql.user WHERE User='';"
mysql -u root -proot -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1');"
mysql -u root -proot -e "GRANT ALL PRIVILEGES ON *.* TO root@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;"
mysql -u root -proot -e "FLUSH PRIVILEGES;"
