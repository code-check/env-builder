#!/bin/bash -e
(while true; do echo "Don't DIE!!!!"; sleep 60; done) & # jobs %1
docker build -t all -f docker/all/Dockerfile docker/all
kill %1

docker run -it all bash groovy
docker run -it all bash --login -c 'groovy'
