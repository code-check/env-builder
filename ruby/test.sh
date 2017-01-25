#!/bin/bash -eu
docker run --rm -it ruby which node
docker run --rm -it ruby node --version
docker run --rm -it ruby bash --login -c 'which node'
docker run --rm -it ruby bash --login -c 'node --version'
[[ "`docker run --rm -it ruby bash --login -c 'node --version'`" == *'v6.9.1'* ]]
docker run --rm -it ruby which codecheck
docker run --rm -it ruby codecheck
docker run --rm -it ruby bash --login -c 'which codecheck'
docker run --rm -it ruby bash --login -c 'codecheck'
docker run --rm -it ruby which ruby
docker run --rm -it ruby ruby --version
docker run --rm -it ruby bash --login -c 'type ruby'
docker run --rm -it ruby bash --login -c 'which ruby'
docker run --rm -it ruby bash --login -c 'ruby --version'
[[ "`docker run --rm ruby ruby --version`" == *'2.3'* ]]
docker run --rm -it ruby which python
docker run --rm -it ruby python --version
docker run --rm -it ruby bash --login -c 'which python'
docker run --rm -it ruby bash --login -c 'python --version'
[[ "`docker run --rm ruby python -V 2>&1`" == *'2.7.11'* ]]
docker run --rm -it ruby pip --version
docker run --rm -it ruby bash --login -c 'which pip'
docker run --rm -it ruby bash --login -c 'pip --version'
[[ "`docker run --rm ruby pip --version`" == 'pip 8.1.2 from /usr/local/lib/python2.7/site-packages (python 2.7)' ]]
docker run --rm -it ruby which python3
docker run --rm -it ruby python3 --version
docker run --rm -it ruby bash --login -c 'which python3'
docker run --rm -it ruby bash --login -c 'python3 --version'
[[ "`docker run --rm ruby python3 -V 2>&1`" == *'3.5.1'* ]]
docker run --rm -it ruby which pip3
docker run --rm -it ruby pip3 --version
docker run --rm -it ruby bash --login -c 'which pip3'
docker run --rm -it ruby bash --login -c 'pip3 --version'
[[ "`docker run --rm ruby pip3 --version`" == 'pip 8.1.2 from /usr/local/lib/python3.5/site-packages (python 3.5)' ]]
docker run --rm -it ruby which rspec
docker run --rm -it ruby rspec --version
docker run --rm -it ruby bash --login -c 'which rspec'
docker run --rm -it ruby bash --login -c 'rspec --version'
[[ "`docker run --rm ruby rspec --version`" == *'3.4.4'* ]]

