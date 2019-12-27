useradd -s /sbin/nologin -M mysql
tar xf mariadb-10.3.21-linux-x86_64.tar.gz
ln -sv mariadb-10.3.21-linux-x86_64 mysql
cd mysql
chown -R mysql:mysql .
mkdir /data
chown -R mysql:mysql /data/
#./scripts/mysql_install_db --user=mysql --datadir=/data --basedir=/usr/local/mysql
./scripts/mysql_install_db --user=mysql --datadir=/data 
cp ./support-files/mysql.server /etc/init.d/mysqld
chmod +x /etc/init.d/mysqld
echo 'export PATH=/usr/local/mysql/bin:$PATH' >  /etc/profile.d/mysql.sh
source /etc/profile.d/mysql.sh
sed -i '45cbasedir=\/usr\/local\/mysql'  /etc/init.d/mysqld
sed -i '46cdatadir=\/data'  /etc/init.d/mysqld
chkconfig --add mysqld 
service mysqld start
mysql -uroot -e "grant all privileges on *.* to 'root'@'%' identified by '123456';"
#mysql -uroot -e "grant all privileges on *.* to 'root'@'localhost' identified by '123456';" 
mysql_secure_installation <<EOF

Y
123456
123456
Y
n
Y
Y
EOF
mysql -uroot -p123456 mysql -e "select host,user,password from user;"

