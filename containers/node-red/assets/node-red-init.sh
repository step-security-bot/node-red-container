#!/bin/sh

if [[ -f "/init/settings.js" ]]; then
    cp /init/settings.js /data/settings.js
fi

if [[ -f "/init/packages.txt" ]]; then
    cat /init/packages.txt | xargs npm install
fi

exec /usr/src/node-red/entrypoint.sh