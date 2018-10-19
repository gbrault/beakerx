#!/usr/bin/env bash
docker-compose -f docker-compose.test.yml build sut
docker-compose -f docker-compose.test.yml run sut
