#!/bin/sh

if [[ -f "/init/settings.js" ]]; then
    cp /init/settings.js /data/settings.js || true
fi

if [[ -f "/init/packages.txt" ]]; then
    cat /init/packages.txt | xargs npm install
    # consolidate again if we mounted in an volume
    npm install
fi

exec /usr/src/node-red/entrypoint.sh
