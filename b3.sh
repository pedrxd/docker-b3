#!/bin/bash -e

if [ ! -e /b3config/b3.xml ];  then
  echo "Server config not found, using the default one..."
  mkdir -p /b3config
  envsubst < /opt/b3/b3-docker.xml > /b3config/b3.xml
fi

if [[ ! -d "/b3config/conf" ]]
then
   cp -rp /opt/b3/b3/.conf /b3config/conf
fi
if [[ ! -d "/b3config/extplugins" ]]
then
   cp -rp /opt/b3/b3/.extplugins /b3config/extplugins
fi
if [[ ! -d "/b3config/parsers" ]]
then
   cp -rp /opt/b3/b3/.parsers /b3config/parsers
fi

if [[ ! -L "/opt/b3/b3/conf" ]]
then
   ln -s /b3config/conf /opt/b3/b3/conf
fi
if [[ ! -L "/opt/b3/b3/extplugins" ]]
then
   ln -s /b3config/extplugins /opt/b3/b3/extplugins
fi
if [[ ! -L "/opt/b3/b3/parsers" ]]
then
   ln -s /b3config/parsers /opt/b3/b3/parsers
fi

/usr/bin/python /opt/b3/b3_run.py -c /b3config/b3.xml
