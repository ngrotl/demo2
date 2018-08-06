#!/bin/bash
# watchdog script for builder
REPODIR=/ftpshare
GITDIR=/root/Demo-1/RPMForLink
RPMNAME=demo-1-1-1.noarch.rpm
cd /root/hello-world; git pull
        if [[ $GITDIR/$RPMNAME -nt $REPODIR/$RPMNAME ]]; then
        cp $GITDIR/$RPMNAME $REPODIR
        fi
