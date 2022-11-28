#!/bin/bash

git pull --ff-only
git submodule update --recursive

cd /home/zeus/coduction/famulex-dev/keycloak

mvn clean package

docker compose up --detach --build