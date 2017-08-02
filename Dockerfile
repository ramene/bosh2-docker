FROM ubuntu:trusty

MAINTAINER Zac Bergquist "zbergquist@pivotal.io"
MAINTAINER Josh Ghiloni "jghiloni@pivotal.io"

#ENV bosh_artifact bosh-cli-2.0.28-linux-amd64
ARG bosh_cli_version
ARG credhub_cli_version
ARG http_proxy
ARG https_proxy

RUN export http_proxy=${http_proxy}
RUN export https_proxy=${https_proxy}
RUN apt-get update -y && \
    apt-get install -y wget build-essential zlibc zlib1g-dev ruby ruby-dev openssl libxslt-dev libxml2-dev libssl-dev libreadline6 libreadline6-dev libyaml-dev libsqlite3-dev sqlite3 git && \
    wget https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/${credhub_cli_version}/credhub-linux-${credhub_cli_version}.tgz && \
    tar zxvf credhub-linux-${credhub_cli_version}.tgz && install credhub /usr/local/bin/credhub && \
    wget https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-${bosh_cli_version}-linux-amd64 && \
    install bosh-cli-${bosh_cli_version}-linux-amd64 /usr/local/bin/bosh && \
    apt-get clean
