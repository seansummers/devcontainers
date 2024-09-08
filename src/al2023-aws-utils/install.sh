#! /bin/bash -xe

trap 'dnf -y clean all' EXIT

# AWS CLI and Boto3
dnf install -y \
  awscli-2 \
  python3-awscrt \
  python3-boto3 \
  python3-botocore \
  unzip 

# AWS SAM
PLATFORM="$(uname -m | sed 's/aarch/arm/')"

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "${TMP_DIR}"' EXIT
cd "${TMP_DIR}"
curl -LO "https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-${PLATFORM}.zip
unzip aws-sam-cli-linux-${PLATFORM}.zip
./install --update --install-dir /opt/aws-sam-cli
rm -rf 
popd
