#!/bin/bash

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "installed chosen version rye cli" bash -c "rye --version |grep '^rye 0.39.0'"

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
