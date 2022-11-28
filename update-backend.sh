#!/bin/bash

cd /home/zeus/coduction/famulex-dev

git pull --ff-only
git submodule update --recursive

cd backend

mvn clean package

docker compose up --detach --build