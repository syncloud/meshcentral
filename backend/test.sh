#!/bin/bash -ex

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd ${DIR}

BUILD_DIR=${DIR}/../build/snap/backend
${BUILD_DIR}/bin/node --version
ls -la ${BUILD_DIR}/opt/meshcentral/meshcentral/node_modules | grep node-forge
${BUILD_DIR}/bin/node ${BUILD_DIR}/opt/meshcentral/meshcentral/meshcentral.js --help
