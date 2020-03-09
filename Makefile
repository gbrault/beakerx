#!make
include .env
export

SHELL := /bin/bash
VERSION := 5.3

.PHONY: help build jupyter hub tag

.DEFAULT: help

help:
	@echo "make build"
	@echo "       Build the docker image."
	@echo "make jupyter"
	@echo "       Start the Jupyter server."
	@echo "make hub"
	@echo "       Push to Docker Hub"
	@echo "make tag"
	@echo "       Tag the Github repository"

build:
	docker-compose build jupyterlab

jupyter: build
	echo "http://localhost:${PORT}/lab"
	docker-compose up jupyterlab

hub: tag
	docker push ${IMAGE}:latest
	docker tag ${IMAGE}:latest ${IMAGE}:${VERSION}
	docker push ${IMAGE}:${VERSION}
	docker rmi -f ${IMAGE}:${VERSION}

tag: build
	git tag -a ${VERSION} -m "new tag"
	git push --tags
