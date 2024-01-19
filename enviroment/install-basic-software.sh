#!/bin/bash

SCRIPT_DIR=$(dirname "$0")

echo "Running Homebrew installation script..."
bash "$SCRIPT_DIR/install-brew.sh"

echo "Installing google-chrome..."
brew install --cask google-chrome

echo "Installing slack..."
brew install --cask slack