#!/usr/bin/env bash
#Code below will set up an DEVELOPER environment

#git clone

#cd app directory

#setup ours app + dependencies
sudo yum -y update
sudo yum -y install python
sudo yum -y install mc
sudo yum -y insall httpd
sudo servce httpd start
echo 'All done!!!'

######
exit 0
