#! /bin/bash -xe

# AWS CLI and Boto3
dnf install -y \
  awscli-2 \
  python3-awscrt \
  python3-boto3

# AWS SAM
PLATFORM=$(uname -m | sed 's/aarch/arm/')
pushd /tmp
curl -LO https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-${PLATFORM}.zip
unzip aws-sam-cli-linux-${PLATFORM}.zip
./install -u
popd
