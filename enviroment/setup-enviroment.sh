#!/bin/bash

echo "Running Homebrew installation script..."
bash "$/script/install-brew.sh"

echo "Installing fswatch..."
brew install fswatch

echo "Installing Docker..."
brew install --cask docker

echo "Installing MySQL..."
brew install mysql

echo "Installing Git..."
brew install git

echo "Installing Visual Studio Code..."
brew install --cask visual-studio-code

echo "Installing JDK 17..."
brew install openjdk@17

echo "Linking JDK 17..."
sudo ln -sfn /usr/local/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk

echo "Installing ngrok.."
brew install ngrok/ngrok/ngrok

echo "Installation completed."