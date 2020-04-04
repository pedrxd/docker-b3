#!/bin/bash -e

if [ ! -e /config/b3.xml ];  then
  echo "Server config not found, using the default one..."
  mkdir -p /config
  envsubst < /opt/b3/b3-docker.xml > /config/b3.xml
fi

if [[ ! -d "/config/conf" ]]
then
   cp -rp /opt/b3/b3/.conf /config/conf
fi
if [[ ! -d "/config/extplugins" ]]
then
   cp -rp /opt/b3/b3/.extplugins /config/extplugins
fi
if [[ ! -d "/config/parsers" ]]
then
   cp -rp /opt/b3/b3/.parsers /config/parsers
fi

if [[ ! -L "/opt/b3/b3/conf" ]]
then
   ln -s /config/conf /opt/b3/b3/conf
fi
if [[ ! -L "/opt/b3/b3/extplugins" ]]
then
   ln -s /config/extplugins /opt/b3/b3/extplugins
fi
if [[ ! -L "/opt/b3/b3/parsers" ]]
then
   ln -s /config/parsers /opt/b3/b3/parsers
fi

/usr/bin/python /opt/b3/b3_run.py -c /config/b3.xml
