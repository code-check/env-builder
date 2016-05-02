#!/bin/bash -e

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
docker run --rm -it all which composer
docker run --rm -it all composer --version
docker run --rm -it all bash --login -c 'type composer'
docker run --rm -it all bash --login -c 'which composer'
docker run --rm -it all bash --login -c 'composer --version'
docker run --rm -it all which scala
docker run --rm -it all scala -version
docker run --rm -it all bash --login -c 'type scala'
docker run --rm -it all bash --login -c 'which scala'
docker run --rm -it all bash --login -c 'scala -version'
docker run --rm -it all which sbt
docker run --rm -it all sbt sbt-version
docker run --rm -it all bash --login -c 'type sbt'
docker run --rm -it all bash --login -c 'which sbt'
docker run --rm -it all bash --login -c 'sbt sbt-version'
docker run --rm -it all which go
docker run --rm -it all go version
docker run --rm -it all bash --login -c 'type go'
docker run --rm -it all bash --login -c 'which go'
docker run --rm -it all bash --login -c 'go version'
docker run --rm -it all which scala
docker run --rm -it all scala -version
docker run --rm -it all bash --login -c 'type scala'
docker run --rm -it all bash --login -c 'which scala'
docker run --rm -it all bash --login -c 'scala -version'
docker run --rm -it all which sbt
docker run --rm -it all sbt sbt-version
docker run --rm -it all bash --login -c 'type sbt'
docker run --rm -it all bash --login -c 'which sbt'
docker run --rm -it all bash --login -c 'sbt sbt-version'
docker run --rm -it all which activator
docker run --rm -it all bash --login -c 'type activator'
docker run --rm -it all bash --login -c 'which activator'
docker run --rm -it all which fsc
docker run --rm -it all fsc -version
docker run --rm -it all bash --login -c 'type fsc'
docker run --rm -it all bash --login -c 'which fsc'
docker run --rm -it all bash --login -c 'fsc -version'
