#!/bin/bash

echo "Running Homebrew installation script..."
bash "$/install-brew.sh"

echo "Installing google-chrome..."
brew install --cask google-chrome

echo "Installing slack..."
brew install --cask slack