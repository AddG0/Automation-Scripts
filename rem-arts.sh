#!/bin/bash 

# Set the directory to monitor - use the first script argument or the current directory if no argument is provided 
MONITOR_DIR="${1:-$(pwd)}" 

echo "Monitoring $MONITOR_DIR for ._* files..." 

fswatch -0 "$MONITOR_DIR" | while IFS= read -r -d '' file; do
    if [[ "$file" =~ /\._[^/]*$ ]]; then
        if [ -f "$file" ]; then
            rm "$file"
        else
            echo "File does not exist or is not a regular file: $file"
        fi
    fi
done
