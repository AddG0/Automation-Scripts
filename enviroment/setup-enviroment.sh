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

echo "Installing ngrok.."
brew install ngrok/ngrok/ngrok

echo "Installing anaconda..."
brew install --cask anaconda
echo 'export PATH=/opt/homebrew/anaconda3/bin:$PATH' >> ~/.bash_profile
source ~/.bash_profile

conda install conda-forge::openjdk=17 conda-forge::maven python pip

# Check if Git is installed
if ! type git > /dev/null 2>&1; then
    echo "Installing Git..."
    brew install git
    
    # Set Git global configuration
    echo "Setting up Git global configuration..."
    read -p "Enter your Git global username: " git_username
    read -p "Enter your Git global email: " git_email
    git config --global user.name "$git_username"
    git config --global user.email "$git_email"
else
    echo "Git is already installed."
fi

echo "Installation completed."