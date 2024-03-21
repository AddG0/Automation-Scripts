#!/bin/bash

SCRIPT_DIR=$(dirname "$0")

echo "Running Homebrew installation script..."
bash "$SCRIPT_DIR/install-brew.sh"

echo "Installing Google Chrome..."
brew install --cask google-chrome

echo "Installing Slack..."
brew install --cask slack

echo "Installing Notion..."
brew install --cask notion