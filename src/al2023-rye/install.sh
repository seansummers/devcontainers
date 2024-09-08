#! /bin/bash -xe

RYE_VERSION=${RYEVERSION:-"latest"}

dnf install -y \
  gzip \
  libxcrypt-compat

curl -sSf https://rye.astral.sh/get | RYE_VERSION="${RYE_VERSION}" RYE_INSTALL_OPTION="--yes" bash -xe
