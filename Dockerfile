FROM ubuntu:14.04.2

RUN apt-get update -y
RUN apt-get install -y software-properties-common aptitude
RUN apt-add-repository -y ppa:ansible/ansible
RUN apt-get install -y ansible git curl
RUN git clone https://github.com/code-check/env-builder.git
RUN ansible-playbook -i "localhost," -c local codecheck.yml
