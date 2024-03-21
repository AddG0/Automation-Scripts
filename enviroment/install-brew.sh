#!/bin/bash

# Function to install Homebrew
install_homebrew() {
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

# Check if Homebrew is installed
if which brew >/dev/null; then
    echo "Homebrew is already installed."
    brew update
    brew upgrade
else
    install_homebrew
    (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zshrc
    eval "$(/opt/homebrew/bin/brew shellenv)"
    source ~/.zshrc
fi

# Check again if Homebrew is successfully installed
if which brew >/dev/null; then
    echo "Homebrew installation was successful."
else
    echo "Homebrew installation failed."
fi
