cp /home/vagrant/Demo-1/app /root/rpmbuild/BUILDROOT/app

mv /root/rpmbuild/BUILDROOT/demo-1-1-1.noarch.rpm /home/vagrant/Demo-1/RPMForLink/demo-1-1-1.noarch.rpm

cd /home/vagrant/Demo-1/

git pull && git push -u origun master