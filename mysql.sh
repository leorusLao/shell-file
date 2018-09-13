#!/bin/bash


type wget >/dev/null 2>&1 || yum install -y wget

echo '===start download mysql.rpm==='
wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
echo '===end download mysql.rpm==='

rpm -ivh mysql-community-release-el7-5.noarch.rpm

if [ $? -eq 0 ]
then

rm -f mysql-community-release-el7-5.noarch.rpm

fi

echo '===start install mysql==='
yum install -y mysql-server
echo '===end install mysql==='

rm -f mysql-community-release-el7-5.noarch.rpm

echo 'complete'






