#!/bin/bash
#eval $(keychain --eval zeus)
#export NVM_DIR=~/.nvm
#source ~/.nvm/nvm.sh

cd /home/zeus/coduction/famulex-dev

git pull --ff-only
git submodule update --recursive

cd frontend

npm install -f
npm run build

docker compose up --detach --build
