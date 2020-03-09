#!make
include .env
export

IMAGE := {IMAGE}
SHELL := /bin/bash
VERSION := 5.3

.PHONY: help build jupyter jupyterlab hub

.DEFAULT: help

help:
	@echo "make build"
	@echo "       Build the docker image."
	@echo "make jupyter"
	@echo "       Start the Jupyter server."
	@echo "make hub"
	@echo "       Push to Docker Hub"

build-lab:
	docker-compose up jupyterlab

jupyterlab: build-lab
	echo "http://localhost:${PORT}/lab"
	docker-compose up jupyterlab

hub: tag
	docker push ${IMAGE}:latest
	docker tag ${IMAGE}:latest ${IMAGE}:${VERSION}
	docker push ${IMAGE}:${VERSION}
	docker rmi -f ${IMAGE}:${VERSION}

tag: build-lab
	git tag -a ${VERSION} -m "new tag"
	git push --tags
