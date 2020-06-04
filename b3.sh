#!/bin/bash -e

if [ ! -e /opt/b3/b3.xml ]; then
    echo "Server config not found, using the default one..."
    envsubst < /opt/b3/b3-docker.xml > /opt/b3/b3.xml
fi

/usr/bin/python /opt/b3/b3_run.py -c /opt/b3/b3.xml
