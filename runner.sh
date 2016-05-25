#!/bin/sh

set -e

if [ $# -lt 1 ]; then
  echo "Need mesos master IP"
  exit 1
fi

cat /etc/resolv.conf

cat /mesos-dns-template.conf | jq ".zk = \"zk://${1}:2181/mesos\" | .masters = [\"${1}:5050\"] | .resolvers = [\"8.8.8.8\"]" > /mesos-dns.conf

/mesos-dns -config /mesos-dns.conf &

cat /etc/nginx/conf/nginx.conf | sed -e 's/^\s*resolver.*/resolver 127.0.0.1:53;/g' > /etc/nginx/conf/nginx.conf.dns

sleep 1

nginx -p /etc/nginx -c /etc/nginx/conf/nginx.conf.dns -g 'daemon off;'
