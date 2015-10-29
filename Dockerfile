FROM ubuntu:14.04.2

RUN apt-get install -y software-properties-common aptitude && \
	apt-add-repository -y ppa:ansible/ansible && \
	apt-get update -y && \
	apt-get install -y ansible git curl

WORKDIR /root
RUN bash -c 'cp .bashrc .bashrc.old && : >.bashrc'
RUN git clone https://github.com/code-check/env-builder.git
WORKDIR /root/env-builder
RUN ansible-playbook -i hosts-local playcircle.yml
WORKDIR /root
