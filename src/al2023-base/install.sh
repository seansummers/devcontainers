#! /bin/bash -xe

trap 'dnf -y clean all' EXIT

# Ensure at least the en_US.UTF-8 UTF-8 locale is available.
if [ "${LOCALE_ALREADY_SET}" != "true" ] && ! grep -o -E '^\s*en_US.UTF-8' /etc/environment > /dev/null; then
    echo "LANG=\"en_US.UTF-8\"" >> /etc/environment
    LOCALE_ALREADY_SET="true"
fi

dnf -y install \
  git \
  git-lfs \
  shadow-utils \
  sudo

echo "%wheel  ALL=(ALL)  NOPASSWD: ALL" > /etc/sudoers.d/wheel_nopasswd
useradd --comment "vscode" --no-log-init --create-home --groups wheel vscode
