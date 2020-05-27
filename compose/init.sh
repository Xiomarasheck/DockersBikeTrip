export _REPOSITORY_NAME="PR0001_biketrip_production"
export _PROJECT_NAME="Biketrip"
export _PATH="/docker/compose/"
export COMPOSE_PROJECT_NAME= $_REPOSITORY_NAME
export _REF_REPOSITORY="https://github.com/Juandlobaton/Biketrip-App.git"

declare -A arrayRemotes
#arrayRemotes['xgaona']="ssh://git@bitbucket.devops.camtech.com.co:12032/pr0005c001/pr0005cl001_research_xgaona.git"


cd $_PATH$_PROJECT_NAME/$_REPOSITORY_NAME
pwd
#Valida si la carpeta del proyecto se encuentra creada
if [[ -d $_PATH$_PROJECT_NAME ]];
  then
    echo "Directory Project OK";
  else
    mkdir $_PATH$_PROJECT_NAME
    echo "Creation Directory Project OK";
fi;

#Valida si la carpeta del repositorio se encuentra creada
if [ -d $_PATH$_PROJECT_NAME/$_REPOSITORY_NAME ];
  then
    echo "Directory Repository OK"
  else
    mkdir "$_PATH$_PROJECT_NAME/$_REPOSITORY_NAME"
    echo "Creation Repository Project OK"
fi;


#Valida si la carpeta del Volumen se encuentra creada
if [ -d $_PATH$_PROJECT_NAME/$_REPOSITORY_NAME/volumes ];
  then
    echo "Directory Volume OK"
  else
    mkdir "$_PATH$_PROJECT_NAME/$_REPOSITORY_NAME/volumes"
    echo "Creation Directory Volume OK"
fi;

#Valida si la carpeta de la aplicación se encuentra creada
if [ -d $_PATH$_PROJECT_NAME/$_REPOSITORY_NAME/volumes/_app ];
  then
    echo "Directory Application OK"
  else
    mkdir $_PATH$_PROJECT_NAME/$_REPOSITORY_NAME/volumes/_app
    echo "Creation Application Project OK"
fi;

if [ -d $_PATH$_PROJECT_NAME/$_REPOSITORY_NAME/volumes/_postgis ];
  then
    echo "Directory postgis OK"
  else
    mkdir $_PATH$_PROJECT_NAME/$_REPOSITORY_NAME/volumes/_postgis
    echo "Creation postgis Project OK"
fi;



if [ -z ${1} ] && [ -z ${2} ] ;
  then
    source $_PATH$_PROJECT_NAME/$_REPOSITORY_NAME/update_repository.sh
    sleep 2
    source $_PATH$_PROJECT_NAME/$_REPOSITORY_NAME/init_docker.sh
    sleep 2
    #source $_PATH$_PROJECT_NAME/$_REPOSITORY_NAME/volumes/_app/init_project.sh
  else
    source $_PATH$_PROJECT_NAME/$_REPOSITORY_NAME/update_repository.sh  ${1} ${2}
fi;




