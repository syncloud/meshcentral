#!/bin/bash -e
/bin/rm -f $SNAP_COMMON/web.socket
exec $SNAP/backend/bin/node $SNAP/opt/meshcentral/meshcentral/meshcentral --configfile $SNAP_DATA/config/config.json
