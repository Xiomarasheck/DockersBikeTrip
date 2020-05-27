# DockersBikeTrip
Almacenamiento de Dockers para el Proyecto BIKETRIP


CENTOS 7 

sudo yum install -y yum-utils device-mapper-persistent-data lvm2 

sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo 

sudo yum install docker 

sudo systemctl start docker 

sudo systemctl enable docker 

#Docker compose https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-centos-7

sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

docker-compose --version



#BASE DE DATOS postgres

HOST:35.208.230.115

PORT:10051

POSTGRES_USER: postgres

VERSION: postgres (PostgreSQL) 9.6.17



#BASE DE DATOS postgis

HOST:35.208.230.115

PORT:10050

POSTGRES_USER: postgres

VERSION: postgres (PostgreSQL) 11.2 (Debian 11.2-1.pgdg90+1)




#SERVIDOR DJANGO

HOST:35.208.230.115

PORT:10052
