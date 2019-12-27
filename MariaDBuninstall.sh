#!/bin/bash
service mysqld stop
whereis mysql
rm -rf /usr/lib64/mysql /usr/local/mysql /usr/share/mysql /var/spool/mail/mysql
find / -name mysql
rm  -rf /data /usr/local/mariadb-10.3.21-linux-x86_64 /var/lib/mysql
chkconfig --del mysqld
rm -f /etc/init.d/mysqld /etc/my.cnf
userdel mysql
#groupdel mysql
