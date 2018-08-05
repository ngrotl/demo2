#!/usr/bin/env bash
#Code below will set up an BUILDER environment

# Preparation
#sudo yum -y update
sudo yum -y install createrepo
sudo yum  -y install git
sudo curl http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -o epel-release-latest-7.noarch.rpm
sudo rpm -ivh epel-release-latest-7.noarch.rpm
sudo yum install -y proftpd openssl proftpd-utils
sudo groupadd ftpgroup
# add user 'prod' with pass IAMprod
sudo useradd  -G ftpgroup prod -p '$1$1JCYSfOz$3Fu.VHwYYf0ubCU0PpO800' -s /sbin/nologin -d /ftpshare
sudo usermod -a -G ftpgroup vagrant
sudo chown prod:ftpgroup /ftpshare/
sudo rm -rf /ftpshare/.*
sudo chmod -R 770 /ftpshare/
sudo openssl req -x509 -nodes -newkey rsa:1024 -subj "/C=UK/ST=Warwickshire/L=Leamington/O=OrgName/OU=IT Department/CN=example.com" -keyout /etc/pki/tls/certs/proftpd.pem -out /etc/pki/tls/certs/proftpd.pem
sudo sed -i '1 i\Define TLS' /etc/proftpd.conf
sudo sed -i '304 i\  TLSOptions NoSessionReuseRequired' /etc/proftpd.conf
sudo systemctl start proftpd
sudo echo ddddf > /ftpshare/d.txt
cd ~
git clone https://github.com/Kv-042-DevOps/Demo-1 


exit 0
