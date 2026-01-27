#!/bin/bash


if [ "$#" -ne 2 ]; then
    exit 1
fi

GIT_REPO=$1
DOCKER_REPO=$2

echo "Klonowanie https://github.com/$GIT_REPO "
git clone https://github.com/$GIT_REPO.git ./temp-project

cd ./temp-project 

echo "Budowanie $DOCKER_REPO "
docker build -t "$DOCKER_REPO" .

echo "Wysylanie obrazu do Docker Hub"
docker push "$DOCKER_REPO"


cd ..
rm -rf ./temp-project

