#!/usr/bin/env bash
image='lobnek/jupyter'

# https://stackoverflow.com/questions/27643017/do-i-need-to-manually-tag-latest-when-pushing-to-docker-public-repository
docker build -f ./Dockerfile-Jupyter --tag ${image}:latest --no-cache .
docker push ${image}:latest

VERSION='v1.1'
echo ${VERSION}

docker tag ${image} ${image}:${VERSION}
docker push ${image}:${VERSION}
docker rmi -f ${image}:${VERSION}

