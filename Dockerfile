FROM ubuntu:16.04

RUN apt-get update && apt-get -y install jq nginx-extras lua-cjson && rm -rf /var/lib/apt/lists/*

COPY mesos-dns-template.conf /mesos-dns-template.conf
COPY adminrouter /etc/nginx/conf
RUN cp /etc/nginx/mime.types /etc/nginx/conf/mime.types
COPY mesos-dns /mesos-dns
COPY runner.sh /runner.sh

CMD ["./runner.sh"]
