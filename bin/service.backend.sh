#!/bin/bash -e
/bin/rm -f $SNAP_COMMON/web.socket
export NODE_ENV=production
export MESHCENTRAL_NODE_PATH=$SNAP/backend/bin/node
export NODE_EXTRA_CA_CERTS=/var/snap/platform/current/syncloud.ca.crt
cd $SNAP_DATA
exec $MESHCENTRAL_NODE_PATH $SNAP/backend/opt/meshcentral/meshcentral/meshcentral.js --configfile $SNAP_DATA/config/config.json
