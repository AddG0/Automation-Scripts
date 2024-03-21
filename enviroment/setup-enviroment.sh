#!/bin/bash

sudo -v

SCRIPT_DIR=$(dirname "$0")

echo "Running Homebrew installation script..."
bash "$SCRIPT_DIR/install-brew.sh"
source ~/.zshrc

echo "Installing Git..."
brew install git

# For monitoring file changes
echo "Installing script dependancies..."
brew install fswatch jq

echo "Installing db connection tools..."
brew install mysql-client

echo "Installing Essentials..."
brew install --cask docker visual-studio-code postman

echo "Installing Java..."
curl -s "https://get.sdkman.io" | bash
source ~/.zshrc
sdk install java
sdk install maven

echo "Installing bash..."
brew install bash

echo "Installing pkl..."
bash "$SCRIPT_DIR/install-pkl.sh"

echo "Installing ngrok.."
brew install ngrok/ngrok/ngrok

echo "Installing anaconda..."
brew install --cask anaconda
# Check if the PATH export statement is already in .zshrc
if ! grep -q 'export PATH=/opt/homebrew/anaconda3/bin:$PATH' ~/.zshrc; then
    echo 'Adding Anaconda to PATH in .zshrc...'
    echo 'export PATH=/opt/homebrew/anaconda3/bin:$PATH' >> ~/.zshrc
    source ~/.zshrc
else
    echo 'Anaconda PATH export already in .zshrc'
fi

conda install python pip conda-forge::nodejs

echo "Installation completed."