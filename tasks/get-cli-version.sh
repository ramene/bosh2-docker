#!/bin/sh -e

OUTPUT_DIR=`pwd`/bosh-cli-version
SOURCE_DIR=`pwd`/source
BOSH_RELEASE_DIR=`pwd`/bosh2-cli
CREDHUB_RELEASE_DIR=`pwd`/credhub-cli

bosh_cli_version=`cat ${BOSH_RELEASE_DIR}/version | sed -e 's/^v//'`
credhub_cli_version=`cat ${CREDHUB_RELEASE_DIR}/version`

cat <<EOF > $OUTPUT_DIR/bosh_cli_version.json
{
  "bosh_cli_version": "${bosh_cli_version}",
  "credhub_cli_version": "${credhub_cli_version}",
  "http_proxy": "${http_proxy}",
  "https_proxy": "${https_proxy}"
}
EOF
