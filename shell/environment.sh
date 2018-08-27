#!/bin/bash

yum -y update
yum -y groupinstall development  # Group which is a predefined bundle of software that can be installed at once, instead of having to install each application separately.

# Installation and setting git.
yum -y install git, mc
# Utils and preparetion to create RPM
yum -y install rpm-build rpm-devel rpmdevtools
cd /home/vagrant/
sudo -u vagrant rpmdev-setuptree
sudo -u vagrant mkdir /tmp/demo2-1

# Installation python3.4
sudo yum -y install https://centos7.iuscommunity.org/ius-release.rpm # IUS provides Red Hat Package Manager (RPM) packages for some newer versions of select software.
sudo yum -y install python34 python34-pip
cd /home/vagrant/
git clone https://github.com/ngrotl/demo2
sudo -u vagrant cp /home/vagrant/demo2/demo2.spec /home/vagrant/rpmbuild/SPECS/
cp /home/vagrant/demo2/Deploy.sh /usr/bin/


pip3 install --upgrade pip
pip3 install virtualenv
virtualenv --python=/usr/bin/python3.4 /home/vagrant/demo
cd /home/vagrant/demo
source bin/activate
pip install Django
#cp -r /home/vagrant/demo2/helloworld/ /home/vagrant/demo/
django-admin startproject helloworld
cd /home/vagrant/demo/helloworld/
python manage.py migrate
sudo chown -R vagrant: /home/vagrant/
python manage.py runserver 0:8000
