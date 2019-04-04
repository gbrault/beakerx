#!make
IMAGE_JUPYTER := lobnek/jupyter
IMAGE_
SHELL := /bin/bash
VERSION := 2.9

include .env
export

.PHONY: help build test teamcity jupyter tag hub server


.DEFAULT: help

help:
	@echo "make build"
	@echo "       Build the docker image."
	@echo "make test"
	@echo "       Build the docker image for testing and run them."
	@echo "make teamcity"
	@echo "       Run tests, build a dependency graph and construct the documentation."
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

test:
	mkdir -p artifacts
	docker-compose -f docker-compose.test.yml build sut
	docker-compose -f docker-compose.test.yml run sut

teamcity: test

jupyter: build
	echo "http://localhost:${PORT}"
	docker-compose up jupyter


tag: test
	git tag -a ${VERSION} -m "new tag"
	git push --tags

hub: tag
	docker build -f jupyter/Dockerfile --tag ${IMAGE}:latest --no-cache --target builder .
	docker push ${IMAGE}:latest
	docker tag ${IMAGE}:latest ${IMAGE}:${VERSION}
	docker push ${IMAGE}:${VERSION}
	docker rmi -f ${IMAGE}:${VERSION}


server:
	echo "http://localhost:5555/admin"
	docker-compose run -p "5555:8000" web python start.py

