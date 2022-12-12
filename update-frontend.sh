#!/bin/bash
eval $(keychain --eval zeus)

cd /home/zeus/coduction/famulex-dev

git pull --ff-only
git submodule update --recursive

cd frontend

npm install -f
npm run build

docker compose down
docker compose build
docker compose up --detach
