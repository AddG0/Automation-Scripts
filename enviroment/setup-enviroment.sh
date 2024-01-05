#!/bin/bash

echo "Running Homebrew installation script..."
bash "$/install-brew.sh"

# For monitoring file changes
echo "Installing fswatch..."
brew install fswatch

echo "Installing Essentials..."
brew install --cask docker visual-studio-code
brew install git

echo "Installing ngrok.."
brew install ngrok/ngrok/ngrok

echo "Installing MySQL..."
brew install mysql

echo "Installing JDK 17..."
brew install openjdk@17 maven

echo "Linking JDK 17..."
sudo ln -sfn /usr/local/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk

echo "Installing anaconda..."
brew install --cask anaconda

echo "Installation completed."