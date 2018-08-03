#!/usr/bin/env bash
#Code below will set up an DEVELOPER environment

#git clone

#cd app directory

#setup ours app + dependencies
sudo yum -y update
sudo yum -y install python 
sudo yum -y install mc
sudo yum -y intsall httpd
sudo service httpd start
echo 'All done!!!'

#install postgres
yum -y install yum-utils postgresql-server postgresql-contrib
ostgresql-setup initdb
systemctl start postgresql
systemctl enable postgresql
#create database and user
su - postgres -c  'psql -c "CREATE DATABASE test_db;"'
sudo  -u postgres   psql -c "CREATE USER test_user WITH password '12345';"
su - postgres -c  'psql -c "GRANT ALL privileges ON DATABASE test_db TO test_user;"'
#modifed file /var/lib/pgsql/data/pg_hba.conf  for connetn to database use password
sed  's/127.0.0.1\/32            ident/127.0.0.1\/32            md5/g'  /var/lib/pgsql/data/pg_hba.conf -i

#install python3 pip end  virtualenv
yum -y groupinstall development
yum -y install https://centos7.iuscommunity.org/ius-release.rpm
yum -y install python34 python-pip
pip  install --upgrade pip
pip install virtualenv



######
exit 0
