#!/bin/bash


type wget >/dev/null 2>&1 || yum install -y wget


echo '===start install php-7.1.5==='
wget -O php7.tar.gz http://cn2.php.net/get/php-7.1.5.tar.gz/from/this/mirror
echo '===end install php-7.1.5'

mv php7.tar.gz /usr/local/php7.tar.gz

cd /usr/local

echo '===start tar php==='
tar -zxvf php7.tar.gz
echo '===end tar php==='


cd php-7.1.5


echo '===start install Dependency package==='
type epel-release >/dev/null 2>&1 || yum install -y epel-release && yum update -y

yum install -y libxml2 libxml2-devel openssl openssl-devel bzip2 bzip2-devel libcurl libcurl-devel libjpeg libjpeg-devel libpng libpng-devel freetype freetype-devel gmp gmp-devel libmcrypt libmcrypt-devel readline readline-devel libxslt libxslt-devel
echo '===en install Dependency package==='

echo '===start configure php==='
./configure  --prefix=/usr/local/php  --with-config-file-path=/usr/local/php/etc  --enable-fpm  --with-fpm-user=nginx  --with-fpm-group=nginx  --enable-inline-optimization  --disable-debug  --disable-rpath  --enable-shared  --enable-soap  --with-libxml-dir  --with-xmlrpc  --with-openssl  --with-mcrypt  --with-mhash  --with-pcre-regex  --with-sqlite3  --with-zlib  --enable-bcmath  --with-iconv  --with-bz2  --enable-calendar  --with-curl  --with-cdb  --enable-dom  --enable-exif  --enable-fileinfo  --enable-filter  --with-pcre-dir  --enable-ftp  --with-gd  --with-openssl-dir  --with-jpeg-dir  --with-png-dir  --with-zlib-dir  --with-freetype-dir  --enable-gd-native-ttf  --enable-gd-jis-conv  --with-gettext  --with-gmp  --with-mhash  --enable-json  --enable-mbstring  --enable-mbregex  --enable-mbregex-backtrack  --with-libmbfl  --with-onig  --enable-pdo  --with-mysqli=mysqlnd  --with-pdo-mysql=mysqlnd  --with-zlib-dir  --with-pdo-sqlite  --with-readline  --enable-session  --enable-shmop  --enable-simplexml --enable-sockets --enable-sysvmsg --enable-sysvsem --enable-sysvshm --enable-wddx --with-libxml-dir --with-xsl --enable-zip --enable-mysqlnd-compression-support --with-pear --enable-opcache
echo '===end configure php==='


echo '===start make'
make
echo '===end make==='

if [ $? -eq 0 ]
then

echo '===start make install==='
make install
echo '==end make install==='

fi

echo '===start configure environment variable==='
echo 'PATH=$PATH:/usr/local/php/bin' >> /etc/profile
echo 'export PATH' >> /etc/profile

source /etc/profile



echo '===start configure php-fpm==='
cp php.ini-production /usr/local/php/etc/php.ini
cp /usr/local/php/etc/php-fpm.conf.default /usr/local/php/etc/php-fpm.conf
cp /usr/local/php/etc/php-fpm.d/www.conf.default /usr/local/php/etc/php-fpm.d/www.conf
cp sapi/fpm/init.d.php-fpm /etc/init.d/php-fpm
chmod +x /etc/init.d/php-fpm



















