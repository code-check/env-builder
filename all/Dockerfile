FROM ubuntu:14.04.2

ENV OS_USER_NAME codecheck
WORKDIR /root

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y software-properties-common aptitude && \
  apt-add-repository -y ppa:ansible/ansible && \
  apt-add-repository -y ppa:git-core/ppa && \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y ansible git curl unzip wget && \
  rm -rf /var/lib/apt/lists/*

# go
RUN wget https://storage.googleapis.com/golang/go1.4.2.linux-amd64.tar.gz && \
  tar -C /usr/local -xzf go1.4.2.linux-amd64.tar.gz && \
  rm go1.4.2.linux-amd64.tar.gz
ENV PATH $PATH:/usr/local/go/bin

# clang
RUN apt-get update && \
  apt-get install -y gcc-4.8 g++-4.8 && \
  rm -rf /var/lib/apt/lists/*
RUN apt-get update && \
  apt-get install -y clang-3.4 libclang-common-3.4-dev libclang-3.4-dev libclang1-3.4 libclang1-3.4-dbg libllvm-3.4-ocaml-dev libllvm3.4 libllvm3.4-dbg lldb-3.4 llvm-3.4 llvm-3.4-dev llvm-3.4-runtime clang-modernize-3.4 clang-format-3.4 python-clang-3.4 lldb-3.4-dev && \
  rm -rf /var/lib/apt/lists/*

# haskell
RUN apt-add-repository -y ppa:hvr/ghc && \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y ghc-7.8.4 ghc-haddock ghc-prof alex-3.1.4 happy-1.19.5 cabal-install-1.22 && \
  rm -rf /var/lib/apt/lists/*
RUN ln -s /usr/bin/cabal-1.22 /usr/bin/cabal
RUN cabal update
RUN cabal install hspec

# ocaml
RUN apt-get update && \
  apt-get upgrade && \
  apt-get install -y ocaml && \
  rm -rf /var/lib/apt/lists/*

# perl
RUN apt-get update && \
  apt-get upgrade && \
  apt-get install -y perl && \
  rm -rf /var/lib/apt/lists/*

# python
RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y python-all-dev python-setuptools python-pip python3-all-dev python3-setuptools python3-pip && \
  rm -rf /var/lib/apt/lists/*
RUN pip install nose
RUN pip3 install nose

# ruby
RUN apt-add-repository -y ppa:brightbox/ruby-ng && \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y ruby2.2 ruby2.2-dev && \
  rm -rf /var/lib/apt/lists/*
RUN gem update
RUN gem install bundler
RUN gem install rspec
ENV PATH $PATH:/room/.gem/ruby/2.2.0/bin

# php
RUN LANG=C.UTF-8 apt-add-repository -y ppa:ondrej/php && \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y php5.6 php5.6-cli php5.6-common php5.6-curl php5.6-gd php5.6-json php5.6-mcrypt php5.6-mysql php5.6-pgsql php5.6-sqlite && \
  rm -rf /var/lib/apt/lists/*
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
RUN wget https://phar.phpunit.de/phpunit.phar && \
  chmod +x phpunit.phar && \
  mv phpunit.phar /usr/local/bin/phpunit

# mono
RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y --no-install-recommends mono-complete monodevelop monodevelop-nunit nunit-console && \
  rm -rf /var/lib/apt/lists/*
ENV MONO_PATH /usr/lib/monodevelop/AddIns/NUnit

# gradle
RUN wget https://services.gradle.org/distributions/gradle-2.7-bin.zip \
  && unzip gradle-2.7-bin.zip -d /usr/local/share/ \
  && rm gradle-2.7-bin.zip
ENV PATH $PATH:/usr/local/share/gradle-2.7/bin

# groovy
RUN wget https://bintray.com/artifact/download/groovy/maven/apache-groovy-binary-2.4.5.zip \
  && unzip apache-groovy-binary-2.4.5.zip -d /usr/local/share/ \
  && rm apache-groovy-binary-2.4.5.zip
ENV PATH $PATH:/usr/local/share/groovy-2.4.5/bin

# node
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get install -y nodejs && \
  rm -rf /var/lib/apt/lists/*
RUN npm install -g codecheck@0.5.4 typescript coffee-script babel-cli mocha karma grunt-cli gulp webpack

# java
RUN apt-add-repository -y ppa:webupd8team/java && \
  apt-get update && \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | tee /etc/oracle-java-8-licence-acceptance | /usr/bin/debconf-set-selections && \
  apt-get install -y oracle-java8-installer ca-certificates oracle-java8-set-default maven && \
  rm -rf /var/lib/apt/lists/*

# scala environment
RUN mkdir -p /usr/local/share/scala/2.11.7
RUN wget http://www.scala-lang.org/files/archive/scala-2.11.7.tgz \
  && tar xzf scala-2.11.7.tgz -C /usr/local/share/scala/2.11.7 \
  && rm scala-2.11.7.tgz
RUN ln -s /usr/local/share/scala/2.11.7/scala-2.11.7/bin/scala /usr/local/bin/scala
RUN ln -s /usr/local/share/scala/2.11.7/scala-2.11.7/bin/fsc /usr/local/bin/fsc

# sbt
RUN mkdir -p /usr/local/share/sbt/0.13.9
RUN wget https://dl.bintray.com/sbt/native-packages/sbt/0.13.9/sbt-0.13.9.tgz \
  && tar xzf sbt-0.13.9.tgz -C /usr/local/share/sbt/0.13.9 \
  && rm sbt-0.13.9.tgz
RUN ln -s /usr/local/share/sbt/0.13.9/sbt/bin/sbt /usr/local/bin/sbt
WORKDIR /root/tmp
RUN sbt -sbt-version 0.13.5
RUN sbt -sbt-version 0.13.6
RUN sbt -sbt-version 0.13.7
RUN sbt -sbt-version 0.13.8
RUN sbt -sbt-version 0.13.9
RUN git clone https://github.com/shok4a/cache-for-scala-sbt.git
RUN cd cache-for-scala-sbt && git checkout scala2.11.7-sbt-1.13.5 && sbt compile
WORKDIR /root
RUN rm -r /root/tmp

# activator
RUN mkdir -p /usr/local/share/activator/1.3.2
RUN wget http://downloads.typesafe.com/typesafe-activator/1.3.2/typesafe-activator-1.3.2-minimal.zip \
  && unzip typesafe-activator-1.3.2-minimal.zip -d /usr/local/share/activator/1.3.2 \
  && rm typesafe-activator-1.3.2-minimal.zip
RUN ln -s /usr/local/share/activator/1.3.2/activator-1.3.2-minimal/activator /usr/local/bin/activator

RUN mkdir .go
ENV GOPATH /root/.go
ENV PATH $PATH:/usr/local/go/bin

