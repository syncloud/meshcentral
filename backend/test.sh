#!/bin/bash -ex

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd ${DIR}
SNAP=/snap/meshcentral/current
mkdir -p $SNAP
BUILD_DIR=${DIR}/../build/snap/backend
ln -s ${BUILD_DIR} $SNAP/backend
export PATH=${BUILD_DIR}/usr/local/bin:$PATH
node --version
grep "1.3.2" ${BUILD_DIR}/opt/meshcentral/meshcentral/node_modules/node-forge/package.json
grep "0.7.0" ${BUILD_DIR}/opt/meshcentral/meshcentral/node_modules/passport/package.json
grep "0.1.1" ${BUILD_DIR}/opt/meshcentral/meshcentral/node_modules/connect-flash/package.json
grep "5.7.1" ${BUILD_DIR}/opt/meshcentral/meshcentral/node_modules/openid-client/package.json
grep "0.1.2" ${BUILD_DIR}/opt/meshcentral/meshcentral/node_modules/ua-client-hints-js/package.json

node ${BUILD_DIR}/opt/meshcentral/meshcentral/meshcentral.js --help
