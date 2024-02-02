#!/bin/bash 

# Set the directory to monitor - use the first script argument or the current directory if no argument is provided 
MONITOR_DIR="${1:-$(pwd)}" 

echo "Monitoring $MONITOR_DIR for ._* files..." 

fswatch -0 "$MONITOR_DIR" | xargs -0 -I {} bash -c 'if [[ "{}" =~ /\._[^/]*$ ]]; then rm "{}"; fi'