# Code-Check test environment builder
This makes a virtual machine which has several programming languages.

## Packages which installed by this.
- java 8
- node 0.10.x
  - npm
  - typescript
  - coffeescript
  - mocha
- php 5.5
  - composer
- ruby 2.2
- scala 2.11.6
  - sbt 0.13.8
  - activator 1.3.2
- python3

- git 1.9.1
- mysql 5.6

## Prerequisite

- VirtualBox
- Vagrant 1.7 or later
- Ansible

Add ubunt1404 to vagrant box

``` bash
vagrant box add ubuntu1404 https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box
```

Export the private key path for GitHub.  

``` bash
export PRIVATE_KEY_PATH=~/.ssh/id_rsa

```

## Make local environment

``` bash
git clone https://github.com/code-check/env-builder.git code-check-env
cd code-check-env
vagrant up
ansible-playbook setup.yml
```

## Run

``` bash
vagrant ssh
```

## Trouble shooting
### Use vagrant 1.7 or later
The location of ssh private key was changed from 1.7.  
Check existence of .vagrant/machines/default/virtualbox/private_key

### Maintain ~/.ssh/known_hosts
If you destroyed the virtual machine and recreate it.  
Its host signature changes.  
So, you have to remove existing host signature(192.168.33.101) from known_hosts.

## Customize
You can change private ip address from 192.168.33.101 to other by editing following files.

- [Vagrantfile](Vagrantfile)
- [hosts](hosts)
