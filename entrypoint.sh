#!/bin/bash

neofetch --config /etc/neo.conf

if [[ -f /minecraft/.DO_NOT_DELETE ]] 
then
  /usr/lib/jvm/jre-17/bin/java -jar fabric-server-mc.1.18.2-loader.0.14.14-launcher.0.11.1.jar nogui
else
  echo "Initializing Container, Please Wait" 
  cp -vR /app/* /minecraft/
  touch /minecraft/.DO_NOT_DELETE
  cd /minecraft/
  /usr/lib/jvm/jre-17/bin/java -jar fabric-server-mc.1.18.2-loader.0.14.14-launcher.0.11.1.jar nogui
fi