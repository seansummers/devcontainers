#!/bin/bash

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "installed just" bash -c "just -V | grep '^just '"

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
