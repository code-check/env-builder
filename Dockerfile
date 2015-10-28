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
RUN ansible-playbook -i hosts-local all.yml
WORKDIR /root
