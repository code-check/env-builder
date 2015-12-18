#!/bin/bash -e
(while true; do echo "Don't DIE!!!!"; sleep 60; done) & # jobs %1
docker build -t all -f docker/all/Dockerfile --build-arg branch=${CIRCLE_BRANCH} docker/all
kill %1
