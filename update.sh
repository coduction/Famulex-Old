#!/bin/bash

eval `ssh-agent`
ssh-add ~/.ssh/zeus

docker-compose down
git pull --recurse-submodules

COMPOSE_DOCKER_CLI_BUILD=1 docker-compose build

docker-compose up -d
