FROM ubuntu:14.04.2

ENV OS_USER_NAME codecheck

RUN apt-get install -y software-properties-common aptitude
RUN apt-add-repository -y ppa:ansible/ansible
RUN apt-get update -y
RUN apt-get install -y ansible git curl

WORKDIR /root
RUN bash -c 'cp .bashrc .bashrc.old'
RUN bash -c ': > .bashrc'
RUN git clone https://github.com/code-check/env-builder.git
WORKDIR /root/env-builder
RUN ansible-playbook -i ansible/hosts-local ansible/codecheck.yml
WORKDIR /root

# Recover bashrc
RUN bash -c 'cat .bashrc.old >> .bashrc'
RUN bash -c 'rm .bashrc.old'
RUN bash -c 'cat .bashrc >> .profile'

RUN wget https://services.gradle.org/distributions/gradle-2.7-bin.zip \
  && unzip gradle-2.7-bin.zip -d /usr/local/share/ \
  && rm gradle-2.7-bin.zip
ENV PATH $PATH:/usr/local/share/gradle-2.7/bin

RUN wget https://bintray.com/artifact/download/groovy/maven/apache-groovy-binary-2.4.5.zip \
  && unzip apache-groovy-binary-2.4.5.zip -d /usr/local/share/ \
  && rm apache-groovy-binary-2.4.5.zip
ENV PATH $PATH:/usr/local/share/groovy-2.4.5/bin

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g codecheck@0.5.3 typescript coffee-script babel-cli mocha karma grunt-cli gulp webpack

# scala environment
WORKDIR /root/tmp
RUN sbt -sbt-version 0.13.5
RUN sbt -sbt-version 0.13.6
RUN sbt -sbt-version 0.13.7
RUN sbt -sbt-version 0.13.8
RUN sbt -sbt-version 0.13.9
RUN git clone https://github.com/skohar/cache-for-scala-sbt.git
RUN cd cache-for-scala-sbt && git checkout scala2.11.7-sbt-1.13.5 && sbt compile
WORKDIR /root
RUN rm -r /root/tmp

RUN gem install bundler

RUN mkdir .go
RUN echo 'export GOPATH="$HOME/.go"' >> '.profile'
