#! /bin/bash -xe

trap 'dnf -y clean all' EXIT

RYE_VERSION=${RYEVERSION:-"latest"}

dnf install -y \
  gzip \
  libxcrypt-compat

curl -sSf https://rye.astral.sh/get | RYE_HOME=/opt/rye RYE_VERSION="${RYE_VERSION}" RYE_INSTALL_OPTION="--yes" bash -xe
