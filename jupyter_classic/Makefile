#!make
IMAGE := lobnek/jupyterx
SHELL := /bin/bash
VERSION := 5.2

.PHONY: help build jupyter jupyterlab hub


.DEFAULT: help

help:
	@echo "make build"
	@echo "       Build the docker image."
	@echo "make jupyter"
	@echo "       Start the Jupyter server."
	@echo "make hub"
	@echo "       Push to Docker Hub"

build:
	docker-compose build jupyter

build-lab:
	docker-compose build jupyterlab

jupyter: build
	echo "http://localhost:8861"
	docker-compose up jupyter

jupyterlab: build-lab
	echo "http://localhost:8862/lab"
	docker-compose up jupyterlab

hub: tag
	docker push ${IMAGE}:latest
	docker tag ${IMAGE}:latest ${IMAGE}:${VERSION}
	docker push ${IMAGE}:${VERSION}
	docker rmi -f ${IMAGE}:${VERSION}

tag: build-lab
	git tag -a ${PROJECT_VERSION} -m "new tag"
	git push --tags
