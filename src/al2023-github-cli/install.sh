#! /bin/bash -xe

trap 'dnf -y clean all' EXIT

dnf -y install dnf-plugins-core
dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
yum -y install gh
