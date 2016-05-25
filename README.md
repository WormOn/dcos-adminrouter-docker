# dcos-adminrouter-docker

Run a dcos adminrouter in a docker container.

## Example usage

    docker run -it --dns=127.0.0.1 --dns-search=mesos m0ppers/dcos-adminrouter /runner.sh 172.17.0.2

This would run the adminrouter connecting to a mesos master at 172.17.0.2.

As the adminrouter has a mesos dns bundled you need to override the dns server

## Building

    ./prepare.sh
    docker build -t yourimagename .
