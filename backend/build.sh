#!/bin/sh -ex

DIR=$( cd "$( dirname "$0" )" && pwd )
cd ${DIR}

BUILD_DIR=${DIR}/../build/snap/backend
mkdir -p ${BUILD_DIR}

# inconsistent package.json forces runtime dependcies upgrade
cd /opt/meshcentral/meshcentral
npm install --no-audit --no-optional --omit=optional node-forge@1.3.2
npm install --no-audit --no-optional --omit=optional passport@0.7.0
npm install --no-audit --no-optional --omit=optional connect-flash@0.1.1
npm install --no-audit --no-optional --omit=optional openid-client@5.7.1
npm install --no-audit --no-optional --omit=optional ua-client-hints-js@0.1.2

cp -r /etc ${BUILD_DIR}
cp -r /opt ${BUILD_DIR}
cp -r /usr ${BUILD_DIR}
cp -r /bin ${BUILD_DIR}
cp -r /lib ${BUILD_DIR}
cp -r ${DIR}/bin/* ${BUILD_DIR}/bin

rm -r ${BUILD_DIR}/opt/meshcentral/meshcentral-data
ln -s /var/snap/meshcentral/current/meshcentral-data ${BUILD_DIR}/opt/meshcentral/meshcentral-data

cd ${DIR}/../build
#wget https://github.com/cyberb/MeshCentral/archive/refs/heads/master.tar.gz
#tar xf master.tar.gz
#wget https://raw.githubusercontent.com/cyberb/MeshCentral/refs/heads/master/meshcentral.js -O ${BUILD_DIR}/opt/meshcentral/meshcentral/meshcentral.js
#wget https://raw.githubusercontent.com/cyberb/MeshCentral/refs/heads/master/agents/meshcore.js -O ${BUILD_DIR}/opt/meshcentral/meshcentral/agents/meshcore.js
#wget https://raw.githubusercontent.com/cyberb/MeshCentral/refs/heads/master/meshagent.js -O ${BUILD_DIR}/opt/meshcentral/meshcentral/meshagent.js
#wget https://raw.githubusercontent.com/cyberb/MeshCentral/refs/heads/master/webserver.js -O ${BUILD_DIR}/opt/meshcentral/meshcentral/webserver.js

# patch ld
SNAP=/snap/meshcentral/current
mkdir -p $SNAP
ln -s ${BUILD_DIR} $SNAP/backend

LD=$(echo $SNAP/backend/lib/ld-*.so*)
echo $LD
apk add patchelf
SNAP=/snap/meshcentral/current
patchelf \
  --set-interpreter $LD \
  ${BUILD_DIR}/usr/local/bin/node

patchelf \
  --set-rpath $SNAP/backend/usr/lib \
  ${BUILD_DIR}/usr/local/bin/node
