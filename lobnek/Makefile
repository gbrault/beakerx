#!make
IMAGE := lobnek/docker
SHELL := /bin/bash
VERSION := 1.7


.PHONY: help build hub server


.DEFAULT: help

help:
	@echo "make build"
	@echo "       Build the docker image."
	@echo "make hub"
	@echo "       Push to Docker Hub"
	@echo "make server"
	@echo "       Fire off the server"

build:
	docker-compose build jupyter
	docker-compose build docker

hub:
	docker build -f Dockerfile --tag ${IMAGE}:latest --no-cache .
	docker push ${IMAGE}:latest
	docker tag ${IMAGE}:latest ${IMAGE}:${VERSION}
	docker push ${IMAGE}:${VERSION}
	docker rmi -f ${IMAGE}:${VERSION}


server:
	echo "http://localhost:5555/admin"
	docker-compose run -p "5555:8000" web python start.py

