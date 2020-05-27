#!/bin/bash


#Actualiza Docker compose
cd $_PATH$_PROJECT_NAME/$_REPOSITORY_NAME
docker-compose stop
docker-compose down --volumes
docker-compose build
docker-compose up -d --force-recreate

