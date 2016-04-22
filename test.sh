#!/bin/bash -e
(while true; do echo "Don't DIE!!!!"; sleep 60; done) & # jobs %1
docker build -t all -f docker/all/Dockerfile docker/all
kill %1

docker run --rm -it all which groovy
docker run --rm -it all groovy --version
docker run --rm -it all bash --login -c 'which groovy'
docker run --rm -it all bash --login -c 'groovy --version'
docker run --rm -it all which gradle
docker run --rm -it all gradle --version
docker run --rm -it all bash --login -c 'which gradle'
docker run --rm -it all bash --login -c 'gradle --version'
docker run --rm -it all which node
docker run --rm -it all node --version
docker run --rm -it all bash --login -c 'which node'
docker run --rm -it all bash --login -c 'node --version'
docker run --rm -it all which codecheck
docker run --rm -it all codecheck
docker run --rm -it all bash --login -c 'which codecheck'
docker run --rm -it all bash --login -c 'codecheck'
