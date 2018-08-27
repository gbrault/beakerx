#!/usr/bin/env bash
docker build --file Dockerfile --no-cache --target test --tag docker:test .

docker run --name test-postgresql -e POSTGRES_PASSWORD=test -d postgres:9.6

docker run --name test-influxdb -d influxdb:1.5.4

# run all tests, seems to be slow on teamcity
docker run --link test-postgresql --link test-influxdb --rm docker:test

ret=$?

docker rmi -f docker:test
docker rm -f test-postgresql
docker rm -f test-influxdb

exit $ret

