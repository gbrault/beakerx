#!make
IMAGE := lobnek/jupyter
SHELL := /bin/bash
VERSION := 2.9

include .env
export

.PHONY: help build jupyter hub


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

jupyter: build
	echo "http://localhost:${PORT}"
	docker-compose up jupyter

hub:
	docker build -f Dockerfile --tag ${IMAGE}:latest --no-cache --target builder .
	docker push ${IMAGE}:latest
	docker tag ${IMAGE}:latest ${IMAGE}:${VERSION}
	docker push ${IMAGE}:${VERSION}
	docker rmi -f ${IMAGE}:${VERSION}
