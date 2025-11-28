#!/bin/sh -ex

DIR=$( cd "$( dirname "$0" )" && pwd )
cd ${DIR}

VERSION=$1

BUILD_DIR=${DIR}/../build/snap/node
mkdir -p ${BUILD_DIR}
cp -r /usr ${BUILD_DIR}
rm -rf ${BUILD_DIR}/usr/src
cp ${DIR}/bin/* ${BUILD_DIR}/bin/
