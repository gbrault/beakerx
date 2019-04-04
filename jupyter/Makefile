#!make
IMAGE_JUPYTER := lobnek/jupyter
IMAGE_
SHELL := /bin/bash
VERSION := 2.9

include .env
export

.PHONY: help build jupyter tag hub


.DEFAULT: help

help:
	@echo "make build"
	@echo "       Build the docker image."
	@echo "make jupyter"
	@echo "       Start the Jupyter server."
	@echo "make tag"
	@echo "       Make a tag on Github."
	@echo "make hub"
	@echo "       Push to Docker Hub"
	@echo "make server"
	@echo "       Fire off the server"

build:
	docker-compose build jupyter
	docker-compose build docker

jupyter: build
	echo "http://localhost:${PORT}"
	docker-compose up jupyter

tag:
	git tag -a ${VERSION} -m "new tag"
	git push --tags

hub: tag
	docker build -f Dockerfile --tag ${IMAGE}:latest --no-cache --target builder .
	docker push ${IMAGE}:latest
	docker tag ${IMAGE}:latest ${IMAGE}:${VERSION}
	docker push ${IMAGE}:${VERSION}
	docker rmi -f ${IMAGE}:${VERSION}
