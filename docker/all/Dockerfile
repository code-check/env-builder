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

# install Unity
RUN wget --quiet http://download.unity3d.com/download_unity/unity-editor-5.1.0f3+2015091501_amd64.deb
#install gdebi to handle dependencies for you
RUN apt-get install -y gdebi
RUN gdebi /root/unity-editor-5.1.0f3+2015091501_amd64.deb
RUN apt-get install xvfb
RUN apt-get install pulseaudio
RUN echo '#!/bin/bash' >> /usr/bin/xvfb-unity
RUN echo 'xvfb-run /opt/Unity/Editor/Unity -projectPath $1 -batchmode -nographics -executeMethod $2 -resultFilePath=$3 -logFile'
RUN chmod 744 /usr/bin/xvfb-unity
