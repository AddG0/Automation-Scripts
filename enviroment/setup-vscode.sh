#!/bin/bash

SCRIPT_DIR=$(dirname "$0")

# Paths to the original and new settings files
ORIGINAL_SETTINGS_FILE="$HOME/Library/Application Support/Code/User/settings.json"
NEW_SETTINGS_FILE="$SCRIPT_DIR/config/vscode/settings.json"
EXTENSIONS_FILE="$SCRIPT_DIR/config/vscode/extensions.txt"

# Check and create original settings file if not exists
if [ ! -f "$ORIGINAL_SETTINGS_FILE" ]; then
    echo "Original settings file not found. Creating a new one."
    mkdir -p "$(dirname "$ORIGINAL_SETTINGS_FILE")"
    echo "{}" > "$ORIGINAL_SETTINGS_FILE"
fi

# Check if the new settings file exists
if [ ! -f "$NEW_SETTINGS_FILE" ]; then
    echo "New settings file not found: $NEW_SETTINGS_FILE"
    exit 1
fi

# Merge settings
jq -s '.[1] * .[0]' "$ORIGINAL_SETTINGS_FILE" "$NEW_SETTINGS_FILE" > merged_settings.json

# Check if merge was successful
if [ $? -eq 0 ]; then
    mv merged_settings.json "$ORIGINAL_SETTINGS_FILE"
    echo "VS Code settings have been successfully updated with original settings taking precedence."
else
    echo "Failed to merge VS Code settings."
    exit 1
fi

# Install VS Code extensions
if [ -f "$EXTENSIONS_FILE" ]; then
    cat $EXTENSIONS_FILE | while read extension || [[ -n $extension ]];
    
    do
        code --install-extension $extension
    done
    echo "VS Code extensions installation complete."
else
    echo "VS Code extensions file not found: $EXTENSIONS_FILE"
fi