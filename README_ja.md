[![Circle CI](https://circleci.com/gh/code-check/env-builder.svg?style=svg)](https://circleci.com/gh/code-check/env-builder)

# コードチェック　テスト環境ビルダー

このビルダーは、プログラミング言語を持つ仮想マシンを作成できます。

## ビルダーによってインストールされるパッケージ
- java 8
- node 0.12.x
  - nvm
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
- git 2.x
- mysql 5.6

## 必要な環境

- VirtualBox
- Vagrant 1.7以上
- Ansible

vagrant boxにubuntu14.04を以下の場所に追加してください。

``` bash
vagrant box add ubuntu1404 https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box
```

And then make your own Vagrantfile and hosts.
次に、Vagrantのファイルを作ってください
For vagrant, you have [Vagrantfile.sample](Vagrantfile.sample). Also , [hosts-vagrant](hosts-vagrant), and [hosts-local](hosts-local) are provided for hosts sample file.
IP address setting for [Vagrantfile.sample](Vagrantfile.sample) and [hosts-vagrant](hosts-vagrant) are connected, so just running commands below would be an easiest way to start.

```bash
$ mv Vagrantfile{.sample,}
$ mv hosts{-vagrant,}
```

Export the private key path for GitHub and OS user name of guest PC.  
ゲストPCのユーザーネームOSやGithubのプライベートキーのパスをエクスポートしてください。

``` bash
export PRIVATE_KEY_PATH=~/.ssh/id_rsa
export OS_USER_NAME=vagrant
```

## ローカル環境を作成してください。
全てのロールは.yml形式に含まれます。
もし使用しているロールを選びたい場合は、自身のyamlファイルを作成してください。

``` bash
git clone https://github.com/code-check/env-builder.git code-check-env
cd code-check-env
vagrant up
ansible-playbook all.yml
```

## 実行

``` bash
vagrant ssh
```

## トラブルシューティング
### vagrant 1.7もしくはそれ以上のバージョンを使用してください。
sshのプライベートキーの場所はバージョン1.7から変更されました。
.vagrant/machines/default/virtualbox/private_keyのようにprivvat_keyがあることを確認してください。

### ~/.ssh/known_hostsを整理してください。
仮想マシンが壊れ、作りなおした場合。
ホスト名を変更してください。
known_hostsから使用中のホスト(192.168.33.101)を削除してください。
