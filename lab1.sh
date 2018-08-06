#!/bin/bash

sudo yum -y update
sudo yum -y groupinstall development

# Installation and setting git.

sudo yum -y install git
mkdir /root/lab1
cd /root/lab1
git init
echo"Git installed"

# Installation and setting rpm-build.

sudo yum -y install rpm-build
mkdir /root/rpmbuild/
mkdir /root/rpmbuild/BUILD/
mkdir /root/rpmbuild/BUILDROOT
mkdir /root/rpmbuild/RPMS/
mkdir /root/rpmbuild/SOURCES/
mkdir /root/rpmbuild/SPECS/
mkdir /root/rpmbuild/SRPMS/
echo "Rpm-build installed"

# Installation python3.6
sudo yum -y install https://centos7.iuscommunity.org/ius-release.rpm
sudo yum -y install python36u
sudo yum -y install python36u-pip
echo " Python installed"

# Installing dependences for Django & Postgresql.

sudo pip3.6 install Django==2.0.8
sudo pip3.6 install psycopg2-binary==2.7.5
sudo pip3.6 install pytz==2018.5
sudo pip3.6 install virtualenv
echo "Dependences for Django & Postgresql installed"

# Installing Postgresql.

yum -y install yum-utils postgresql-server postgresql-contrib
postgresql-setup initdb
systemctl start postgresql
systemctl enable postgresql
echo "Postgresql installed"

# Create database and user

su - postgres -c  'psql -c "CREATE DATABASE test_db;"'
sudo  -u postgres   psql -c "CREATE USER test_user WITH password '12345';"
su - postgres -c 'psql -c "GRANT ALL privileges ON DATABASE test_db TO test_user;"'
echo "User created"
echo "All tasks are done" (edited)
