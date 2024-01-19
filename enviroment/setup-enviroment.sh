#!/bin/bash

sudo -v
chsh -s /bin/bash

SCRIPT_DIR=$(dirname "$0")

echo "Running Homebrew installation script..."
bash "$SCRIPT_DIR/install-brew.sh"

# For monitoring file changes
echo "Installing script dependancies..."
brew install fswatch jq

echo "Installing Essentials..."
brew install --cask docker visual-studio-code caffeine
brew install git

echo "Installing ngrok.."
brew install ngrok/ngrok/ngrok

echo "Installing anaconda..."
brew install --cask anaconda
echo 'export PATH=/opt/homebrew/anaconda3/bin:$PATH' >> ~/.bash_profile

conda install conda-forge::openjdk=17 conda-forge::maven python pip

echo "Installation completed."