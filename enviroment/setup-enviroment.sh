#!/bin/bash

sudo -v

# Check the current default shell
echo $SHELL

# If it's not /bin/bash, change it to /bin/bash
if [ "$SHELL" != "/bin/bash" ]; then
    chsh -s /bin/bash
    echo "Shell changed to bash."
else
    echo "Default shell is already bash."
fi

SCRIPT_DIR=$(dirname "$0")

echo "Running Homebrew installation script..."
bash "$SCRIPT_DIR/install-brew.sh"
source ~/.bash_profile

# For monitoring file changes
echo "Installing script dependancies..."
brew install fswatch jq

echo "Installing db connection tools..."
brew install mysql-client

echo "Installing Essentials..."
brew install --cask docker visual-studio-code
brew install git

echo "Installing ngrok.."
brew install ngrok/ngrok/ngrok

echo "Installing anaconda..."
brew install --cask anaconda
echo 'export PATH=/opt/homebrew/anaconda3/bin:$PATH' >> ~/.bash_profile
source ~/.bash_profile

conda install conda-forge::openjdk=17 conda-forge::maven python pip

echo "Installation completed."