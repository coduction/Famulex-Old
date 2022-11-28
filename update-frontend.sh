#!/bin/bash

git pull --ff-only
git submodule update --recursive

cd frontend

npm install -f
npm run build

docker compose up --detach --build