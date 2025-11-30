#!/bin/sh -ex

DIR=$( cd "$( dirname "$0" )" && pwd )
cd ${DIR}

BUILD_DIR=${DIR}/../build/snap/backend
mkdir -p ${BUILD_DIR}

# inconsistent package.json forces runtime dependcies upgrade
cd /opt/meshcentral/meshcentral
npm install --no-audit --no-optional --omit=optional node-forge@1.3.2

cp -r /etc ${BUILD_DIR}
cp -r /opt ${BUILD_DIR}
cp -r /usr ${BUILD_DIR}
cp -r /bin ${BUILD_DIR}
cp -r /lib ${BUILD_DIR}
cp -r ${DIR}/bin/* ${BUILD_DIR}/bin

cd ${DIR}/../build
wget https://github.com/cyberb/MeshCentral/archive/refs/heads/master.tar.gz
tar xf master.tar.gz
cp MeshCentral-master/meshcentral.js ${BUILD_DIR}/opt/meshcentral/meshcentral/
cp MeshCentral-master/webserver.js ${BUILD_DIR}/opt/meshcentral/meshcentral/
