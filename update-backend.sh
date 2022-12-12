#!/bin/bash
eval $(keychain --eval zeus)

cd /home/zeus/coduction/famulex-dev

git pull --ff-only
git submodule update --recursive

cd backend

mvn -B clean package

docker compose down
docker compose build
docker compose up -d
