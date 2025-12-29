#!/bin/bash -e
export NODE_ENV=production
export PATH=$SNAP/backend/usr/local/bin:$PATH
export NODE_EXTRA_CA_CERTS=/var/snap/platform/current/syncloud.ca.crt
cd $SNAP_DATA
exec node $SNAP/backend/opt/meshcentral/meshcentral/meshcentral.js --configfile $SNAP_DATA/config/config.json
