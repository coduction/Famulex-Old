#!/bin/bash

git pull --ff-only
git submodule update --recursive

cd backend

mvn clean package

docker compose up --detach --build