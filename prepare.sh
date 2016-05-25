#!/bin/sh

wget -c https://github.com/mesosphere/mesos-dns/releases/download/v0.5.2/mesos-dns-v0.5.2-linux-amd64
mv mesos-dns-v0.5.2-linux-amd64 mesos-dns

if [ ! -d adminrouter ]; then
  git clone https://github.com/dcos/adminrouter
else
  cd adminrouter
  git pull
  cd ..
fi
