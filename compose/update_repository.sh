#!/bin/bash
export _REPOSITORY_NAME_MERGE=$2

cd $_PATH$_PROJECT_NAME/$_REPOSITORY_NAME/volumes/_app

#Valida si la carpeta del proyecto se encuentra vacia
if [ "$(ls -A  $_PATH$_PROJECT_NAME/$_REPOSITORY_NAME/volumes/_app/backend)" ];
  then
    git pull origin master
    git checkout master
  else
    git clone $_REF_REPOSITORY .

    for remote in "${!arrayRemotes[@]}"
    do
      git remote add $remote ${arrayRemotes[$remote]}
      git checkout -b $remote
    done
    echo "Repositorio clonado"
fi;

if [ -z ${1} ];
  then
    echo Sin parámetros
  else
    if test "${arrayRemotes[$_REPOSITORY_NAME_MERGE]+isset}"
      then
        git checkout $_REPOSITORY_NAME_MERGE
        git pull $_REPOSITORY_NAME_MERGE master
        git merge master
        git checkout master
        git merge $_REPOSITORY_NAME_MERGE
      else
        echo "Repositorio no pudo ser encontrado"
    fi;
fi;

