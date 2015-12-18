#!/bin/bash -e
(while true; do echo "Don't DIE!!!!"; sleep 60; done) & # jobs %1
docker build --build-arg CLONE_BRANCH=${CIRCLE_BRANCH} -t all -f docker/all/Dockerfile docker/all
kill %1
