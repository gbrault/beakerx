#!/usr/bin/env bash
image='lobnek/jupyter'

# https://stackoverflow.com/questions/27643017/do-i-need-to-manually-tag-latest-when-pushing-to-docker-public-repository
docker build -f ./Dockerfile-Jupyter --no-cache --tag ${image}:latest .
docker push ${image}:latest

VERSION='v2.4'
echo ${VERSION}

docker tag ${image} ${image}:${VERSION}
docker push ${image}:${VERSION}
docker rmi -f ${image}:${VERSION}

