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
source ~/.bash_profile
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
# Check if the PATH export statement is already in .bash_profile
if ! grep -q 'export PATH=/opt/homebrew/anaconda3/bin:$PATH' ~/.bash_profile; then
    echo 'Adding Anaconda to PATH in .bash_profile...'
    echo 'export PATH=/opt/homebrew/anaconda3/bin:$PATH' >> ~/.bash_profile
    source ~/.bash_profile
else
    echo 'Anaconda PATH export already in .bash_profile'
fi

conda install python pip conda-forge::nodejs

echo "Installation completed."