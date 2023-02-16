#!/bin/bash

mkdir ./mods
cd ./mods

for jar in `cat /tmp/mods.txt`; do
    echo "Downloading $jar"
    curl -O $jar
done

cd ..
curl -OJ https://meta.fabricmc.net/v2/versions/loader/1.18.2/0.14.14/0.11.1/server/jar
