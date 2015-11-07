FROM ubuntu:14.04.2

RUN apt-get install -y software-properties-common aptitude && \
	apt-add-repository -y ppa:ansible/ansible && \
	apt-get update -y && \
	apt-get install -y ansible git curl
        apt-get clean
