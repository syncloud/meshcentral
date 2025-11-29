#!/bin/bash -e
/bin/rm -f $SNAP_COMMON/web.socket
exec $SNAP/backend/bin/node $SNAP/backend/opt/meshcentral/meshcentral/meshcentral.js --configfile $SNAP_DATA/config/config.json
