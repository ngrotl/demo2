#!/bin/bash
cp /home/vagrant/demo/helloworld/polls/views.py /tmp/demo2-1/
cd /tmp/
tar -czvf demo2-1.tar.gz demo2-1
mv /tmp/demo2-1.tar.gz /home/vagrant/rpmbuild/SOURCES/
cd /home/vagrant/rpmbuild/
rpmbuild -bb SPECS/demo2.spec
