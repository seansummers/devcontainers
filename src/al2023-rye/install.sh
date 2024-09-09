#! /bin/bash -xe

trap 'dnf -y clean all' EXIT

RYE_VERSION=${RYEVERSION:-"latest"}

dnf install -y \
  findutils \
  gzip \
  libxcrypt-compat

curl -sSf https://rye.astral.sh/get | RYE_HOME=/opt/rye RYE_VERSION="${RYE_VERSION}" RYE_INSTALL_OPTION="--yes" bash -xe

chgrp --recursive wheel /opt/rye
find /opt/rye -type d -exec chmod --recursive ug+rwx {} +
