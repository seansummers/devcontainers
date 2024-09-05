#! /bin/bash -xe
# Ensure at least the en_US.UTF-8 UTF-8 locale is available.
# Common need for both applications and things like the agnoster ZSH theme.
if [ "${LOCALE_ALREADY_SET}" != "true" ] && ! grep -o -E '^\s*en_US.UTF-8' /etc/environment > /dev/null; then
    echo "LANG=\"en_US.UTF-8\"" >> /etc/environment
    LOCALE_ALREADY_SET="true"
fi

package_list="\
    dialog \
    glibc-devel \
    htop \
    initscripts \
    iproute \
    iproute-devel \
    jq \
    libicu-devel \
    lsof \
    man-db \
    man-pages \
    net-tools \
    procps-ng \
    psmisc \
    rsync \
    strace \
    unzip \
    vim-minimal \
    wget \
    zip \
"

dnf install -y ${package_list}
