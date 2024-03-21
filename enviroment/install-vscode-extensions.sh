#!/bin/bash

SCRIPT_DIR=$(dirname "$0")

# Read the file and install each extension
while IFS= read -r EXTENSION; do
    if [ ! -z "$EXTENSION" ]; then  # Skip empty lines
        code --install-extension "$EXTENSION"
    fi
done < "$SCRIPT_DIR/vscode-extensions.txt"

echo "Extensions installation complete."
