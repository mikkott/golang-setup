#!/bin/bash

# This script is used to download and install Go programming language.
# It sets the desired Go version and performs the necessary steps to install it.

GO_VER=1.22.4

# Create ~/Downloads directory if it does not exist
mkdir -p ~/Downloads

# Remove any existing Go installation files in the Downloads directory
rm -rf ~/Downloads/go*.linux-amd64.tar.gz

# Download the specified Go version tarball to the Downloads directory
wget -P ~/Downloads https://go.dev/dl/go$GO_VER.linux-amd64.tar.gz ~/Downloads/

# Remove any existing Go installation in /usr/local/go
sudo rm -rf /usr/local/go

# Extract the downloaded Go tarball to /usr/local directory
sudo tar -C /usr/local -xzf ~/Downloads/go$GO_VER.linux-amd64.tar.gz

# Add /usr/local/go/bin to PATH if it does not exist
if [[ ":$PATH:" != *":/usr/local/go/bin:"* ]]; then
    echo 'export PATH="/usr/local/go/bin:$PATH"' >> ~/.bashrc
    source ~/.bashrc
fi

# Reload the .bashrc file to apply the changes
source ~/.bashrc