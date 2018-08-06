#!/bin/bash

sudo yum -y update
sudo yum -y groupinstall development  # Group which is a predefined bundle of software that can be installed at once, instead of having to install each application separately.

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
sudo yum -y install https://centos7.iuscommunity.org/ius-release.rpm # IUS provides Red Hat Package Manager (RPM) packages for some newer versions of select software.
sudo yum -y install python34 python-pip

# Install pip, which will manage software packages for Python.
echo " Python installed"

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

# Installing dependences for Django & Postgresql.

sudo pip3.6 install virtualenv # Is a tool to create isolated Python environments.
virtualenv -p python3 --no-site-packages env # Create virtualenv with python 3 without defaul requirements in new folder "env".
source ./env # Start vurtualenv.
pip3.6 install Django==2.0.8 # Django install with curren version.
pip3.6 install psycopg2-binary==2.7.5 # Python-PostgreSQL Database Adapter.
pip3.6 install pytz==2018.5 # This library allows accurate and cross platform timezone calculations using Python 2.4 or higher.
deactivate # Exit virtualenv.
echo "Dependences for Django & Postgresql installed"

echo "All tasks are done" (edited)
