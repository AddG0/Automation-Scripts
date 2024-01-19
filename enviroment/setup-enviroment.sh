#!/bin/bash

sudo -v

SCRIPT_DIR=$(dirname "$0")

echo "Running Homebrew installation script..."
bash "$SCRIPT_DIR/install-brew.sh"

# For monitoring file changes
echo "Installing fswatch..."
brew install fswatch

echo "Installing Essentials..."
brew install --cask docker visual-studio-code
brew install git

echo "Installing ngrok.."
brew install ngrok/ngrok/ngrok

echo "Installing anaconda..."
brew install --cask anaconda

echo "Installation completed."