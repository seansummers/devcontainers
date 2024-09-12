#! /bin/bash -xe

trap 'dnf -y clean all' EXIT

dnf -y install \
    gzip \
    jq \
    tar

PLATFORM="$(uname -m)"
JUST_VERSION="$(curl -s https://api.github.com/repos/casey/just/releases/latest | jq -r .tag_name)"
DIST="just-${JUST_VERSION}-${PLATFORM}-unknown-linux-musl.tar.gz"

mkdir --parents "${HOME}/.local/bin"
curl -sL "https://github.com/casey/just/releases/download/${JUST_VERSION}/${DIST}" \
| tar --directory="/usr/local/bin" --gunzip --extract just
