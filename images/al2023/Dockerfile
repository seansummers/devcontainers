FROM public.ecr.aws/amazonlinux/amazonlinux:2023 as builder
RUN dnf install -y shadow-utils sudo
RUN useradd --comment "vsCode Developer" --no-log-init --create-home --groups wheel vscode
RUN echo "%wheel  ALL=(ALL)  NOPASSWD: ALL" > /etc/sudoers.d/wheel_nopwd
RUN dnf install -y git git-lfs

FROM builder
