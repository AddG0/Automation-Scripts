#!/bin/bash

# Define PKL version
PKL_VERSION="0.25.2"
PKL_EXECUTABLE="pkl"
EXPECTED_VERSION_STRING="Pkl $PKL_VERSION"

# Check if PKL is installed and matches the expected version
if command -v $PKL_EXECUTABLE &> /dev/null; then
    # PKL is installed, check version
    INSTALLED_VERSION=$($PKL_EXECUTABLE --version)
    if [[ "$INSTALLED_VERSION" == *"$EXPECTED_VERSION_STRING"* ]]; then
        echo "PKL version $PKL_VERSION is already installed."
        exit 0
    else
        echo "Different version of PKL is installed. Upgrading to $PKL_VERSION."
        # Remove the existing version
        sudo rm $(which $PKL_EXECUTABLE)
    fi
else
    echo "PKL is not installed. Proceeding with installation."
fi

# Detect architecture
ARCH=$(uname -m)

# Download and install the correct version based on architecture
if [ "$ARCH" = "arm64" ] || [ "$ARCH" = "aarch64" ]; then
    echo "Detected architecture: $ARCH. Downloading aarch64 version of PKL."
    curl -L -o $PKL_EXECUTABLE https://github.com/apple/pkl/releases/download/$PKL_VERSION/pkl-macos-aarch64
elif [ "$ARCH" = "x86_64" ]; then
    echo "Detected architecture: $ARCH. Downloading amd64 version of PKL."
    curl -L -o $PKL_EXECUTABLE https://github.com/apple/pkl/releases/download/$PKL_VERSION/pkl-macos-amd64
else
    echo "Unsupported architecture: $ARCH. Exiting."
    exit 1
fi

# Make PKL executable
chmod +x $PKL_EXECUTABLE

# Move PKL to a bin directory in your PATH (e.g., /usr/local/bin)
sudo mv $PKL_EXECUTABLE /usr/local/bin/

# Verify PKL installation
pkl --version

echo "PKL installation and configuration complete."
