#!/bin/sh -e

OUTPUT_DIR=`pwd`/bosh-cli-version
SOURCE_DIR=`pwd`/source
RELEASE_DIR=`pwd`/bosh2-cli

version=`cat ${RELEASE_DIR}/version | sed -e 's/^v//'`

echo "{\"version\": \"${version}\"}" > $OUTPUT_DIR/version.json
