#!/bin/bash


yum install -y gcc-c++ pcre pcre-devel zlib zlib-devel openssl openssl-devel

wget -O nginx.tar.gz https://nginx.org/download/nginx-1.10.1.tar.gz


mv nginx.tar.gz /usr/local/nginx.tar.gz

cd /usr/local


echo '===start tar nginx ========'
tar -zxvf nginx.tar.gz > /dev/null
echo '===end tar nginx ======='

cd nginx-1.10.1


echo '===start configure nginx======= '
./configure
echo '===end configure nginx======= '


echo '===start make==='
make


if [ $? -eq 0 ]
then

echo '===start make install==='
make install

echo '===end make install==='

fi






