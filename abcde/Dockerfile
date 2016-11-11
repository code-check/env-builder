FROM ubuntu:14.04.2

ENV OS_USER_NAME codecheck
WORKDIR /root

RUN apt-get update -qq && \
  apt-get upgrade -qqy && \
  apt-get install -qqy software-properties-common aptitude && \
  apt-add-repository -y ppa:git-core/ppa && \
  apt-get update -qq && \
  apt-get upgrade -qqy && \
  apt-get install -qqy git curl unzip wget && \
  rm -rf /var/lib/apt/lists/*

# node
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -qqy nodejs && \
  rm -rf /var/lib/apt/lists/*
RUN npm install -g codecheck@0.6.0 typescript coffee-script babel-cli mocha karma grunt-cli gulp webpack

# python
RUN apt-get update -qq && \
  apt-get install -qqy build-essential libssl-dev libbz2-dev libreadline-dev libsqlite3-dev && \
  rm -rf /var/lib/apt/lists/*
RUN VERSION='3.5.1' && \
  wget https://www.python.org/ftp/python/${VERSION}/Python-${VERSION}.tgz && \
  tar zxvf Python-${VERSION}.tgz && \
  cd Python-${VERSION} && \
  ./configure && \
  make && \
  make install && \
  cd .. && \
  rm -r Python-${VERSION}.tgz Python-${VERSION}
RUN VERSION='2.7.11' && \
  wget https://www.python.org/ftp/python/${VERSION}/Python-${VERSION}.tgz && \
  tar zxvf Python-${VERSION}.tgz && \
  cd Python-${VERSION} && \
  ./configure && \
  make && \
  make install && \
  cd .. && \
  rm -r Python-${VERSION}.tgz Python-${VERSION}
RUN curl --silent https://bootstrap.pypa.io/get-pip.py | python3
RUN curl --silent https://bootstrap.pypa.io/get-pip.py | python
RUN pip install nose
RUN pip3 install nose

# ruby
RUN wget -nv http://ftp.ruby-lang.org/pub/ruby/2.3/ruby-2.3.1.tar.gz && \
  tar -xzvf ruby-2.3.1.tar.gz && \
  cd ruby-2.3.1/ && \
  ./configure && \
  make && \
  make install && \
  cd .. && \
  rm -r ruby-2.3.1
RUN gem update
RUN gem install bundler
RUN gem install rspec --version '2.3.1'
