#!/bin/bash -e
/bin/rm -f $SNAP_COMMON/web.socket
cd $SNAP/backend/opt/meshcentral/meshcentral
exec $SNAP/backend/bin/node meshcentral.js --configfile $SNAP_DATA/config/config.json
