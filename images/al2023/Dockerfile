FROM public.ecr.aws/amazonlinux/amazonlinux:2023 as devcontainer-base
RUN dnf install -y git git-lfs shadow-utils sudo && \
    useradd --comment "vsCode Developer" --no-log-init --create-home --groups wheel vscode && \
    echo "%wheel  ALL=(ALL)  NOPASSWD: ALL" > /etc/sudoers.d/wheel_nopwd
