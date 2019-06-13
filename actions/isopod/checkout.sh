#!/bin/bash
set -e

# Expected ENV variables
# $SSH_PRIVATE_KEY
# $GIT_REPO_URL

# Command to test script
# docker run -it -e SSH_PRIVATE_KEY=(cat ../../id_ed25519 | base64) \
#   -e GIT_REPO_URL=git@github.com:ricardo-ch/delivery-demo.git \
#   platform/isopod /usr/local/bin/checkout.sh

# Store private SSH key
mkdir -p ~/.ssh
echo $SSH_PRIVATE_KEY
echo $SSH_PRIVATE_KEY | base64 -d > ~/.ssh/id_rsa
chmod 400 ~/.ssh/id_rsa

# Checkout repository
git clone $GIT_REPO_URL ~/.ricardo/delivery

# Output repository content for debugging
pushd ~/.ricardo/delivery  > /dev/null
echo "checked out ${GIT_REPO_URL} revision $(git rev-parse HEAD)"
popd  > /dev/null
