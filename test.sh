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
docker run --rm -it all type composer
docker run --rm -it all which composer
docker run --rm -it all composer --version
docker run --rm -it all bash --login -c 'type composer'
docker run --rm -it all bash --login -c 'which composer'
docker run --rm -it all bash --login -c 'composer --version'
docker run --rm -it all type scala
docker run --rm -it all which scala
docker run --rm -it all scala -v
docker run --rm -it all bash --login -c 'type scala'
docker run --rm -it all bash --login -c 'which scala'
docker run --rm -it all bash --login -c 'scala -v'
docker run --rm -it all which sbt
docker run --rm -it all sbt sbt-version
docker run --rm -it all bash --login -c 'type sbt'
docker run --rm -it all bash --login -c 'which sbt'
docker run --rm -it all bash --login -c 'sbt sbt-version'
docker run --rm -it all type  go
docker run --rm -it all which go
docker run --rm -it all go version
docker run --rm -it all bash --login -c 'type go'
docker run --rm -it all bash --login -c 'which go'
docker run --rm -it all bash --login -c 'go version'
