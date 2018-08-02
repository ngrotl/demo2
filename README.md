# Demo-1
Project for Demo 1

Strakture as code.
All you have to do is just:

    git clone https://github.com/Kv-042-DevOps/Demo-1
    vagrant up

(vagrant + VBox should be installed previously)

![Shema](https://raw.githubusercontent.com/Kv-042-DevOps/Demo-1/master/sheme.jpg)

cd ~/Projects
mkdir mysite
cd mysite
vagrant init ubuntu/xenial64
vagrant up

vagrant ssh


sudo apt-get update && sudo apt-get dist-upgrade


sudo adduser mysite
sudo adduser mysite sudo

su - mysite


sudo apt install python3-venv
python3 -m venv venv
source venv/bin/activate
pip install django
pip install --upgrade pip



cd ~/Projects/mysite
mkdir mysite

Edit the Vagrantfile.


    config.vm.network "forwarded_port", guest: 8080, host: 8080, host_ip: "127.0.0.1"
    
    config.vm.synced_folder "mysite", "/home/mysite/mysite", owner: "mysite", group: "mysite", mount_options:["dmode=775,fmode=664"]
    
    
vagrant reload

vagrant ssh
su - mysite
source venv/bin/activate
cd mysite
django-admin.py startproject mysite .


python3 manage.py runserver