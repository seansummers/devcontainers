#!/bin/bash

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

/usr/local/share/docker-init.sh

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "correct OS Release" bash -c "cat /etc/os-release |grep 'Amazon Linux'"
check "docker cli" bash -c "docker version"

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
