#! /bin/bash -xe

ARCH="$(uname -m | sed s/aarch/arm/)"

mkdir -p ~/.local/bin

# uv for python
hash uv 2>/dev/null || curl -LsSf https://astral.sh/uv/install.sh | sh

# tool updates
sudo apt-get update
sudo apt-get install -y \
  git-lfs \
  pre-commit \
  yamllint

# tenv for Tofu, Terragrunt, Terraform, atmos
if ! hash tenv 2>/dev/null
then
  FILTER_PREFIX=".assets[].browser_download_url|select(match("
  DEB_FILTER="${FILTER_PREFIX}\"_${ARCH}.deb$\"))"
  TENV_RELEASE=$(curl -sL https://api.github.com/repos/tofuutils/tenv/releases/latest | jq -r "${DEB_FILTER}")
  TMP=$(mktemp)
  curl -sL -o ${TMP} "${TENV_RELEASE}" && sudo dpkg -i "${TMP}" && rm -f ${TMP}
fi

# # okta SSO helper
# if ! hash okta-aws-cli 2>/dev/null
# then
#   yum install -y xdg-utils
#   TGZ_FILTER="${FILTER_PREFIX}\"linux_${ARCH}.tar.gz$\"))"
#   OKTA_RELEASE=$(curl -sL https://api.github.com/repos/okta/okta-aws-cli/releases/latest | jq -r "${TGZ_FILTER}")
#   curl -sL "${OKTA_RELEASE}" | tar -C ~/.local/bin -xz okta-aws-cli
# fi
