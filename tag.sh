#!/usr/bin/env bash
### build the image locally (faster than going through dockerhub. Dockerhub often times out...)
docker build --tag lobnek/docker .

### tags an existing image and pushes it to dockerhub where it shows up with the tag
docker tag lobnek/docker lobnek/docker:v0.7
docker push lobnek/docker
