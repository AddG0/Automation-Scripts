#!/bin/bash

# Get the full path of the directory the script is in
scriptDir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Set the relative path to your 'Code' directory
codeFolderPath="$scriptDir/../../Code"

# Convert to absolute path
codeFolderPath="$(cd "$codeFolderPath" && pwd)"

# Check if the directory exists
if [ ! -d "$codeFolderPath" ]; then
    echo "Failed to navigate to '$codeFolderPath'. Please check the path and try again."
    exit 1
fi

# Recursively find and add directories containing a .git folder to Git safe.directory
echo "Adding directories containing a .git folder to Git safe.directory..."
find "$codeFolderPath" -type d -name .git | while read -r gitDir; do
    repoDir=$(dirname "$gitDir")
    git config --global --add safe.directory "$repoDir"
done

echo "Operation completed."
