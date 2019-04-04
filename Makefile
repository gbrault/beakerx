#!make
SHELL := /bin/bash
VERSION := 0.4

.PHONY: help tag


.DEFAULT: help

help:
	@echo "make tag"
	@echo "       Make a tag on Github."

tag:
	git tag -a ${VERSION} -m "new tag"
	git push --tags

