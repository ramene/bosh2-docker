FROM ubuntu:trusty

MAINTAINER Zac Bergquist "zbergquist@pivotal.io"
MAINTAINER Josh Ghiloni "jghiloni@pivotal.io"

ARG bosh_cli_version
ARG credhub_cli_version

RUN apt-get update -y && \
    apt-get install -y wget ruby ruby-dev openssl python git && \
    wget https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/${credhub_cli_version}/credhub-linux-${credhub_cli_version}.tgz && \
    tar zxvf credhub-linux-${credhub_cli_version}.tgz && install credhub /usr/local/bin/credhub && \
    wget https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-${bosh_cli_version}-linux-amd64 && \
    install bosh-cli-${bosh_cli_version}-linux-amd64 /usr/local/bin/bosh && \
    pip install python-openstackclient && \
    apt-get clean
