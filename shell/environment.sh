#!/bin/bash

yum -y update
yum -y groupinstall development  # Group which is a predefined bundle of software that can be installed at once, instead of having to install each application separately.

# Installation and setting git.

yum -y install git 
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

# Installation python3.4
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

echo "modifed file /var/lib/pgsql/data/pg_hba.conf  for connect to database use password"
sed  's/127.0.0.1\/32            ident/127.0.0.1\/32            md5/g'  /var/lib/pgsql/data/pg_hba.conf -i
# restart postgres 
systemctl restart postgresql.service

pip install --upgrade pip
pip install virtualenv # Is a tool to create isolated Python environments.

mkdir /var/www/lab1 -p
cd /var/www/lab1/
cp -r /tmp/app/*  .
virtualenv -p python3 --no-site-packages .env # Create virtualenv with python 3 without defaul requirements in new folder "env".
source .env/bin/activate # Start vurtualenv.
# installing dependencies for application
pip install -r requirements.txt
python manage.py migrate 

deactivate # Exit virtualenv.

echo "All tasks are done"
