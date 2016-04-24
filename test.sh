#!/bin/bash -e
(while true; do echo "Don't DIE!!!!"; sleep 60; done) & # jobs %1
docker build -t all -f docker/all/Dockerfile docker/all
kill %1

docker run -it all which groovy
docker run -it all groovy --version
docker run -it all bash --login -c 'which groovy'
docker run -it all bash --login -c 'groovy --version'
docker run -it all which gradle
docker run -it all gradle --version
docker run -it all bash --login -c 'which gradle'
docker run -it all bash --login -c 'gradle --version'
docker run -it all which node
docker run -it all node --version
docker run -it all bash --login -c 'which node'
docker run -it all bash --login -c 'node --version'
docker run -it all type codecheck
docker run -it all which codecheck
docker run -it all bash --login -c 'type codecheck'
docker run -it all bash --login -c 'which codecheck'
docker run -it all type composer
docker run -it all which composer
docker run -it all composer --version
docker run -it all bash --login -c 'type composer'
docker run -it all bash --login -c 'which composer'
docker run -it all bash --login -c 'composer --version'
docker run -it all type scala
docker run -it all which scala
docker run -it all scala -v
docker run -it all bash --login -c 'type scala'
docker run -it all bash --login -c 'which scala'
docker run -it all bash --login -c 'scala -v'
docker run -it all which sbt
docker run -it all sbt sbt-version
docker run -it all bash --login -c 'type sbt'
docker run -it all bash --login -c 'which sbt'
docker run -it all bash --login -c 'sbt sbt-version'
docker run -it all type  go
docker run -it all which go
docker run -it all go version
docker run -it all bash --login -c 'type go'
docker run -it all bash --login -c 'which go'
docker run -it all bash --login -c 'go version'
