#!make
IMAGE := lobnek/docker
SHELL := /bin/bash
VERSION := 2.0


.PHONY: help build hub

.DEFAULT: help

help:
	@echo "make build"
	@echo "       Build the docker image."
	@echo "make hub"
	@echo "       Push to Docker Hub"
	@echo "make server"
	@echo "       Fire off the server"

build:
	docker-compose build docker

hub:
	docker build -f Dockerfile --tag ${IMAGE}:latest --no-cache .
	docker push ${IMAGE}:latest
	docker tag ${IMAGE}:latest ${IMAGE}:${VERSION}
	docker push ${IMAGE}:${VERSION}
	docker rmi -f ${IMAGE}:${VERSION}



