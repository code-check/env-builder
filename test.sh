#!/bin/bash -e
docker run --rm -it all which ghc
docker run --rm -it all ghc --version
docker run --rm -it all bash --login -c 'which ghc'
docker run --rm -it all bash --login -c 'ghc --version'
[[ "`docker run --rm all ghc --version`" == *'7.6.3'* ]]
docker run --rm -it all which cabal
docker run --rm -it all cabal --version
docker run --rm -it all bash --login -c 'which cabal'
docker run --rm -it all bash --login -c 'cabal --version'
#[[ "`docker run --rm all cabal --version`" == *'1.22.6.0'* ]]
[[ "`docker run --rm all cabal info hspec`" == *'Versions installed: 2.2.3'* ]]
docker run --rm -it all which gcc
docker run --rm -it all gcc --version
docker run --rm -it all bash --login -c 'which gcc'
docker run --rm -it all bash --login -c 'gcc --version'
[[ "`docker run --rm all gcc --version`" == *'4.8.4'* ]]
docker run --rm -it all which g++
docker run --rm -it all g++ --version
docker run --rm -it all bash --login -c 'which g++'
docker run --rm -it all bash --login -c 'g++ --version'
[[ "`docker run --rm all g++ --version`" == *'4.8.4'* ]]
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
docker run --rm -it all which ruby
docker run --rm -it all ruby --version
docker run --rm -it all bash --login -c 'type ruby'
docker run --rm -it all bash --login -c 'which ruby'
docker run --rm -it all bash --login -c 'ruby --version'
[[ "`docker run --rm all ruby --version`" == *'2.3'* ]]
docker run --rm -it all which java
docker run --rm -it all java -version
docker run --rm -it all bash --login -c 'type java'
docker run --rm -it all bash --login -c 'which java'
docker run --rm -it all bash --login -c 'java -version'
docker run --rm -it all test -f /usr/bin/cabal
docker run --rm -it all which php
docker run --rm -it all php --version
docker run --rm -it all bash --login -c 'which php'
docker run --rm -it all bash --login -c 'php --version'
[[ "`docker run --rm all php --version`" == *'5.6.22-4'* ]]
docker run --rm -it all which phpunit
docker run --rm -it all phpunit --version
docker run --rm -it all which python
docker run --rm -it all python --version
docker run --rm -it all bash --login -c 'which python'
docker run --rm -it all bash --login -c 'python --version'
[[ "`docker run --rm all python -V 2>&1`" == *'2.7.6'* ]]
docker run --rm -it all which python3
docker run --rm -it all python3 --version
docker run --rm -it all bash --login -c 'which python3'
docker run --rm -it all bash --login -c 'python3 --version'
[[ "`docker run --rm all python3 -V 2>&1`" == *'3.4.3'* ]]
docker run --rm -it all which mono
docker run --rm -it all mono --version
docker run --rm -it all bash --login -c 'which mono'
docker run --rm -it all bash --login -c 'mono --version'
[[ "`docker run --rm all mono --version`" == *'3.2.8'* ]]
docker run --rm -it all which rspec
docker run --rm -it all rspec --version
docker run --rm -it all bash --login -c 'which rspec'
docker run --rm -it all bash --login -c 'rspec --version'
[[ "`docker run --rm all rspec --version`" == *'3.4.4'* ]]
docker run --rm -it all which sbcl
docker run --rm -it all sbcl --version
docker run --rm -it all bash --login -c 'which sbcl'
docker run --rm -it all bash --login -c 'sbcl --version'
[[ "`docker run --rm all sbcl --version`" == *'1.1.14'* ]]

